#!/bin/env python
import os
import re


def extract_url(git_folder):
    git_config_filename = os.path.normpath(os.path.join(git_folder, 'config'))
    if not os.path.exists(git_config_filename):
        print('There is no config file in "{}"'.format(git_folder))
        return None
    pat = re.compile('\s*url\s*=\s*(?P<url>(https?):((//)|(\\\\))+[\w\d:#@%/;$()~_?\+-=\\\.&]*)')
    with open(git_config_filename, 'r') as conf:
        for line in conf:
            m = re.match(pat, line)
            if (m is not None) and (m.group('url') is not None):
                return m.group('url')

def search_submodules(root_path, level=0, max_depth=3):
    if max_depth == 0: 
        return []
    submodules = [ ]
    for sub_path in os.listdir(root_path):
        full_path = os.path.normpath(os.path.join(root_path, sub_path))
        # print('processing "{}"'.format(full_path))
        if os.path.isdir(full_path):
            if level == 0 and sub_path == '.git':
                continue
            if sub_path == '.git':
                submodules.append({
                    'path': os.path.dirname(full_path),
                    'url': extract_url(full_path)
                    })
            else:
                submodules += search_submodules(full_path, level + 1, max_depth - 1)
    return submodules


def generator_gitsubmodule(root_path):
    submodules = search_submodules(root_path, max_depth=7)
    with open(os.path.normpath(os.path.join(root_path, '.gitmodules')), 'w') as fp:
        for submodule in submodules:
            path = os.path.relpath(submodule["path"], start=root_path)
            name = os.path.basename(path)
            url  = submodule["url"]
            fp.write(
                '[submodule "{name}"]\n\tpath = {path}\n\turl = {url}\n'.format(
                    name=name,
                    path=path,
                    url = url)
            )
if __name__ == '__main__':
    #print(extract_url('../.git'))
    #print(search_submodules('..', max_depth=5))
    generator_gitsubmodule(root_path='..')
