Name
=========
Ansible-nginx build and test framework that uses docker and ansible.

Description
------------
When running the script described in the Usage section, it will build two docker containers and test a basic ansible nginx role. If everything runs successfully you should have two docker container with success tagged next to their name.

Requirements
--------------
- sudo pip install docker 
- Note: be sure you dont have docker-py installed, if you do please remove it before installing docker module. They conflict with eachother. This inventory script requires it.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: ansible-nginx }

Usage
-------
    Usage: ./orchestrate.sh <option> 
    
    Arguments:
      -h, --help   help menu
      -run --run


License
-------

BSD

Author Information
------------------

mtmcgrath
