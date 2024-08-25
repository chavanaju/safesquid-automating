# safesquid-automating
This script is designed to automate the security audit and hardening process for Linux servers. It performs a series of checks to identify vulnerabilities, verify system configurations, and implement hardening measures.

Following related commans fetch the required output. Below script is also differentiated in individual sequences as mentioned below :

1. User and Group Audits
2. File and Directory Permissions
3. Service Audits
4. IP Network check
5. SSH Hardening
6. Secure GRUB

Below is the explanation of what exactly it displays: 1.User and Group Audits: Lists users and groups, checks for users with root privileges, identifies users without passwords, and reports weak passwords. 2.File and Directory Permissions: Scans for world-writable files and directories, checks .ssh directory permissions, and reports SUID/SGID bits. 3.Service Audits: Lists running services, checks for unauthorized services, and ensures critical services are running and configured. 4.IP and Network Configuration Checks: Identifies public vs. private IPs and ensures sensitive services are not exposed. 5.SSH Hardening: It disables password-based login for root and implements SSH key-based authentication and securing keys. 6.Secure Grub: Sets the password for GRUB.
