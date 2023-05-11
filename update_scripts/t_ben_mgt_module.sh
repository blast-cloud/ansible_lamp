#! /bin/bash

# Change directory to the repository
cd ~/hasob/tetfund-beneficiary-mgt-module

# Pull the latest changes from repository
git pull

# change directory 
cd ~/hasob/

# Set the input file or directory and output tarball name
INPUT_DIR="./tetfund-beneficiary-mgt-module"
OUTPUT_TAR_DIR="tetfund-beneficiary-mgt-module.tar.gz"

# Create the tar file
tar -czf "$OUTPUT_TAR_DIR" "$INPUT_DIR"

# Transfer to server
# TERAS 
# scp -r "$OUTPUT_TAR_DIR" root@109.74.199.54:/var/www/
# ITERUM
# scp -r "$OUTPUT_TAR_DIR" root@212.111.41.185:/var/www/
# TETFUND staff
scp -r "$OUTPUT_TAR_DIR" root@143.42.110.145:/var/www/
# TETFUND beneficiary
# scp -r "$OUTPUT_TAR_DIR" root@178.79.148.204:/var/www/
# TETFUND Impact & Remote Monitoring
scp -r "$OUTPUT_TAR_DIR" root@212.71.244.231:/var/www/


# change directory 
cd /etc/ansible/playbooks/ben-mgt-mod

# Run the ansible playbook
ansible-playbook main.yml -i inventory

# change directory 
cd ~/hasob/

# Delete the tar file
rm -r "$OUTPUT_TAR_DIR" 
