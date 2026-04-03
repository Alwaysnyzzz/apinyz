# NYZZ API — Documentation Site

Web dokumentasi untuk [api.nyzz.my.id](https://api.nyzz.my.id)

## 🚀 Quick Setup di VPS

### 1. Clone repo
```bash
git clone https://github.com/USERNAME/nyzz-docs.git
cd nyzz-docs
```

### 2. Jalankan setup otomatis
```bash
chmod +x setup.sh && bash setup.sh
```

Selesai! Akses di **https://docs.nyzz.my.id**

---

## 📁 Struktur File

```
nyzz-docs/
├── index.html           → Dashboard
├── apikey.html          → API Key
├── docs.html            → Overview dokumentasi
├── maker.html           → Kategori Maker
├── maker-brat.html      → Docs Brat Generator
├── uploader.html        → Kategori Uploader
├── uploader-image.html  → Docs Image Upload
├── uploader-multi.html  → Docs Multi Upload
├── style.css            → CSS shared
├── app.js               → JS shared
└── setup.sh             → Auto setup script
```

## ⚙️ Manual Setup (jika tidak pakai setup.sh)

```bash
# Copy file ke web directory
sudo mkdir -p /var/www/nyzz-docs
sudo cp -r * /var/www/nyzz-docs/

# Nginx config
sudo nano /etc/nginx/sites-available/docs.nyzz.my.id
```

Isi config Nginx:
```nginx
server {
    listen 80;
    server_name docs.nyzz.my.id;
    root /var/www/nyzz-docs;
    index index.html;
    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

```bash
sudo ln -s /etc/nginx/sites-available/docs.nyzz.my.id /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx

# SSL
sudo certbot --nginx -d docs.nyzz.my.id
```
