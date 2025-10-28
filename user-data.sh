#!/bin/bash
set -e

# Log everything for easier debugging
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

# Update & install Apache
sudo apt-get update -y
sudo apt-get install -y apache2

# Start & enable
sudo systemctl enable apache2
sudo systemctl start apache2

# Simple UTF-8 page
cat << 'EOF' | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Maddy’s Auto-Scaling Web App</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body style="font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif; line-height:1.5; padding:32px;">
  <h1>Welcome to Maddy’s Auto-Scaling Web App 🚀</h1>
  <p>Deployed via Terraform, behind an Application Load Balancer and an Auto Scaling Group.</p>
</body>
</html>
EOF
