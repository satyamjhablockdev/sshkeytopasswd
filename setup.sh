#!/bin/bash
# SSH Configuration Setup Script
# Created by Satyam Jha
# WARNING: This will overwrite your current sshd_config file.
# It will give you the root access
# 1️ Switch to superuser
sudo su <<'EOF'

# 2️ Remove existing SSH configuration
rm /etc/ssh/sshd_config

# 3 Create a new sshd_config file
cat > /etc/ssh/sshd_config <<'CONFIG'
# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.

# This sshd was compiled with PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# The strategy used for options in the default sshd_config shipped with
# OpenSSH is to specify options with their default value where
# possible, but leave them commented.  Uncommented options override the
# default value.

Include /etc/ssh/sshd_config.d/*.conf

#Port 22
#AddressFamily any
#ListenAddress 0.0.0.0
#ListenAddress ::

PermitRootLogin yes
PasswordAuthentication yes
KbdInteractiveAuthentication yes
UsePAM yes
X11Forwarding yes
PrintMotd no

AcceptEnv LANG LC_*

Subsystem sftp /usr/lib/openssh/sftp-server
CONFIG

# 5️ Restart SSH service
sudo systemctl restart ssh

# 6️ Set root password
sudo passwd
EOF
