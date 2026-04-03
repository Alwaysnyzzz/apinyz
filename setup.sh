#!/bin/bash

# ═══════════════════════════════════════════════
#   NYZZ DOCS - Auto Setup Script
#   Jalankan: bash setup.sh
# ═══════════════════════════════════════════════

set -e

DOMAIN="docs.nyzz.my.id"
WEB_DIR="/var/www/nyzz-docs"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "╔══════════════════════════════════╗"
echo "║     NYZZ DOCS - Auto Setup       ║"
echo "╚══════════════════════════════════╝"
echo ""

# 1. Buat folder web
echo "[1/4] Membuat folder web..."
sudo mkdir -p $WEB_DIR
sudo cp -r $REPO_DIR/* $WEB_DIR/
sudo chown -R www-data:www-data $WEB_DIR
echo "      ✓ Done → $WEB_DIR"

# 2. Buat Nginx config
echo "[2/4] Membuat Nginx config..."
sudo tee /etc/nginx/sites-available/$DOMAIN > /dev/null << 'NGINXEOF'
server {
    listen 80;
    server_name docs.nyzz.my.id;
    root /var/www/nyzz-docs;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    location ~* \.(css|js|png|jpg|ico|woff2)$ {
        expires 7d;
        add_header Cache-Control "public";
    }

    gzip on;
    gzip_types text/css application/javascript text/html;
}
NGINXEOF
echo "      ✓ Done"

# 3. Aktifkan Nginx config
echo "[3/4] Mengaktifkan Nginx config..."
sudo ln -sf /etc/nginx/sites-available/docs.nyzz.my.id /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx
echo "      ✓ Done"

# 4. Pasang SSL
echo "[4/4] Memasang SSL (Certbot)..."
sudo certbot --nginx -d docs.nyzz.my.id --non-interactive --agree-tos -m admin@nyzz.my.id || {
  echo "      ⚠ SSL gagal, akses via HTTP dulu: http://docs.nyzz.my.id"
}

echo ""
echo "╔══════════════════════════════════╗"
echo "║         Setup Selesai! ✓         ║"
echo "╚══════════════════════════════════╝"
echo ""
echo "  URL: https://docs.nyzz.my.id"
echo ""
