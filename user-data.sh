#!/bin/bash
set -euxo pipefail

dnf install -y nginx

cat >/usr/share/nginx/html/index.html <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AWS Terraform Demo</title>
</head>
<body>
    <h1>AWS Terraform Demo</h1>
    <p>Infrastructure provisioned with Terraform.</p>
    <p>Running on Amazon EC2 with Nginx.</p>
</body>
</html>
EOF

systemctl enable --now nginx
