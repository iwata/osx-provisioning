#!/usr/bin/env python

import json
import os


def main():
    python_interp = os.popen('which python').read().rstrip()
    java_home = os.popen('/usr/libexec/java_home').read().rstrip()
    google_ime = os.popen('which gskkserv').read().rstrip()

    print(json.dumps({
        'localhost': {
            'hosts': [
                '127.0.0.1'
            ]
        },
        '_meta': {
            'hostvars': {
                '127.0.0.1': {
                    'ansible_connection': 'local',
                    'ansible_python_interpreter': python_interp,
                    'ansible_java_path': '%s/bin/java' % java_home,
                    'ansible_google_ime_path': google_ime,
                    'ansible_user_dir': os.environ['HOME'],
                    'ansible_user_id': os.environ['USER'],
                    'ansible_repos_dir': '%s/repos' % os.environ['HOME']
                    }
                }
            }
        }))


if __name__ == '__main__':
    main()
