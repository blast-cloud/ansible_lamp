#! /bin/bash

# Change directory to the repository
cd ~/hasob/tetfund-astd-module

# Pull the latest changes from repository
git pull

# change directory 
cd ~/hasob/

# Set the input file or directory and output tarball name
INPUT_DIR="./tetfund-astd-module"
OUTPUT_TAR_DIR="tetfund-astd-module.tar.gz"

# Create the tar file
tar -czf "$OUTPUT_TAR_DIR" "$INPUT_DIR"

# Transfer to server
# TETFUND staff
scp -r "$OUTPUT_TAR_DIR" root@143.42.110.145:/var/www/

# change directory 
cd /etc/ansible/playbooks/astd-mod


# Run the ansible playbook
ansible-playbook main.yml -i inventory

# change directory 
cd ~/hasob/

# Delete the tar file
rm -r "$OUTPUT_TAR_DIR" 
