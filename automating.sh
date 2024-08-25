#!/bin/bash

function user_group_audit {
    echo "User and Group Audit:"
    echo "---------------------"

    echo "List of all users:"
    cut -d: -f1 /etc/passwd

    echo "List of all groups:"
    cut -d: -f1 /etc/group

    echo "Users with UID 0 :"
    awk -F: '$3 == 0 {print $1}' /etc/passwd

    echo "----------------------"
}

function file_permission_audit {
    echo "File and Directory Permissions Audit:"
    echo "-------------------------------------"

    echo "Files and directories with world-writable permissions:"
    find / -type f -perm -0002 -exec ls -ld {} \; 2>/dev/null

    echo "Checking .ssh directories:"
    find / -type d -name ".ssh" -exec ls -ld {} \; 2>/dev/null

    echo "Files with SUID/SGID bits set:"
    find / -perm /6000 -type f -exec ls -ld {} \; 2>/dev/null

    echo "------------------------------"
}

function service_audit {
    echo "Service Audit:"
    echo "--------------"

    echo "List of all running services:"
    systemctl list-units --type=service --state=running

    echo "-----------------------------"
}

function ip_network_check {
    echo "IP and Network Configuration Check:"
    echo "-----------------------------------"

    echo "IP addresses assigned to the server:"
    ip -br addr show

    echo "Public vs. Private IPs:"
    ip -br addr show | grep -E 'inet (10|172\.16|192\.168)' | awk '{print $1, $2}'

    echo "-----------------------------"
}

function ssh_hardening {
    echo "SSH Configuration Hardening:"
    echo "----------------------------"

    echo "Disabling password-based login for root:"
    sed -i '/^PermitRootLogin/s/.*/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config

    echo "Implementing SSH key-based authentication and securing keys:"

    echo "----------------------------"
}

function secure_grub {
    echo "Securing GRUB Bootloader:"
    echo "------------------------"

    echo "Setting a password for GRUB:"
    grub2-setpasswd

    echo "------------------------"
}

user_group_audit
file_permission_audit
service_audit
ip_network_check
ssh_hardening
disable_ipv6
secure_grub

echo "Security Audit and Hardening process completed"
