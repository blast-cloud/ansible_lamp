
This Ansible playbook automates the provisioning and updating of a LAMP (Linux, Apache, MySQL, PHP) stack on a Linode server. It is specifically designed for deploying and maintaining a robust web application that consists of several components (modules).

Apache2 and MySQL are installed and properly configured using Ansible roles.
Each of the application modules is monitored for changes.
If any module is updated, the playbook automatically applies the changes on the server.
A script pulls the latest version of the application to the designated path.
All module dependencies are handled during deployment or updates.

Features

    Automated LAMP stack installation (Ubuntu-based).

    Modular architecture support several modules

    Idempotent updates: only changed modules are updated.

    Git-based deployment script to pull the latest code.

    Roles and handlers for Apache2 and MySQL setup.

    Secure configuration practices.
