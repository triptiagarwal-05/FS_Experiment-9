#!/bin/bash
# Run as root (user-data)
# Update & install Node 18 (example for Amazon Linux 2)
yum update -y
curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs git

# Create app directory
mkdir -p /opt/fullstack-backend
cd /opt/fullstack-backend

# Replace with your repo URL (use HTTPS or use a private key / code deploy)
git clone https://github.com/<your-username>/fullstack-backend.git . || (cd /opt/fullstack-backend && git pull)

# Install & start
npm install --production

# Create systemd service
cat >/etc/systemd/system/fullstack-backend.service <<EOF
[Unit]
Description=Fullstack Backend Node Service
After=network.target

[Service]
Environment=NODE_ENV=production
WorkingDirectory=/opt/fullstack-backend
ExecStart=/usr/bin/node src/server.js
Restart=always
User=root
# If you want non-root, create a user and chown files

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable fullstack-backend
systemctl start fullstack-backend
