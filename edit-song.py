#!/usr/bin/python3

import sys
import os
import re
from getopt import gnu_getopt
from pathlib import Path


def parse_args(argv):
    options, remainder = gnu_getopt(
        argv[1:], 'd:t:c', ['directory=', 'text=', 'clean'])
    
    directory = text = None
    clean = False
    for opt, arg in options:
        if opt in ('-d', '--directory'):
            directory = Path(arg)
            if not Path.is_dir(directory):
                print('path does not exist')
                sys.exit(1)
        elif opt in ('-t', '--text'):
            text = arg
        elif opt in ('-c', '--clean'):
            clean = True

    # if one of dir or text is not specified then error
    # if directory is None and text is not None or directory is not None and text is None:
    #     print('include both directory name and text to insert')
    #     sys.exit(1)

    edit_files(directory, text, clean)

def get_filtered_name(song, res):
   return song[:res.start()] + song[res.end():]


def cleanup(directory):
    for i in directory.iterdir():
        new_name = None
        song = str(i)[len(str(directory)) + 1:] if str(directory) != '.' else str(i)

        if song == 'songs.txt' or song == 'set-album-name.sh' or song == 'temp' or song == 'edit-song.py':
            continue

        pattern = re.compile(r'\s(\(\w+\s\w+\)|\[\w+\s\w+\])')
        res = pattern.search(song)
        if res is not None:
            new_name = get_filtered_name(song, res)
            # print('old', song)
            # print('new', new_name)

        pattern2 = re.compile(r'-NA')
        res2 = None
        if new_name is not None:
            res2 = pattern2.search(new_name)
        else:
            res2 = pattern2.search(song)
        if res2 is not None:
            if new_name is not None:
                new_name = get_filtered_name(new_name, res2)
            else:
                new_name = get_filtered_name(song, res2)
            # print('old', song)
            # print('new', new_name)

        if new_name is not None:
            new_path = directory.absolute()/new_name
            # print(new_path)
            i.rename(new_path)
        # os.rename(i, new_path)


def edit_files(directory, text, clean):
    if clean:
        cleanup(directory)
        sys.exit(0)
    for i in directory.iterdir():
        # remove the path
        song = str(i)[len(str(directory)) + 1:] if str(directory) != '.' else str(i)
    
        if song == 'set-album-name.sh' or song == 'temp' or song == 'edit-song.py':
            continue
        
        pattern = re.compile(r'.mp3')
        res = pattern.search(song)
        if res is not None:
            # separate filename from extension
            begin = song[:res.start()]
            new_text = begin + ' - ' + text + '.mp3'
            music_dir = Path.home()/"Music"
            new_path = music_dir/new_text
            # print(new_path)
            # rename and move to the ~/Music folder
            i.rename(new_path)
            ## update the database
            os.system('mpc update &>/dev/null')
    


def main():
    argc = len(sys.argv)
    argv = sys.argv
    parse_args(argv)

if __name__ == '__main__':
    main()
