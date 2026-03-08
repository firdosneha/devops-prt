- hosts: master
  become: yes

  tasks:

  - name: install java
    apt:
      name: openjdk-17-jdk
      state: present
      update_cache: yes

  - name: install jenkins
    apt:
      name: jenkins
      state: present
