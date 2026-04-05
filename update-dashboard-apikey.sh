#!/bin/bash
cd /var/www/nyzz-docs

# ── INDEX / DASHBOARD ─────────────────────────
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Dashboard — NyzzAPI</title>
<link rel="stylesheet" href="style.css">
<style>
.welcome{background:linear-gradient(135deg,rgba(108,92,231,.12),rgba(167,139,250,.04));border:1px solid rgba(108,92,231,.22);border-radius:18px;padding:28px;margin-bottom:24px;position:relative;overflow:hidden}
.welcome::after{content:'';position:absolute;top:-60px;right:-60px;width:220px;height:220px;border-radius:50%;background:rgba(108,92,231,.06);pointer-events:none}
.welcome-eyebrow{font-size:10px;font-weight:700;color:var(--accent2);letter-spacing:2px;text-transform:uppercase;margin-bottom:8px}
.welcome-title{font-size:clamp(18px,3vw,26px);font-weight:800;letter-spacing:-.5px;margin-bottom:6px;line-height:1.25}
.welcome-title em{font-style:normal;color:var(--accent2)}
.welcome-desc{font-size:13px;color:var(--text2);line-height:1.65;max-width:460px}
.base-url{display:inline-flex;align-items:center;gap:10px;margin-top:14px;background:rgba(0,0,0,.3);border:1px solid var(--border2);border-radius:9px;padding:9px 14px}
.base-url .lbl{font-size:10px;font-weight:700;color:var(--muted);letter-spacing:1.5px;text-transform:uppercase}
.base-url code{font-family:'JetBrains Mono',monospace;font-size:12.5px;color:var(--green2)}
.stats-grid{display:grid;grid-template-columns:repeat(2,1fr);gap:10px;margin-bottom:24px}
@media(min-width:520px){.stats-grid{grid-template-columns:repeat(4,1fr)}}
.stat-card{background:var(--card);border:1px solid var(--border2);border-radius:12px;padding:16px 14px;transition:border-color .2s}
.stat-card:hover{border-color:var(--border3)}
.stat-top{display:flex;align-items:center;justify-content:space-between;margin-bottom:10px}
.stat-label{font-size:10px;font-weight:700;color:var(--muted);letter-spacing:1.5px;text-transform:uppercase}
.stat-ico{width:28px;height:28px;border-radius:7px;background:var(--bg3);display:flex;align-items:center;justify-content:center}
.stat-ico svg{width:13px;height:13px;stroke:var(--text2);fill:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:round}
.stat-val{font-size:20px;font-weight:800;letter-spacing:-.5px;font-family:'JetBrains Mono',monospace}
.stat-sub{font-size:11px;color:var(--muted);margin-top:2px}
.ep-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(160px,1fr));gap:10px;margin-bottom:24px}
.ep-card{background:var(--card);border:1px solid var(--border2);border-radius:12px;padding:14px 16px;display:flex;align-items:center;gap:10px;transition:all .2s;text-decoration:none;color:var(--text)}
.ep-card:hover{border-color:rgba(108,92,231,.4);transform:translateY(-1px)}
.ep-icon{width:32px;height:32px;border-radius:9px;background:rgba(108,92,231,.1);border:1px solid rgba(108,92,231,.18);display:flex;align-items:center;justify-content:center;flex-shrink:0}
.ep-icon svg{width:15px;height:15px;stroke:var(--accent2);fill:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:round}
.ep-name{font-size:13px;font-weight:600}
.ep-method{font-family:'JetBrains Mono',monospace;font-size:9px;font-weight:700;padding:2px 6px;border-radius:5px;margin-top:2px;display:inline-block}
.feat-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(180px,1fr));gap:10px;margin-bottom:24px}
.feat-card{background:var(--card);border:1px solid var(--border2);border-radius:12px;padding:16px}
.feat-ico{width:32px;height:32px;border-radius:9px;background:rgba(108,92,231,.1);border:1px solid rgba(108,92,231,.15);display:flex;align-items:center;justify-content:center;margin-bottom:10px}
.feat-ico svg{width:15px;height:15px;stroke:var(--accent2);fill:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:round}
.feat-title{font-size:13px;font-weight:700;margin-bottom:4px}
.feat-desc{font-size:12px;color:var(--text2);line-height:1.55}
.log-card{background:var(--card);border:1px solid var(--border2);border-radius:12px;overflow:hidden;margin-bottom:24px}
.log-head{padding:14px 18px;border-bottom:1px solid var(--border);display:flex;align-items:center;justify-content:space-between}
.log-head-title{font-size:13px;font-weight:700}
.log-badge{font-size:11px;color:var(--green2);font-weight:600}
.log-row{display:flex;align-items:center;gap:12px;padding:12px 18px;border-bottom:1px solid var(--border);transition:background .15s}
.log-row:last-child{border-bottom:none}
.log-row:hover{background:var(--bg3)}
.log-dot{width:7px;height:7px;border-radius:50%;flex-shrink:0}
.log-name{font-size:13px;font-weight:600;flex:1}
.log-desc{font-size:12px;color:var(--muted)}
.log-date{font-size:11px;color:var(--muted);font-family:'JetBrains Mono',monospace;white-space:nowrap}
footer{border-top:1px solid var(--border);padding:28px 0;margin-top:16px}
.footer-inner{display:flex;flex-direction:column;align-items:center;gap:12px;text-align:center}
.footer-logo{display:flex;align-items:center;gap:8px;text-decoration:none}
.footer-logo-icon{width:28px;height:28px;border-radius:8px;background:linear-gradient(135deg,#6c5ce7,#a78bfa);display:flex;align-items:center;justify-content:center}
.footer-logo-icon svg{width:14px;height:14px}
.footer-logo-text{font-size:14px;font-weight:800;color:var(--text)}
.footer-logo-text em{font-style:normal;color:var(--accent2)}
.footer-links{display:flex;align-items:center;gap:16px;flex-wrap:wrap;justify-content:center}
.footer-links a{font-size:12px;color:var(--muted);text-decoration:none;transition:color .2s}
.footer-links a:hover{color:var(--accent2)}
.footer-copy{font-size:11px;color:var(--muted)}
</style>
</head>
<body>
<div id="nav-wrap"></div>
<main class="main">

  <div class="welcome">
    <div class="welcome-eyebrow">REST API</div>
    <div class="welcome-title">Selamat datang di <em>NyzzAPI</em></div>
    <div class="welcome-desc">API ringan dan gratis untuk dipakai di bot WhatsApp, Telegram, atau web kamu. Tidak perlu registrasi — langsung pakai.</div>
    <div class="base-url">
      <span class="lbl">Base URL</span>
      <code>https://api.nyzz.my.id</code>
    </div>
  </div>

  <!-- STATS -->
  <div class="stats-grid">
    <div class="stat-card">
      <div class="stat-top">
        <div class="stat-label">Total Request</div>
        <div class="stat-ico"><svg viewBox="0 0 24 24"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg></div>
      </div>
      <div class="stat-val" id="stat-requests">—</div>
      <div class="stat-sub">Semua endpoint</div>
    </div>
    <div class="stat-card">
      <div class="stat-top">
        <div class="stat-label">Total User</div>
        <div class="stat-ico"><svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg></div>
      </div>
      <div class="stat-val" id="stat-users">—</div>
      <div class="stat-sub">Terdaftar</div>
    </div>
    <div class="stat-card">
      <div class="stat-top">
        <div class="stat-label">Endpoint</div>
        <div class="stat-ico"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/></svg></div>
      </div>
      <div class="stat-val" id="stat-endpoints">5</div>
      <div class="stat-sub">Aktif & stabil</div>
    </div>
    <div class="stat-card">
      <div class="stat-top">
        <div class="stat-label">Uptime</div>
        <div class="stat-ico"><svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg></div>
      </div>
      <div class="stat-val" id="stat-uptime">—</div>
      <div class="stat-sub">Server stabil</div>
    </div>
  </div>

  <!-- ENDPOINTS -->
  <div class="section">
    <div class="section-header"><div class="section-title">Semua Endpoint</div></div>
    <div class="section-desc">Klik endpoint untuk melihat dokumentasi lengkap.</div>
    <div class="ep-grid">
      <a class="ep-card" href="maker-brat.html">
        <div class="ep-icon"><svg viewBox="0 0 24 24"><path d="M12 2L2 7l10 5 10-5-10-5z"/><path d="M2 17l10 5 10-5"/><path d="M2 12l10 5 10-5"/></svg></div>
        <div><div class="ep-name">Brat Generator</div><span class="ep-method method-get">GET</span></div>
      </a>
      <a class="ep-card" href="uploader-image.html">
        <div class="ep-icon"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="18" height="18" rx="2"/><circle cx="8.5" cy="8.5" r="1.5"/><polyline points="21 15 16 10 5 21"/></svg></div>
        <div><div class="ep-name">Image Upload</div><span class="ep-method method-post">POST</span></div>
      </a>
      <a class="ep-card" href="uploader-video.html">
        <div class="ep-icon"><svg viewBox="0 0 24 24"><polygon points="23 7 16 12 23 17 23 7"/><rect x="1" y="5" width="15" height="14" rx="2"/></svg></div>
        <div><div class="ep-name">Video Upload</div><span class="ep-method method-post">POST</span></div>
      </a>
      <a class="ep-card" href="uploader-audio.html">
        <div class="ep-icon"><svg viewBox="0 0 24 24"><path d="M9 18V5l12-2v13"/><circle cx="6" cy="18" r="3"/><circle cx="18" cy="16" r="3"/></svg></div>
        <div><div class="ep-name">Audio Upload</div><span class="ep-method method-post">POST</span></div>
      </a>
      <a class="ep-card" href="uploader-file.html">
        <div class="ep-icon"><svg viewBox="0 0 24 24"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/></svg></div>
        <div><div class="ep-name">File Upload</div><span class="ep-method method-post">POST</span></div>
      </a>
    </div>
  </div>

  <!-- KENAPA NYZZ -->
  <div class="section">
    <div class="section-header"><div class="section-title">Kenapa NyzzAPI?</div></div>
    <div class="section-desc">Keunggulan yang kamu dapatkan secara gratis.</div>
    <div class="feat-grid">
      <div class="feat-card">
        <div class="feat-ico"><svg viewBox="0 0 24 24"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg></div>
        <div class="feat-title">Cepat & Ringan</div>
        <div class="feat-desc">Server VPS dedicated, response cepat tanpa antrian.</div>
      </div>
      <div class="feat-card">
        <div class="feat-ico"><svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg></div>
        <div class="feat-title">API Key Gratis</div>
        <div class="feat-desc">Daftar gratis, dapat API Key + 1000 req/hari.</div>
      </div>
      <div class="feat-card">
        <div class="feat-ico"><svg viewBox="0 0 24 24"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg></div>
        <div class="feat-title">Bot Friendly</div>
        <div class="feat-desc">Mudah dipakai di bot WhatsApp, Telegram, Discord.</div>
      </div>
      <div class="feat-card">
        <div class="feat-ico"><svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" y1="3" x2="12" y2="15"/></svg></div>
        <div class="feat-title">File Hosting</div>
        <div class="feat-desc">Upload file, dapatkan URL permanen siap share.</div>
      </div>
      <div class="feat-card">
        <div class="feat-ico"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="3"/><path d="M12 1v4M12 19v4M4.22 4.22l2.83 2.83M16.95 16.95l2.83 2.83M1 12h4M19 12h4M4.22 19.78l2.83-2.83M16.95 7.05l2.83-2.83"/></svg></div>
        <div class="feat-title">Image Maker</div>
        <div class="feat-desc">Generate brat style TikTok viral secara instan.</div>
      </div>
      <div class="feat-card">
        <div class="feat-ico"><svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg></div>
        <div class="feat-title">Docs Lengkap</div>
        <div class="feat-desc">Dokumentasi dengan contoh kode siap pakai.</div>
      </div>
    </div>
  </div>

  <!-- CHANGELOG -->
  <div class="section">
    <div class="section-header"><div class="section-title">Riwayat Update</div></div>
    <div class="log-card">
      <div class="log-head"><div class="log-head-title">Changelog</div><div class="log-badge">● Live</div></div>
      <div class="log-row"><div class="log-dot" style="background:var(--accent2)"></div><div class="log-name">Auth System</div><div class="log-desc">Login, Register, API Key</div><div class="log-date">2026-04-05</div></div>
      <div class="log-row"><div class="log-dot" style="background:var(--green2)"></div><div class="log-name">File Uploader</div><div class="log-desc">Image, Video, Audio, File</div><div class="log-date">2026-04-04</div></div>
      <div class="log-row"><div class="log-dot" style="background:var(--yellow)"></div><div class="log-name">Brat Generator</div><div class="log-desc">Viral TikTok brat style</div><div class="log-date">2026-04-01</div></div>
    </div>
  </div>

</main>

<footer>
  <div class="main" style="margin-top:0;padding-top:0">
    <div class="footer-inner">
      <a href="index.html" class="footer-logo">
        <div class="footer-logo-icon"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg></div>
        <span class="footer-logo-text">Nyzz<em>API</em></span>
      </a>
      <div class="footer-links">
        <a href="docs.html">Documentation</a>
        <a href="apikey.html">API Key</a>
        <a href="https://wa.me/6287713472756" target="_blank">WhatsApp</a>
        <a href="https://t.me/DzzXNzz" target="_blank">Telegram</a>
        <a href="https://api.nyzz.my.id" target="_blank">API</a>
        <a href="https://uploader.nyzz.my.id" target="_blank">Uploader</a>
      </div>
      <div class="footer-copy">© 2026 NyzzAPI. Made with ❤️ by <a href="https://t.me/DzzXNzz" style="color:var(--accent2);text-decoration:none">@DzzXNzz</a></div>
    </div>
  </div>
</footer>

<script src="app.js"></script>
<script>
const API = 'https://api.nyzz.my.id';
const VPS_START = new Date('2026-04-01T00:00:00Z'); // ganti tanggal VPS mulai aktif

async function loadStats() {
  try {
    const res  = await fetch(`${API}/user/stats`);
    const data = await res.json();
    if (data.status === 'sukses') {
      animateCount(document.getElementById('stat-requests'), data.data.total_requests);
      animateCount(document.getElementById('stat-users'),   data.data.total_users);
    }
  } catch {
    document.getElementById('stat-requests').textContent = '—';
    document.getElementById('stat-users').textContent    = '—';
  }
  // Uptime dari tanggal VPS aktif
  const diff   = Date.now() - VPS_START.getTime();
  const days   = Math.floor(diff / 86400000);
  const hours  = Math.floor((diff % 86400000) / 3600000);
  document.getElementById('stat-uptime').textContent = `${days}d ${hours}h`;
  // Endpoint count dari API_LIST di app.js
  document.getElementById('stat-endpoints').textContent = '5';
}
function animateCount(el, target) {
  if (!el) return;
  let cur = 0; const step = Math.max(1, Math.floor(target / 40));
  const t = setInterval(() => { cur = Math.min(cur + step, target); el.textContent = cur.toLocaleString(); if (cur >= target) clearInterval(t); }, 20);
}
loadStats();
</script>
</body>
</html>
EOF
echo "✓ index.html done"

# ── API KEY PAGE ───────────────────────────────
cat > /var/www/nyzz-docs/apikey.html << 'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>API Key — NyzzAPI</title>
<link rel="stylesheet" href="style.css">
<style>
/* SPINNER ANIMATION */
.spin-wrap{display:none;position:fixed;inset:0;background:rgba(0,0,0,.7);backdrop-filter:blur(8px);z-index:999;align-items:center;justify-content:center;flex-direction:column;gap:12px}
.spin-wrap.show{display:flex}
.spin-rings{position:relative;width:80px;height:80px}
.ring{position:absolute;inset:0;border-radius:50%;border:3px solid transparent}
.ring-1{border-top-color:#6c5ce7;border-right-color:#6c5ce7;animation:spin1 1s linear infinite}
.ring-2{inset:10px;border-bottom-color:#a78bfa;border-left-color:#a78bfa;animation:spin2 .8s linear infinite}
@keyframes spin1{to{transform:rotate(360deg)}}
@keyframes spin2{to{transform:rotate(-360deg)}}
.spin-text{font-size:13px;font-weight:600;color:var(--text2)}

/* KEY INPUT */
.key-input-wrap{position:relative;margin-bottom:10px}
.key-input{width:100%;background:var(--bg3);border:1px solid var(--border2);border-radius:10px;padding:12px 44px 12px 14px;color:var(--text);font-family:'JetBrains Mono',monospace;font-size:13px;outline:none;transition:border-color .2s;letter-spacing:.5px}
.key-input:focus{border-color:var(--accent)}
.key-toggle{position:absolute;right:12px;top:50%;transform:translateY(-50%);background:none;border:none;cursor:pointer;color:var(--muted);padding:4px;transition:color .2s;display:flex;align-items:center;justify-content:center}
.key-toggle:hover{color:var(--text)}
.key-empty-hint{font-size:12px;color:var(--muted);margin-bottom:14px;font-style:italic}

.apikey-card{background:var(--card);border:1px solid var(--border2);border-radius:16px;padding:22px;margin-bottom:16px}
.apikey-card-title{font-size:15px;font-weight:700;margin-bottom:4px}
.apikey-card-desc{font-size:12.5px;color:var(--text2);margin-bottom:18px;line-height:1.6}

.btn-create{width:100%;padding:13px;background:linear-gradient(135deg,var(--accent),var(--accent2));color:#fff;border:none;border-radius:10px;font-family:'Inter',sans-serif;font-size:14px;font-weight:700;cursor:pointer;transition:all .2s;display:flex;align-items:center;justify-content:center;gap:8px;margin-bottom:12px}
.btn-create:hover{opacity:.9;transform:translateY(-1px)}
.btn-create svg{width:16px;height:16px;stroke:#fff;fill:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:round}

.key-actions-row{display:flex;gap:8px}
.btn-copy-key{flex:1;background:var(--bg3);border:1px solid var(--border2);color:var(--text2);padding:10px;border-radius:9px;font-family:'Inter',sans-serif;font-size:13px;font-weight:600;cursor:pointer;transition:all .2s}
.btn-copy-key:hover{border-color:var(--accent2);color:var(--accent2)}
.btn-copy-key.copied{border-color:var(--green);color:var(--green2)}
.btn-regen-key{flex:1;background:var(--bg3);border:1px solid var(--border2);color:var(--text2);padding:10px;border-radius:9px;font-family:'Inter',sans-serif;font-size:13px;font-weight:600;cursor:pointer;transition:all .2s}
.btn-regen-key:hover{border-color:var(--yellow);color:#fbbf24}

.warning-box{margin-top:14px;padding:12px 14px;background:rgba(245,158,11,.08);border:1px solid rgba(245,158,11,.2);border-radius:10px;font-size:12px;color:var(--text2);line-height:1.7}
.warning-box strong{color:#fbbf24}

footer{border-top:1px solid var(--border);padding:28px 0;margin-top:16px}
.footer-inner{display:flex;flex-direction:column;align-items:center;gap:12px;text-align:center}
.footer-logo{display:flex;align-items:center;gap:8px;text-decoration:none}
.footer-logo-icon{width:28px;height:28px;border-radius:8px;background:linear-gradient(135deg,#6c5ce7,#a78bfa);display:flex;align-items:center;justify-content:center}
.footer-logo-icon svg{width:14px;height:14px}
.footer-logo-text{font-size:14px;font-weight:800;color:var(--text)}
.footer-logo-text em{font-style:normal;color:var(--accent2)}
.footer-links{display:flex;align-items:center;gap:16px;flex-wrap:wrap;justify-content:center}
.footer-links a{font-size:12px;color:var(--muted);text-decoration:none;transition:color .2s}
.footer-links a:hover{color:var(--accent2)}
.footer-copy{font-size:11px;color:var(--muted)}
</style>
</head>
<body>
<div id="nav-wrap"></div>

<!-- SPINNER POPUP -->
<div class="spin-wrap" id="spinner">
  <div class="spin-rings">
    <div class="ring ring-1"></div>
    <div class="ring ring-2"></div>
  </div>
  <div class="spin-text" id="spin-text">Membuat API Key...</div>
</div>

<main class="main">
  <div class="page-header">
    <div class="page-title">API Key</div>
    <div class="page-desc">Dapatkan API Key untuk menggunakan semua endpoint NyzzAPI.</div>
  </div>

  <!-- PROMO CARD -->
  <div style="background:linear-gradient(135deg,rgba(108,92,231,.12),rgba(167,139,250,.04));border:1px solid rgba(108,92,231,.25);border-radius:16px;padding:24px;margin-bottom:20px">
    <div style="font-size:16px;font-weight:800;margin-bottom:6px">Daftar Gratis & Dapatkan API Key</div>
    <div style="font-size:13px;color:var(--text2);line-height:1.6;margin-bottom:16px">Setiap akun mendapat API Key unik dengan <strong style="color:var(--accent2)">1000 request/hari</strong> gratis. Satu IP = satu akun.</div>
    <div style="display:flex;gap:10px;flex-wrap:wrap">
      <a href="register.html" style="background:linear-gradient(135deg,var(--accent),var(--accent2));color:#fff;padding:9px 20px;border-radius:9px;text-decoration:none;font-weight:700;font-size:13px">Daftar Gratis</a>
      <a href="login.html" style="background:var(--bg3);color:var(--text2);border:1px solid var(--border2);padding:9px 20px;border-radius:9px;text-decoration:none;font-weight:600;font-size:13px">Login</a>
    </div>
  </div>

  <!-- API KEY SECTION -->
  <div class="apikey-card">
    <div class="apikey-card-title">API Key Kamu</div>
    <div class="apikey-card-desc" id="key-status-text">Anda belum punya API Key. Klik tombol di bawah untuk membuat.</div>

    <!-- Key Input -->
    <div class="key-input-wrap">
      <input type="password" class="key-input" id="key-display" value="" placeholder="•••••••••••••••••••••••••••••••••••" readonly>
      <button class="key-toggle" id="key-toggle-btn" onclick="toggleKeyVisibility()" title="Tampilkan/Sembunyikan">
        <svg id="eye-icon" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/>
          <line x1="1" y1="1" x2="23" y2="23"/>
        </svg>
      </button>
    </div>

    <!-- Tombol buat -->
    <button class="btn-create" id="btn-create" onclick="createOrLogin()">
      <svg viewBox="0 0 24 24"><path d="M21 2l-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0l3 3L22 7l-3-3m-3.5 3.5L19 4"/></svg>
      Buat API Key
    </button>

    <!-- Actions (muncul setelah punya key) -->
    <div class="key-actions-row" id="key-actions" style="display:none">
      <button class="btn-copy-key" id="btn-copy" onclick="copyApiKey()">Salin API Key</button>
      <button class="btn-regen-key" onclick="regenApiKey()">Buat Ulang</button>
    </div>

    <div class="warning-box">
      ⚠️ <strong>Penting!</strong> Simpan API Key kamu di tempat yang aman. Jangan share ke orang lain. Gunakan dengan bijak sesuai <a href="docs.html" style="color:var(--accent2)">ketentuan penggunaan</a>. Limit <strong>1000 request/hari</strong> per akun.
    </div>
  </div>

  <!-- Sign Key -->
  <div class="apikey-card" id="signkey-section" style="display:none">
    <div class="apikey-card-title">Sign Key</div>
    <div class="apikey-card-desc">Digunakan untuk verifikasi request tertentu.</div>
    <div class="key-input-wrap">
      <input type="password" class="key-input" id="sign-display" value="" readonly>
      <button class="key-toggle" onclick="toggleSignVisibility()" title="Tampilkan/Sembunyikan">
        <svg id="sign-eye-icon" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/>
          <line x1="1" y1="1" x2="23" y2="23"/>
        </svg>
      </button>
    </div>
    <div class="key-actions-row" style="margin-top:8px">
      <button class="btn-copy-key" id="btn-copy-sign" onclick="copySignKey()">Salin Sign Key</button>
    </div>
  </div>

  <!-- Cara Pakai -->
  <div class="apikey-card">
    <div class="apikey-card-title">Cara Pakai API Key</div>
    <div class="code-block" style="margin-top:10px">
      <div class="code-top"><span class="code-lang">GET — Query Param</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
      <pre class="code-body">https://api.nyzz.my.id/brat?text=halo&apikey=API_KEY</pre>
    </div>
    <div class="code-block">
      <div class="code-top"><span class="code-lang">POST — Header</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
      <pre class="code-body">x-api-key: API_KEY</pre>
    </div>
    <div class="code-block">
      <div class="code-top"><span class="code-lang">POST — Body JSON</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
      <pre class="code-body">{ "apikey": "API_KEY" }</pre>
    </div>
  </div>

  <!-- Limit -->
  <div class="apikey-card">
    <div class="apikey-card-title">Limit & Paket</div>
    <div class="info-grid" style="margin-top:10px">
      <div class="info-item"><div class="info-key">Paket</div><div class="info-val">Free</div></div>
      <div class="info-item"><div class="info-key">Limit/Hari</div><div class="info-val">1,000 req</div></div>
      <div class="info-item"><div class="info-key">Reset</div><div class="info-val">00:00 WIB</div></div>
      <div class="info-item"><div class="info-key">IP Limit</div><div class="info-val">1 akun/IP</div></div>
    </div>
  </div>

</main>

<footer>
  <div class="main" style="margin-top:0;padding-top:0">
    <div class="footer-inner">
      <a href="index.html" class="footer-logo">
        <div class="footer-logo-icon"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg></div>
        <span class="footer-logo-text">Nyzz<em>API</em></span>
      </a>
      <div class="footer-links">
        <a href="docs.html">Documentation</a>
        <a href="apikey.html">API Key</a>
        <a href="https://wa.me/6287713472756" target="_blank">WhatsApp</a>
        <a href="https://t.me/DzzXNzz" target="_blank">Telegram</a>
        <a href="https://api.nyzz.my.id" target="_blank">API</a>
        <a href="https://uploader.nyzz.my.id" target="_blank">Uploader</a>
      </div>
      <div class="footer-copy">© 2026 NyzzAPI. Made with ❤️ by <a href="https://t.me/DzzXNzz" style="color:var(--accent2);text-decoration:none">@DzzXNzz</a></div>
    </div>
  </div>
</footer>

<script src="app.js"></script>
<script>
const API = 'https://api.nyzz.my.id';
let currentKey = '';
let currentSign = '';
let keyVisible  = false;
let signVisible = false;

function showSpinner(text = 'Membuat API Key...') {
  document.getElementById('spin-text').textContent = text;
  document.getElementById('spinner').classList.add('show');
}
function hideSpinner() { document.getElementById('spinner').classList.remove('show'); }

function setKeyDisplay(key, sign) {
  currentKey  = key;
  currentSign = sign || '';
  document.getElementById('key-display').value = key;
  document.getElementById('key-display').type  = 'password';
  keyVisible = false;
  updateEyeIcon('eye-icon', false);
  document.getElementById('key-status-text').textContent = 'API Key kamu sudah siap digunakan.';
  document.getElementById('key-actions').style.display   = 'flex';
  document.getElementById('btn-create').style.display    = 'none';
  if (sign) {
    document.getElementById('sign-display').value        = sign;
    document.getElementById('sign-display').type         = 'password';
    document.getElementById('signkey-section').style.display = 'block';
  }
  localStorage.setItem('nyzz_apikey', key);
}

function updateEyeIcon(id, visible) {
  const el = document.getElementById(id);
  el.innerHTML = visible
    ? `<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>`
    : `<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/><line x1="1" y1="1" x2="23" y2="23"/>`;
}

function toggleKeyVisibility() {
  keyVisible = !keyVisible;
  document.getElementById('key-display').type = keyVisible ? 'text' : 'password';
  updateEyeIcon('eye-icon', keyVisible);
}
function toggleSignVisibility() {
  signVisible = !signVisible;
  document.getElementById('sign-display').type = signVisible ? 'text' : 'password';
  updateEyeIcon('sign-eye-icon', signVisible);
}

async function createOrLogin() {
  const token = localStorage.getItem('nyzz_token');
  if (!token) { window.location.href = 'register.html'; return; }
  showSpinner('Membuat API Key...');
  try {
    const res  = await fetch(`${API}/auth/me`, { headers: { Authorization: `Bearer ${token}` }});
    const data = await res.json();
    if (data.status === 'sukses') setKeyDisplay(data.user.api_key, data.user.sign_key);
    else { localStorage.removeItem('nyzz_token'); window.location.href = 'login.html'; }
  } catch { alert('Gagal konek ke server'); }
  finally { setTimeout(hideSpinner, 600); }
}

async function regenApiKey() {
  if (!confirm('Yakin buat ulang API Key? Key lama tidak bisa dipakai lagi.')) return;
  const token = localStorage.getItem('nyzz_token');
  if (!token) { window.location.href = 'login.html'; return; }
  showSpinner('Membuat Ulang API Key...');
  try {
    const res  = await fetch(`${API}/auth/regen-apikey`, { method: 'POST', headers: { Authorization: `Bearer ${token}` }});
    const data = await res.json();
    if (data.status === 'sukses') {
      currentKey = data.api_key;
      document.getElementById('key-display').value = data.api_key;
      document.getElementById('key-display').type  = 'password';
      keyVisible = false; updateEyeIcon('eye-icon', false);
      localStorage.setItem('nyzz_apikey', data.api_key);
    } else alert('Error: ' + data.message);
  } catch { alert('Gagal!'); }
  finally { setTimeout(hideSpinner, 800); }
}

function copyApiKey() {
  if (!currentKey) return;
  navigator.clipboard.writeText(currentKey);
  const btn = document.getElementById('btn-copy');
  btn.textContent = '✓ Tersalin!'; btn.classList.add('copied');
  setTimeout(() => { btn.textContent = 'Salin API Key'; btn.classList.remove('copied'); }, 2000);
}
function copySignKey() {
  if (!currentSign) return;
  navigator.clipboard.writeText(currentSign);
  const btn = document.getElementById('btn-copy-sign');
  btn.textContent = '✓ Tersalin!'; btn.classList.add('copied');
  setTimeout(() => { btn.textContent = 'Salin Sign Key'; btn.classList.remove('copied'); }, 2000);
}

// Auto load jika sudah login
document.addEventListener('DOMContentLoaded', async () => {
  const token = localStorage.getItem('nyzz_token');
  if (!token) return;
  try {
    const res  = await fetch(`${API}/auth/me`, { headers: { Authorization: `Bearer ${token}` }});
    const data = await res.json();
    if (data.status === 'sukses') setKeyDisplay(data.user.api_key, data.user.sign_key);
  } catch {}
});
</script>
</body>
</html>
EOF
echo "✓ apikey.html done"

echo ""
echo "╔══════════════════════════════════════╗"
echo "║     Update Selesai! ✓                ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "  Diupdate:"
echo "  → /var/www/nyzz-docs/index.html"
echo "  → /var/www/nyzz-docs/apikey.html"
echo ""
