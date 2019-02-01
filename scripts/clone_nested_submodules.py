#!/usr/bin/env python
from subprocess import Popen, PIPE
import configparser
import os

if __name__ == '__main__':
config = configparser.ConfigParser()

config.read('submodules')

print(config.sections())

for sec in config.sections():
    try:
        process = Popen(['git',  'clone', config[sec]['url']], stdout=PIPE,
                        stderr=PIPE, cwd=os.path.normalpath(os.path.join('..', config[sec]['path'])))
        stdout, stderr = process.communicate()
        print(stdout)
    except:
        pass
