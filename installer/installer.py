#!/usr/bin/env python3
#----------------------------------------------------------------------------------------------------------------------
# prettytex installer tool
#
# version: 0.0.1
# author : lphilmossb
#----------------------------------------------------------------------------------------------------------------------
import requests
import os
import json
from enum import Enum
from shutil import rmtree

class Branch(Enum):
    REFACTOR = 'refactor'
    MAIN = 'master'

    def __str__(self):
        return str(self.value)

GLOBAL_INSTALL_DIR = 'texmf/tex/latex/prettytex'
CACHE_LOCATION = os.path.expanduser('~')
CACHE_NAME = '.prettytex'
BASE_URL = 'https://raw.githubusercontent.com/MrP01/prettytex/refs/heads'
API_URL = 'https://api.github.com/repos/MrP01/prettytex'
BRANCH = Branch.REFACTOR
INSTALLABLE_EXTENSIONS = ('sty', 'cls')
CACHE_DATA = 'data.json'

def get_package_url(package : str, branch) -> str:
    return f'{BASE_URL}/{branch}/{package}'

def download_package(package : str, branch, location : str = 'prettytex') -> None:
    if not os.path.isdir(location):
        raise ValueError(f'{location} is not a directory, aborting')
    
    url = get_package_url(package, branch)
    file_path = f'{location}/{package.split('/')[-1]}'
    response = requests.get(url)
    rcode = 0

    if response.status_code == 200:
        with open(file_path, 'wb') as file:
            file.write(response.content)
            print(f'successfully downloaded {package} from {branch}')
            rcode = 1
    elif response.status_code == 404:
        print(f'could not find {package} on {branch}')
    else:
        print(f'request failed, status {response.status_code}')
    
    return rcode

def select_input(prompt, options):
    for index, option in enumerate(options):
        print(f'[{index}] {option}')

    option_indices = list(range(0,len(options)))
    valid_choice = False
    choice = ''

    while not valid_choice:
        choice = input(f'{prompt} (leave blank for 0): ')

        if choice in options or choice == '':
            valid_choice = True
            if choice == '':
                choice = options[0]
        else:
            try:
                if int(choice) in option_indices:
                    choice = options[int(choice)]
                    valid_choice = True
                else:
                    print('no such branch, please try again')
            except ValueError:
                print('no such branch, please try again')
    
    return Branch(choice)

def select_range(prompt, options, delimiter = ','):
    for index, path in enumerate(options):
        print(f'[{index}] {path}')

    option_indices = list(range(0, len(options)))
    valid_selection = False
    selections = []

    while not valid_selection:
        raw_selection = ''.join(input(f'{prompt} (separate by \'{delimiter}\' leave blank for all): ').split())
        if raw_selection == '':
            selections = options
            valid_selection = True
            continue
        
        try:
            indices = [int(sel) for sel in raw_selection.split(delimiter)]
            for index in indices:
                if index < 0 or index > option_indices[-1]:
                    print(f'index {index} is out of range, ignoring it')
                else:
                    selections.append(options[index])
            valid_selection = True
        except ValueError:
            print('please make a valid selection (e.g. 0,1)')
    
    return selections
    
def check_extension(path, extensions):
    file = path.split('/')[-1]
    match = False
    try:
        name, extension = file.split('.')
        match = extension in extensions
    except ValueError:
        match = False
    return match


def get_list_of_remote_files(branch):
    url = f'{API_URL}/git/trees/{branch}?recursive=1'
    response = requests.get(url)
    filelist = []

    if response.status_code == 200:
        json_response = json.loads(response.content)
        tree = json_response['tree']
        for node in tree:
            path = node['path']
            if check_extension(path, INSTALLABLE_EXTENSIONS):
                filelist.append(path)
    else:
        print(f'error getting file-list: {response.status_code}')
    
    return filelist


def cache():
    branch = select_input('select the branch you want to use', [branch.value for branch in Branch])

    print(f'using branch {branch}', end='\n\n')
    print('getting file-list')
    remote_installables = get_list_of_remote_files(branch)
    print(remote_installables)
    to_download = select_range('select files to download', remote_installables)
    

    if not to_download:
        print('no files selected, aborting')
        exit(1)

    if not os.path.exists(f'{CACHE_LOCATION}/{CACHE_NAME}'):
        print('cache directory does not exist, creating it')
        os.mkdir(f'{CACHE_LOCATION}/{CACHE_NAME}')

    if not os.path.exists(f'{CACHE_LOCATION}/{CACHE_NAME}/cache/'):
        os.mkdir(f'{CACHE_LOCATION}/{CACHE_NAME}/cache/')

    if not os.path.exists(f'{CACHE_LOCATION}/{CACHE_NAME}/cache/{branch}'):
        os.mkdir(f'{CACHE_LOCATION}/{CACHE_NAME}/cache/{branch}')

    for path in to_download:
        print(f'downloading {path}')
        status = download_package(path, branch, f'{CACHE_LOCATION}/{CACHE_NAME}/cache/{branch}')

def global_install():
    if os.path.exists(f'{CACHE_LOCATION}/{GLOBAL_INSTALL_DIR}'):
        rmtree(f'{CACHE_LOCATION}/{GLOBAL_INSTALL_DIR}')
    
    os.mkdir(f'{CACHE_LOCATION}/{GLOBAL_INSTALL_DIR}')

    branch = select_input('select the branch you want to use', [branch.value for branch in Branch])

    print(f'using branch {branch}', end='\n\n')
    print('getting file-list')
    remote_installables = get_list_of_remote_files(branch)
    to_download = select_range('select files to download', remote_installables)

    if not to_download:
        print('no files selected, aborting')
        exit(1)

    for path in to_download:
        print(f'downloading {path}')
        status = download_package(path, branch, f'{CACHE_LOCATION}/{GLOBAL_INSTALL_DIR}')


if __name__ == '__main__':
    global_install()