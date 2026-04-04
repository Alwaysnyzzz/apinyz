#!/bin/bash
# Jalankan: cd /var/www/nyzz-docs && bash setup.sh
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WEB_DIR="/var/www/nyzz-docs"
echo "Copying docs files..."
mkdir -p $WEB_DIR
cp -r $SCRIPT_DIR/* $WEB_DIR/

cat > /etc/nginx/sites-available/docs.nyzz.my.id << 'NGINXEOF'
server {
    listen 80;
    server_name docs.nyzz.my.id;
    root /var/www/nyzz-docs;
    index index.html;
    location / { try_files $uri $uri/ /index.html; }
}
NGINXEOF
ln -sf /etc/nginx/sites-available/docs.nyzz.my.id /etc/nginx/sites-enabled/ 2>/dev/null || true
nginx -t && systemctl reload nginx
echo "✓ Docs deployed ke $WEB_DIR"
echo "✓ Nginx configured"
