#! /bin/bash

# Change directory to the repository
cd ~/hasob/vanilla-lms

# Pull the latest changes from repository
git pull

# Set the input file or directory and output tarball name
INPUT_DIR_1="./app"
OUTPUT_TAR_DIR_1="app.tar.gz"

INPUT_DIR_2="./resources"
OUTPUT_TAR_DIR_2="resources.tar.gz"

INPUT_DIR_3="./routes"
OUTPUT_TAR_DIR_3="routes.tar.gz"

# Create the tar file
tar -czf "$OUTPUT_TAR_DIR_1" "$INPUT_DIR_1"
tar -czf "$OUTPUT_TAR_DIR_2" "$INPUT_DIR_2"
tar -czf "$OUTPUT_TAR_DIR_3" "$INPUT_DIR_3"

# Transfer to server
scp -r "$OUTPUT_TAR_DIR_1" "$OUTPUT_TAR_DIR_2" "$OUTPUT_TAR_DIR_3" root@178.79.131.69:/var/www/

# change directory 
cd /etc/ansible/


# Run the ansible playbook
ansible-playbook unzip.yml -i inventory

# Delete the tar file
# rm -r "$OUTPUT_TAR_DIR_1" "$OUTPUT_TAR_DIR_2" "$OUTPUT_TAR_DIR_3"
