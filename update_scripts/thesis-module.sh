#! /bin/bash

# Change directory to the repository
cd ~/hasob/tetfund-thesis-digitilization-module

# Pull the latest changes from repository
git pull

#change directory
cd ~/hasob


# Set the input file or directory and output tarball name

INPUT_DIR_1="./tetfund-thesis-digitilization-module"
OUTPUT_TAR_DIR_1="tetfund-thesis-digitilization-module.tar.gz"


# Create the tar file
tar -czf "$OUTPUT_TAR_DIR_1" "$INPUT_DIR_1"


# Transfer to server
# TERAS
scp -r "$OUTPUT_TAR_DIR_1" root@109.74.199.54:/var/www/

# change directory 
cd /etc/ansible/playbooks/thesis-module


# Run the ansible playbook
ansible-playbook main.yml -i inventory

#change directory
cd ~/hasob

# Delete the tar file
rm -r "$OUTPUT_TAR_DIR_1"

