#!/usr/bin/env python
from subprocess import Popen, PIPE
import configparser
import os

if __name__ == '__main__':
    config = configparser.ConfigParser()
    config.read('submodules')
    for sec in config.sections():
        cmd = ['git',  'clone', config[sec]['url'], os.path.normpath(os.path.join('..', config[sec]['path']))]
        print(' '.join(cmd)) 
        try:
            process = Popen(cmd, stdout=PIPE, stderr=PIPE)
            stdout, stderr = process.communicate()
            print(stdout)
        except Exception as e:
            print('failed: ' + e.message)
