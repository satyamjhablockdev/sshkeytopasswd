

# 🚀 SSH Configuration Guide (Root Login & Password Auth Enabled)

**Created by:** [Satyam Jha](https://github.com/satyamjha)  

This guide walks you through setting up an SSH server configuration that **enables root login** and **password authentication**.  
Perfect for situations where you need quick, direct access — but remember, security risks are involved! 🔐

---

## 📜 Steps

### **1️⃣ Switch to Superuser**
```bash
sudo su
```

---

### **2️⃣ Remove Existing SSH Configuration**
```bash
rm /etc/ssh/sshd_config
```

---

### **3️⃣ Create a New SSH Configuration File**
```bash
nano /etc/ssh/sshd_config
```

---

### **4️⃣ Paste This Configuration in nano file**
After pasting, press **CTRL + X**, then **Y**, then **Enter**.

```plaintext
# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.

# This sshd was compiled with PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# The strategy used for options in the default sshd_config shipped with
# OpenSSH is to specify options with their default value where
# possible, but leave them commented.  Uncommented options override the
# default value.

Include /etc/ssh/sshd_config.d/*.conf

# When systemd socket activation is used (the default), the socket
# configuration must be re-generated after changing Port, AddressFamily, or
# ListenAddress.
#
# For changes to take effect, run:
#
#   systemctl daemon-reload
#   systemctl restart ssh.socket
#
#Port 22
#AddressFamily any
#ListenAddress 0.0.0.0
#ListenAddress ::

#HostKey /etc/ssh/ssh_host_rsa_key
#HostKey /etc/ssh/ssh_host_ecdsa_key
#HostKey /etc/ssh/ssh_host_ed25519_key

# Ciphers and keying
#RekeyLimit default none

# Logging
#SyslogFacility AUTH
#LogLevel INFO

# Authentication:

#LoginGraceTime 2m
PermitRootLogin yes
#StrictModes yes
#MaxAuthTries 6
#MaxSessions 10

PasswordAuthentication yes
#PermitEmptyPasswords yes

KbdInteractiveAuthentication yes

#PubkeyAuthentication yes

# Expect .ssh/authorized_keys2 to be disregarded by default in future.
#AuthorizedKeysFile .ssh/authorized_keys .ssh/authorized_keys2

#AuthorizedPrincipalsFile none

#AuthorizedKeysCommand none
#AuthorizedKeysCommandUser nobody

# For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
#HostbasedAuthentication no
#IgnoreUserKnownHosts no
#IgnoreRhosts yes

# Kerberos options
#KerberosAuthentication no
#KerberosOrLocalPasswd yes
#KerberosTicketCleanup yes
#KerberosGetAFSToken no

# GSSAPI options
#GSSAPIAuthentication no
#GSSAPICleanupCredentials yes
#GSSAPIStrictAcceptorCheck yes
#GSSAPIKeyExchange no

UsePAM yes

#AllowAgentForwarding yes
#AllowTcpForwarding yes
#GatewayPorts no
X11Forwarding yes
#X11DisplayOffset 10
#X11UseLocalhost yes
#PermitTTY yes
PrintMotd no
#PrintLastLog yes
#TCPKeepAlive yes
#PermitUserEnvironment no
#Compression delayed
#ClientAliveInterval 0
#ClientAliveCountMax 3
#UseDNS no
#PidFile /run/sshd.pid
#MaxStartups 10:30:100
#PermitTunnel no
#ChrootDirectory none
#VersionAddendum none

# no default banner path
#Banner none

AcceptEnv LANG LC_*

Subsystem sftp /usr/lib/openssh/sftp-server

# Example of overriding settings on a per-user basis
#Match User anoncvs
# X11Forwarding no
# AllowTcpForwarding no
# PermitTTY no
# ForceCommand cvs server
```

---

### **5️⃣ Restart SSH Service**
```bash
sudo systemctl restart ssh
```

---

### **6️⃣ Set/Change Root Password**
```bash
sudo passwd
```

---

## ⚠️ Security Warning
Enabling `PermitRootLogin yes` and `PasswordAuthentication yes` makes your server more vulnerable to brute-force attacks.  
If this is for production or internet-facing servers:
- Use **SSH keys** instead.
- Restrict access via **firewall rules**.
- Consider changing the default SSH port.

---

---

⭐ **If this helped you, don’t forget to star this repo!**
```

---
