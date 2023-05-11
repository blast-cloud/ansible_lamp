#! /bin/bash

# Change directory to the repository
cd ~/hasob/tetfund-thesis-digitilization-portal

# Pull the latest changes from repository
git pull

#change directory
cd ~/hasob


# Set the input file or directory and output tarball name
INPUT_DIR_1="./app"
OUTPUT_TAR_DIR_1="app.tar.gz"

INPUT_DIR_2="./resources"
OUTPUT_TAR_DIR_2="resources.tar.gz"

INPUT_DIR_3="./src"
OUTPUT_TAR_DIR_3="routes.tar.gz"



# Create the tar file
tar -czf "$OUTPUT_TAR_DIR_1" "$INPUT_DIR_1"
tar -czf "$OUTPUT_TAR_DIR_2" "$INPUT_DIR_2"
tar -czf "$OUTPUT_TAR_DIR_3" "$INPUT_DIR_3"


# Transfer to server
scp -r "$OUTPUT_TAR_DIR_1" root@109.74.199.54:/var/www/
scp -r "$OUTPUT_TAR_DIR_2" root@109.74.199.54:/var/www/
scp -r "$OUTPUT_TAR_DIR_3" root@109.74.199.54:/var/www/

# change directory 
cd /etc/ansible/playbooks/


# Run the ansible playbook
ansible-playbook thesis-digitilization-portal.yml -i inventory

#change directory 
cd ~/hasob

# Delete the tar file
rm -r "$OUTPUT_TAR_DIR_1" "$OUTPUT_TAR_DIR_2" "$OUTPUT_TAR_DIR_3"



