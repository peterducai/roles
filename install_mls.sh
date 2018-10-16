#!/bin/bash


yum install selinux-policy-mls policycoreutils-python -y
useradd -Z user_u john
passwd john
semanage login --modify --seuser user_u --range s2:c100 john
chcon -R -l s2:c100 /home/john #correct home folder label
semanage login -l
