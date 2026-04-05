#!/bin/bash
cd /var/www/nyzz-docs
echo "Updating all pages..."

# ── SHARED FOOTER SNIPPET ─────────────────────
FOOTER='<footer>
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
      <div style="display:flex;flex-direction:column;align-items:center;gap:4px">
        <div class="footer-copy">Made with ❤️ by <a href="https://t.me/DzzXNzz" style="color:var(--accent2);text-decoration:none">@DzzXNzz</a></div>
        <div class="footer-copy">© 2026 NyzzAPI.</div>
      </div>
    </div>
  </div>
</footer>'

# ── SHARED FOOTER CSS ─────────────────────────
FOOTER_CSS='footer{border-top:1px solid var(--border);padding:28px 0;margin-top:16px}
.footer-inner{display:flex;flex-direction:column;align-items:center;gap:12px;text-align:center}
.footer-logo{display:flex;align-items:center;gap:8px;text-decoration:none}
.footer-logo-icon{width:28px;height:28px;border-radius:8px;background:linear-gradient(135deg,#6c5ce7,#a78bfa);display:flex;align-items:center;justify-content:center}
.footer-logo-text{font-size:14px;font-weight:800;color:var(--text)}
.footer-logo-text em{font-style:normal;color:var(--accent2)}
.footer-links{display:flex;align-items:center;gap:16px;flex-wrap:wrap;justify-content:center}
.footer-links a{font-size:12px;color:var(--muted);text-decoration:none;transition:color .2s}
.footer-links a:hover{color:var(--accent2)}
.footer-copy{font-size:11px;color:var(--muted)}'

echo "[1/4] Writing apikey.html..."
cat > apikey.html << 'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>API Key — NyzzAPI</title>
<link rel="stylesheet" href="style.css">
<style>
footer{border-top:1px solid var(--border);padding:28px 0;margin-top:16px}
.footer-inner{display:flex;flex-direction:column;align-items:center;gap:12px;text-align:center}
.footer-logo{display:flex;align-items:center;gap:8px;text-decoration:none}
.footer-logo-icon{width:28px;height:28px;border-radius:8px;background:linear-gradient(135deg,#6c5ce7,#a78bfa);display:flex;align-items:center;justify-content:center}
.footer-logo-text{font-size:14px;font-weight:800;color:var(--text)}
.footer-logo-text em{font-style:normal;color:var(--accent2)}
.footer-links{display:flex;align-items:center;gap:16px;flex-wrap:wrap;justify-content:center}
.footer-links a{font-size:12px;color:var(--muted);text-decoration:none;transition:color .2s}
.footer-links a:hover{color:var(--accent2)}
.footer-copy{font-size:11px;color:var(--muted)}

/* SPINNER */
.spin-wrap{display:none;position:fixed;inset:0;background:rgba(0,0,0,.75);backdrop-filter:blur(8px);z-index:999;align-items:center;justify-content:center;flex-direction:column;gap:16px}
.spin-wrap.show{display:flex}
.spin-rings{position:relative;width:72px;height:72px}
.ring{position:absolute;inset:0;border-radius:50%;border:3px solid transparent}
.ring-1{border-top-color:#6c5ce7;border-right-color:#6c5ce7;animation:sp1 1s linear infinite}
.ring-2{inset:12px;border-bottom-color:#3a3a4a;border-left-color:#3a3a4a;animation:sp2 .75s linear infinite}
@keyframes sp1{to{transform:rotate(360deg)}}
@keyframes sp2{to{transform:rotate(-360deg)}}
.spin-text{font-size:13px;font-weight:600;color:var(--text2)}

/* POPUP */
.popup-wrap{display:none;position:fixed;inset:0;background:rgba(0,0,0,.6);backdrop-filter:blur(6px);z-index:998;align-items:center;justify-content:center;padding:20px}
.popup-wrap.show{display:flex}
.popup-box{background:var(--bg2);border:1px solid var(--border2);border-radius:16px;padding:28px;max-width:320px;width:100%;text-align:center;animation:popIn .2s cubic-bezier(.4,0,.2,1)}
@keyframes popIn{from{opacity:0;transform:scale(.94)}to{opacity:1;transform:scale(1)}}
.popup-icon{margin-bottom:12px;display:flex;justify-content:center}
.popup-icon svg{width:40px;height:40px;stroke:var(--accent2);fill:none;stroke-width:1.5;stroke-linecap:round;stroke-linejoin:round}
.popup-title{font-size:16px;font-weight:800;margin-bottom:6px}
.popup-desc{font-size:13px;color:var(--text2);line-height:1.6;margin-bottom:18px}
.popup-btns{display:flex;gap:8px;flex-direction:column}
.popup-btns .row{display:flex;gap:8px}
.pbtn{flex:1;padding:10px;border-radius:9px;font-family:'Inter',sans-serif;font-size:13px;font-weight:600;cursor:pointer;border:none;transition:all .2s}
.pbtn-primary{background:linear-gradient(135deg,var(--accent),var(--accent2));color:#fff}
.pbtn-primary:hover{opacity:.9}
.pbtn-secondary{background:var(--bg3);border:1px solid var(--border2);color:var(--text2)}
.pbtn-secondary:hover{border-color:var(--accent2);color:var(--accent2)}
.pbtn-ok{background:var(--bg3);border:1px solid var(--border2);color:var(--text2);width:100%}
.pbtn-ok:hover{border-color:var(--border3)}

/* KEY CARD */
.key-card{background:var(--card);border:1px solid var(--border2);border-radius:16px;padding:22px;margin-bottom:16px}
.key-card-title{font-size:15px;font-weight:700;margin-bottom:4px}
.key-card-desc{font-size:12.5px;color:var(--text2);margin-bottom:16px;line-height:1.6}
.key-input-wrap{position:relative;margin-bottom:12px}
.key-input{width:100%;background:var(--bg3);border:1px solid var(--border2);border-radius:10px;padding:12px 44px 12px 14px;color:var(--text);font-family:'JetBrains Mono',monospace;font-size:13px;outline:none;transition:border-color .2s}
.key-input:focus{border-color:var(--accent)}
.key-hint{font-size:12px;color:var(--muted);font-style:italic}
.eye-btn{position:absolute;right:12px;top:50%;transform:translateY(-50%);background:none;border:none;cursor:pointer;color:var(--muted);display:flex;align-items:center;padding:4px;transition:color .2s}
.eye-btn:hover{color:var(--text)}
.eye-btn svg{width:16px;height:16px;stroke:currentColor;fill:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:round}
.btn-create-api{width:100%;padding:13px;background:linear-gradient(135deg,var(--accent),var(--accent2));color:#fff;border:none;border-radius:10px;font-family:'Inter',sans-serif;font-size:14px;font-weight:700;cursor:pointer;transition:all .2s;display:flex;align-items:center;justify-content:center;gap:8px;margin-bottom:10px}
.btn-create-api:hover{opacity:.9;transform:translateY(-1px)}
.btn-create-api svg{width:16px;height:16px;stroke:#fff;fill:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:round}
.key-action-row{display:flex;gap:8px;margin-bottom:14px}
.btn-salin-api{flex:1;background:var(--bg3);border:1px solid var(--border2);color:var(--text2);padding:10px;border-radius:9px;font-family:'Inter',sans-serif;font-size:13px;font-weight:600;cursor:pointer;transition:all .2s}
.btn-salin-api:hover{border-color:var(--accent2);color:var(--accent2)}
.btn-salin-api.copied{border-color:var(--green);color:var(--green2)}
.btn-perbarui-api{flex:1;background:var(--bg3);border:1px solid var(--border2);color:var(--text2);padding:10px;border-radius:9px;font-family:'Inter',sans-serif;font-size:13px;font-weight:600;cursor:pointer;transition:all .2s}
.btn-perbarui-api:hover{border-color:#fbbf24;color:#fbbf24}
.warn-box{padding:12px 14px;background:rgba(245,158,11,.08);border:1px solid rgba(245,158,11,.2);border-radius:10px;font-size:12px;color:var(--text2);line-height:1.7}
.warn-box strong{color:#fbbf24}
</style>
</head>
<body>
<div id="nav-wrap"></div>

<!-- SPINNER -->
<div class="spin-wrap" id="spinner">
  <div class="spin-rings">
    <div class="ring ring-1"></div>
    <div class="ring ring-2"></div>
  </div>
  <div class="spin-text" id="spin-text">Sedang membuat API Key...</div>
</div>

<!-- POPUP BELUM LOGIN -->
<div class="popup-wrap" id="popup-login">
  <div class="popup-box">
    <div class="popup-icon">
      <svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
    </div>
    <div class="popup-title">Anda Belum Login</div>
    <div class="popup-desc">Silakan login atau daftar terlebih dahulu untuk menggunakan fitur ini.</div>
    <div class="popup-btns">
      <div class="row">
        <button class="pbtn pbtn-primary" onclick="window.location.href='login.html'">Login</button>
        <button class="pbtn pbtn-primary" onclick="window.location.href='register.html'">Register</button>
      </div>
      <button class="pbtn pbtn-ok" onclick="closePopup('popup-login')">Ok</button>
    </div>
  </div>
</div>

<!-- POPUP BELUM BUAT API -->
<div class="popup-wrap" id="popup-no-api">
  <div class="popup-box">
    <div class="popup-icon">
      <svg viewBox="0 0 24 24"><circle cx="8" cy="15" r="4"/><path d="M12 15h8M16 11v8"/></svg>
    </div>
    <div class="popup-title">Anda Belum Buat API</div>
    <div class="popup-desc">Klik tombol "Buat API Key" terlebih dahulu untuk mendapatkan API Key kamu.</div>
    <button class="pbtn pbtn-ok" onclick="closePopup('popup-no-api')">Ok</button>
  </div>
</div>

<main class="main">
  <div class="page-header">
    <div class="page-title">API Key</div>
    <div class="page-desc">Dapatkan API Key untuk menggunakan semua endpoint NyzzAPI.</div>
  </div>

  <!-- BELUM LOGIN: info daftar -->
  <div id="area-guest" style="display:none">
    <div style="background:linear-gradient(135deg,rgba(108,92,231,.12),rgba(167,139,250,.04));border:1px solid rgba(108,92,231,.25);border-radius:16px;padding:24px;margin-bottom:20px">
      <div style="font-size:15px;font-weight:800;margin-bottom:6px">Daftar Gratis & Dapatkan API Key</div>
      <div style="font-size:13px;color:var(--text2);line-height:1.6;margin-bottom:16px">Buat akun gratis dan dapatkan API Key dengan <strong style="color:var(--accent2)">1000 request/hari</strong>.</div>
      <div style="display:flex;gap:10px;flex-wrap:wrap">
        <a href="register.html" style="background:linear-gradient(135deg,var(--accent),var(--accent2));color:#fff;padding:9px 20px;border-radius:9px;text-decoration:none;font-weight:700;font-size:13px">Daftar Gratis</a>
        <a href="login.html" style="background:var(--bg3);color:var(--text2);border:1px solid var(--border2);padding:9px 20px;border-radius:9px;text-decoration:none;font-weight:600;font-size:13px">Login</a>
      </div>
    </div>
  </div>

  <!-- API KEY CARD -->
  <div class="key-card">
    <div class="key-card-title">API Key Kamu</div>
    <div class="key-card-desc" id="key-desc">Anda belum login. Login atau daftar untuk mendapatkan API Key.</div>

    <div class="key-input-wrap">
      <input class="key-input" id="key-display" type="text" value="Anda belum login" readonly>
      <button class="eye-btn" onclick="toggleEye()" id="eye-btn" title="Lihat API Key">
        <svg id="eye-svg" viewBox="0 0 24 24">
          <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>
        </svg>
      </button>
    </div>

    <button class="btn-create-api" onclick="handleCreate()">
      <svg viewBox="0 0 24 24"><path d="M21 2l-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0l3 3L22 7l-3-3m-3.5 3.5L19 4"/></svg>
      Buat API Key
    </button>

    <div class="key-action-row">
      <button class="btn-salin-api" id="btn-salin" onclick="handleSalin()">Salin API Key</button>
      <button class="btn-perbarui-api" onclick="handlePerbarui()">Perbarui API</button>
    </div>

    <div class="warn-box">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#fbbf24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="vertical-align:middle;margin-right:4px"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"/><line x1="12" y1="9" x2="12" y2="13"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>
      <strong>Penting!</strong> Simpan API Key di tempat aman. Jangan bagikan ke siapapun. Gunakan dengan bijak. Limit <strong>1000 req/hari</strong>. Apabila API Key bocor, segera klik <strong>Perbarui API</strong>.
    </div>
  </div>

  <!-- Sign Key -->
  <div class="key-card" id="signkey-card" style="display:none">
    <div class="key-card-title">Sign Key</div>
    <div class="key-card-desc">Digunakan untuk verifikasi request tertentu. Jaga kerahasiaannya.</div>
    <div class="key-input-wrap">
      <input class="key-input" id="sign-display" type="password" readonly>
      <button class="eye-btn" onclick="toggleSignEye()" title="Lihat Sign Key">
        <svg id="sign-eye-svg" viewBox="0 0 24 24">
          <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/>
          <line x1="1" y1="1" x2="23" y2="23"/>
        </svg>
      </button>
    </div>
    <button class="btn-salin-api" id="btn-salin-sign" onclick="copySign()" style="width:100%">Salin Sign Key</button>
  </div>

  <!-- Cara pakai -->
  <div class="key-card">
    <div class="key-card-title">Cara Pakai API Key</div>
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

  <div class="key-card">
    <div class="key-card-title">Limit & Paket</div>
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
      <div style="display:flex;flex-direction:column;align-items:center;gap:4px">
        <div class="footer-copy">Made with ❤️ by <a href="https://t.me/DzzXNzz" style="color:var(--accent2);text-decoration:none">@DzzXNzz</a></div>
        <div class="footer-copy">© 2026 NyzzAPI.</div>
      </div>
    </div>
  </div>
</footer>

<script src="app.js"></script>
<script>
const API = 'https://api.nyzz.my.id';
let currentKey  = '';
let currentSign = '';
let keyMasked   = true;
let signMasked  = true;
let isLoggedIn  = false;
let hasKey      = false;

function showSpinner(text) { document.getElementById('spin-text').textContent = text; document.getElementById('spinner').classList.add('show'); }
function hideSpinner()     { document.getElementById('spinner').classList.remove('show'); }
function showPopup(id)     { document.getElementById(id).classList.add('show'); }
function closePopup(id)    { document.getElementById(id).classList.remove('show'); }

function setKeyUI(apikey, signkey) {
  currentKey  = apikey;
  currentSign = signkey || '';
  hasKey      = true;
  keyMasked   = true;
  document.getElementById('key-display').value = apikey;
  document.getElementById('key-display').type  = 'password';
  document.getElementById('key-desc').textContent = 'API Key kamu sudah siap. Simpan dengan aman!';
  if (signkey) { document.getElementById('sign-display').value = signkey; document.getElementById('signkey-card').style.display = 'block'; }
  localStorage.setItem('nyzz_apikey', apikey);
  updateEye(false);
}

function updateEye(visible) {
  const el = document.getElementById('eye-svg');
  el.innerHTML = visible
    ? `<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>`
    : `<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/><line x1="1" y1="1" x2="23" y2="23"/>`;
}

function toggleEye() {
  if (!isLoggedIn) { showPopup('popup-login'); return; }
  keyMasked = !keyMasked;
  document.getElementById('key-display').type = keyMasked ? 'password' : 'text';
  updateEye(!keyMasked);
}

function toggleSignEye() {
  signMasked = !signMasked;
  document.getElementById('sign-display').type = signMasked ? 'password' : 'text';
  const el = document.getElementById('sign-eye-svg');
  el.innerHTML = signMasked
    ? `<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/><line x1="1" y1="1" x2="23" y2="23"/>`
    : `<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>`;
}

async function handleCreate() {
  if (!isLoggedIn) { showPopup('popup-login'); return; }
  showSpinner('Sedang membuat API Key...');
  try {
    const token = localStorage.getItem('nyzz_token');
    const res   = await fetch(`${API}/auth/me`, { headers: { Authorization: `Bearer ${token}` }});
    const data  = await res.json();
    if (data.status === 'sukses') setKeyUI(data.user.api_key, data.user.sign_key);
  } catch { alert('Gagal!'); }
  finally { setTimeout(hideSpinner, 800); }
}

function handleSalin() {
  if (!isLoggedIn) { showPopup('popup-login'); return; }
  if (!hasKey)     { showPopup('popup-no-api'); return; }
  navigator.clipboard.writeText(currentKey);
  const btn = document.getElementById('btn-salin');
  btn.textContent = '✓ Tersalin!'; btn.classList.add('copied');
  setTimeout(() => { btn.textContent = 'Salin API Key'; btn.classList.remove('copied'); }, 2000);
}

async function handlePerbarui() {
  if (!isLoggedIn) { showPopup('popup-login'); return; }
  if (!hasKey)     { showPopup('popup-no-api'); return; }
  if (!confirm('Apabila API bocor gunakan fitur ini. API Key lama tidak bisa dipakai lagi. Lanjutkan?')) return;
  showSpinner('Memperbarui API Key...');
  try {
    const token = localStorage.getItem('nyzz_token');
    const res   = await fetch(`${API}/auth/regen-apikey`, { method:'POST', headers:{ Authorization:`Bearer ${token}` }});
    const data  = await res.json();
    if (data.status === 'sukses') {
      currentKey = data.api_key;
      document.getElementById('key-display').value = data.api_key;
      document.getElementById('key-display').type  = 'password';
      keyMasked = true; updateEye(false);
      localStorage.setItem('nyzz_apikey', data.api_key);
    } else alert('Error: ' + data.message);
  } catch { alert('Gagal!'); }
  finally { setTimeout(hideSpinner, 800); }
}

function copySign() {
  if (!currentSign) return;
  navigator.clipboard.writeText(currentSign);
  const btn = document.getElementById('btn-salin-sign');
  btn.textContent = '✓ Tersalin!'; btn.classList.add('copied');
  setTimeout(() => { btn.textContent = 'Salin Sign Key'; btn.classList.remove('copied'); }, 2000);
}

document.addEventListener('DOMContentLoaded', async () => {
  const token = localStorage.getItem('nyzz_token');
  if (!token) { document.getElementById('area-guest').style.display = 'block'; return; }
  try {
    const res  = await fetch(`${API}/auth/me`, { headers: { Authorization: `Bearer ${token}` }});
    const data = await res.json();
    if (data.status === 'sukses') {
      isLoggedIn = true;
      document.getElementById('area-guest').style.display = 'none';
      setKeyUI(data.user.api_key, data.user.sign_key);
    } else { document.getElementById('area-guest').style.display = 'block'; }
  } catch { document.getElementById('area-guest').style.display = 'block'; }
});
</script>
</body>
</html>
EOF
echo "  ✓ apikey.html"

echo "[2/4] Writing register.html..."
cat > register.html << 'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Register — NyzzAPI</title>
<link rel="stylesheet" href="style.css">
<style>
footer{border-top:1px solid var(--border);padding:28px 0;margin-top:16px}
.footer-inner{display:flex;flex-direction:column;align-items:center;gap:12px;text-align:center}
.footer-logo{display:flex;align-items:center;gap:8px;text-decoration:none}
.footer-logo-icon{width:28px;height:28px;border-radius:8px;background:linear-gradient(135deg,#6c5ce7,#a78bfa);display:flex;align-items:center;justify-content:center}
.footer-logo-text{font-size:14px;font-weight:800;color:var(--text)}
.footer-logo-text em{font-style:normal;color:var(--accent2)}
.footer-links{display:flex;align-items:center;gap:16px;flex-wrap:wrap;justify-content:center}
.footer-links a{font-size:12px;color:var(--muted);text-decoration:none}
.footer-copy{font-size:11px;color:var(--muted)}
</style>
</head>
<body style="background:var(--bg)">
<div style="min-height:100vh;display:flex;align-items:center;justify-content:center;padding:20px">
  <div style="width:100%;max-width:380px">
    <div class="auth-card">
      <div class="auth-logo">
        <div class="logo-icon" style="width:36px;height:36px;border-radius:10px;background:linear-gradient(135deg,#6c5ce7,#a78bfa);display:flex;align-items:center;justify-content:center">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg>
        </div>
        <span style="font-size:17px;font-weight:800;color:var(--text)">Nyzz<em style="font-style:normal;color:var(--accent2)">API</em></span>
      </div>
      <div class="auth-title">Buat Akun Baru</div>
      <div class="auth-desc">Daftar gratis — dapat API Key + 1000 req/hari.</div>
      <div class="auth-alert error"   id="alert-error"></div>
      <div class="auth-alert success" id="alert-success"></div>
      <div class="form-group">
        <label class="form-label">Username</label>
        <input type="text" class="form-input" id="reg-username" placeholder="namakamu" autocomplete="username">
      </div>
      <div class="form-group">
        <label class="form-label">Password</label>
        <input type="password" class="form-input" id="reg-pass" placeholder="Min. 6 karakter" autocomplete="new-password">
      </div>
      <div class="form-group">
        <label class="form-label">Konfirmasi Password</label>
        <input type="password" class="form-input" id="reg-pass2" placeholder="Ketik ulang password" autocomplete="new-password" onkeydown="if(event.key==='Enter')doRegister()">
      </div>
      <button class="btn-primary" id="reg-btn" onclick="doRegister()" style="margin-top:6px">
        <span class="btn-text">Daftar Gratis</span>
        <div class="spinner" style="display:none"></div>
      </button>
      <div class="auth-link">Sudah punya akun? <a href="login.html">Login</a></div>
      <div class="auth-link" style="margin-top:8px"><a href="index.html">← Dashboard</a></div>
    </div>
  </div>
</div>
<script>
const API='https://api.nyzz.my.id';
function showAlert(type,msg){['error','success'].forEach(t=>document.getElementById('alert-'+t).style.display='none');const el=document.getElementById('alert-'+type);el.textContent=msg;el.style.display='block';}
async function doRegister(){
  const username=document.getElementById('reg-username').value.trim();
  const password=document.getElementById('reg-pass').value;
  const pass2   =document.getElementById('reg-pass2').value;
  if(!username||!password||!pass2)return showAlert('error','Isi semua kolom!');
  if(password.length<6)return showAlert('error','Password minimal 6 karakter');
  if(password!==pass2)return showAlert('error','Password tidak cocok!');
  const btn=document.getElementById('reg-btn');
  btn.querySelector('.btn-text').style.display='none';btn.querySelector('.spinner').style.display='block';btn.disabled=true;
  try{
    const res=await fetch(`${API}/auth/register`,{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({username,email:username+'@nyzz.local',password})});
    const data=await res.json();
    if(data.status==='sukses'){
      localStorage.setItem('nyzz_token',data.token);
      localStorage.setItem('nyzz_user',JSON.stringify(data.user));
      localStorage.setItem('nyzz_apikey',data.user.api_key);
      showAlert('success','Registrasi berhasil! Mengalihkan...');
      setTimeout(()=>window.location.href='index.html',800);
    }else showAlert('error',data.message);
  }catch{showAlert('error','Gagal konek ke server');}
  finally{btn.querySelector('.btn-text').style.display='';btn.querySelector('.spinner').style.display='none';btn.disabled=false;}
}
if(localStorage.getItem('nyzz_token'))window.location.href='index.html';
</script>
</body>
</html>
EOF
echo "  ✓ register.html"

echo "[3/4] Writing login.html..."
cat > login.html << 'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Login — NyzzAPI</title>
<link rel="stylesheet" href="style.css">
</head>
<body style="background:var(--bg)">
<div style="min-height:100vh;display:flex;align-items:center;justify-content:center;padding:20px">
  <div style="width:100%;max-width:380px">
    <div class="auth-card">
      <div class="auth-logo">
        <div class="logo-icon" style="width:36px;height:36px;border-radius:10px;background:linear-gradient(135deg,#6c5ce7,#a78bfa);display:flex;align-items:center;justify-content:center">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg>
        </div>
        <span style="font-size:17px;font-weight:800;color:var(--text)">Nyzz<em style="font-style:normal;color:var(--accent2)">API</em></span>
      </div>
      <div class="auth-title">Masuk ke Akun</div>
      <div class="auth-desc">Masukkan username dan password kamu.</div>
      <div class="auth-alert error"   id="alert-error"></div>
      <div class="auth-alert success" id="alert-success"></div>
      <div class="form-group">
        <label class="form-label">Username</label>
        <input type="text" class="form-input" id="login-input" placeholder="username kamu" autocomplete="username">
      </div>
      <div class="form-group">
        <label class="form-label">Password</label>
        <input type="password" class="form-input" id="login-pass" placeholder="••••••••" autocomplete="current-password" onkeydown="if(event.key==='Enter')doLogin()">
      </div>
      <button class="btn-primary" id="login-btn" onclick="doLogin()" style="margin-top:6px">
        <span class="btn-text">Login</span>
        <div class="spinner" style="display:none"></div>
      </button>
      <div class="auth-link">Belum punya akun? <a href="register.html">Register</a></div>
      <div class="auth-link" style="margin-top:8px"><a href="index.html">← Dashboard</a></div>
    </div>
  </div>
</div>
<script>
const API='https://api.nyzz.my.id';
function showAlert(type,msg){['error','success'].forEach(t=>document.getElementById('alert-'+t).style.display='none');const el=document.getElementById('alert-'+type);el.textContent=msg;el.style.display='block';}
async function doLogin(){
  const login=document.getElementById('login-input').value.trim();
  const password=document.getElementById('login-pass').value;
  if(!login||!password)return showAlert('error','Isi semua kolom!');
  const btn=document.getElementById('login-btn');
  btn.querySelector('.btn-text').style.display='none';btn.querySelector('.spinner').style.display='block';btn.disabled=true;
  try{
    const res=await fetch(`${API}/auth/login`,{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({login,password})});
    const data=await res.json();
    if(data.status==='sukses'){
      localStorage.setItem('nyzz_token',data.token);
      localStorage.setItem('nyzz_user',JSON.stringify(data.user));
      localStorage.setItem('nyzz_apikey',data.user.api_key);
      showAlert('success','Login berhasil!');
      setTimeout(()=>window.location.href='index.html',800);
    }else showAlert('error',data.message);
  }catch{showAlert('error','Gagal konek ke server');}
  finally{btn.querySelector('.btn-text').style.display='';btn.querySelector('.spinner').style.display='none';btn.disabled=false;}
}
if(localStorage.getItem('nyzz_token'))window.location.href='index.html';
</script>
</body>
</html>
EOF
echo "  ✓ login.html"

echo "[4/4] Writing docs.html..."
cat > docs.html << 'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Documentation — NyzzAPI</title>
<link rel="stylesheet" href="style.css">
<style>
footer{border-top:1px solid var(--border);padding:28px 0;margin-top:16px}
.footer-inner{display:flex;flex-direction:column;align-items:center;gap:12px;text-align:center}
.footer-logo{display:flex;align-items:center;gap:8px;text-decoration:none}
.footer-logo-icon{width:28px;height:28px;border-radius:8px;background:linear-gradient(135deg,#6c5ce7,#a78bfa);display:flex;align-items:center;justify-content:center}
.footer-logo-text{font-size:14px;font-weight:800;color:var(--text)}
.footer-logo-text em{font-style:normal;color:var(--accent2)}
.footer-links{display:flex;align-items:center;gap:16px;flex-wrap:wrap;justify-content:center}
.footer-links a{font-size:12px;color:var(--muted);text-decoration:none;transition:color .2s}
.footer-links a:hover{color:var(--accent2)}
.footer-copy{font-size:11px;color:var(--muted)}
.lang-tabs{display:flex;gap:6px;flex-wrap:wrap;margin-bottom:14px}
.lang-tab{padding:6px 14px;border-radius:8px;font-size:12px;font-weight:600;cursor:pointer;border:1px solid var(--border2);background:transparent;color:var(--muted);transition:all .18s;font-family:'Inter',sans-serif}
.lang-tab.active{background:rgba(108,92,231,.12);border-color:rgba(108,92,231,.3);color:var(--accent2)}
.lang-content{display:none}
.lang-content.show{display:block}
.doc-section{background:var(--card);border:1px solid var(--border2);border-radius:14px;overflow:hidden;margin-bottom:16px}
.doc-section-head{padding:16px 20px;border-bottom:1px solid var(--border);display:flex;align-items:center;gap:10px}
.doc-section-title{font-size:15px;font-weight:700}
.doc-section-body{padding:20px}
.doc-section-desc{font-size:13px;color:var(--text2);line-height:1.65;margin-bottom:14px}
</style>
</head>
<body>
<div id="nav-wrap"></div>
<main class="main">
  <div class="page-header">
    <div class="page-title">Documentation</div>
    <div class="page-desc">Panduan lengkap cara menggunakan NyzzAPI di berbagai bahasa dan framework.</div>
  </div>

  <!-- LANG TABS -->
  <div class="lang-tabs">
    <button class="lang-tab active" onclick="showLang('html')">HTML</button>
    <button class="lang-tab" onclick="showLang('js')">JavaScript</button>
    <button class="lang-tab" onclick="showLang('nodejs')">Node.js</button>
    <button class="lang-tab" onclick="showLang('nextjs')">Next.js</button>
    <button class="lang-tab" onclick="showLang('python')">Python</button>
    <button class="lang-tab" onclick="showLang('curl')">cURL</button>
  </div>

  <!-- HTML -->
  <div class="lang-content show" id="lang-html">
    <div class="doc-section">
      <div class="doc-section-head"><span class="method-badge method-get">GET</span><div class="doc-section-title">Brat Generator — HTML</div></div>
      <div class="doc-section-body">
        <div class="doc-section-desc">Tampilkan gambar brat langsung di tag img tanpa perlu fetch.</div>
        <div class="code-block"><div class="code-top"><span class="code-lang">HTML</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
        <pre class="code-body">&lt;img src="https://api.nyzz.my.id/brat?text=halo&apikey=API_KEY" alt="brat"&gt;</pre></div>
        <div class="doc-section-desc">Form upload gambar:</div>
        <div class="code-block"><div class="code-top"><span class="code-lang">HTML Form Upload</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
        <pre class="code-body">&lt;form id="uploadForm"&gt;
  &lt;input type="file" id="fileInput" accept="image/*"&gt;
  &lt;button type="button" onclick="upload()"&gt;Upload&lt;/button&gt;
&lt;/form&gt;
&lt;p id="result"&gt;&lt;/p&gt;

&lt;script&gt;
async function upload() {
  const file = document.getElementById('fileInput').files[0];
  const form = new FormData();
  form.append('file', file);

  const res  = await fetch('https://api.nyzz.my.id/uploader/image?apikey=API_KEY', {
    method: 'POST', body: form
  });
  const data = await res.json();
  document.getElementById('result').textContent = data.data.view_url;
}
&lt;/script&gt;</pre></div>
      </div>
    </div>
  </div>

  <!-- JAVASCRIPT -->
  <div class="lang-content" id="lang-js">
    <div class="doc-section">
      <div class="doc-section-head"><span class="method-badge method-get">GET</span><div class="doc-section-title">Brat Generator — JavaScript</div></div>
      <div class="doc-section-body">
        <div class="doc-section-desc">Download gambar brat sebagai blob dan tampilkan/simpan.</div>
        <div class="code-block"><div class="code-top"><span class="code-lang">JavaScript / Fetch</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
        <pre class="code-body">// Tampilkan langsung di img
const img = document.getElementById('myImg');
img.src = `https://api.nyzz.my.id/brat?text=halo&apikey=API_KEY`;

// Atau download sebagai file
const res  = await fetch('https://api.nyzz.my.id/brat?text=halo&apikey=API_KEY');
const blob = await res.blob();
const url  = URL.createObjectURL(blob);
const a    = document.createElement('a');
a.href = url; a.download = 'brat.png'; a.click();</pre></div>
      </div>
    </div>
    <div class="doc-section">
      <div class="doc-section-head"><span class="method-badge method-post">POST</span><div class="doc-section-title">Upload Image — JavaScript</div></div>
      <div class="doc-section-body">
        <div class="code-block"><div class="code-top"><span class="code-lang">JavaScript / Fetch</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
        <pre class="code-body">const form = new FormData();
form.append('file', fileInput.files[0]);

const res  = await fetch('https://api.nyzz.my.id/uploader/image?apikey=API_KEY', {
  method: 'POST',
  body: form
});
const data = await res.json();

if (data.status === 'sukses') {
  console.log('URL:', data.data.view_url);
  console.log('Raw:', data.data.url);
} else {
  console.error('Error:', data.message);
}</pre></div>
      </div>
    </div>
  </div>

  <!-- NODE.JS -->
  <div class="lang-content" id="lang-nodejs">
    <div class="doc-section">
      <div class="doc-section-head"><span class="method-badge method-get">GET</span><div class="doc-section-title">Brat Generator — Node.js</div></div>
      <div class="doc-section-body">
        <div class="code-block"><div class="code-top"><span class="code-lang">Node.js / axios</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
        <pre class="code-body">const axios = require('axios');
const fs    = require('fs');

const res = await axios.get('https://api.nyzz.my.id/brat', {
  params:       { text: 'halo dunia', apikey: 'API_KEY' },
  responseType: 'stream'
});
res.data.pipe(fs.createWriteStream('brat.png'));
console.log('Brat saved!');</pre></div>
        <div class="code-block"><div class="code-top"><span class="code-lang">Node.js / Bot WhatsApp (Baileys)</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
        <pre class="code-body">const axios = require('axios');

// Command: .brat teks kamu
const text   = m.text.replace('.brat ', '');
const res    = await axios.get('https://api.nyzz.my.id/brat', {
  params: { text, apikey: 'API_KEY' },
  responseType: 'arraybuffer'
});
await conn.sendMessage(m.chat, {
  image: Buffer.from(res.data),
  caption: text
});</pre></div>
        <div class="code-block"><div class="code-top"><span class="code-lang">Node.js / Upload File</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
        <pre class="code-body">const axios    = require('axios');
const FormData = require('form-data');
const fs       = require('fs');

const form = new FormData();
form.append('file', fs.createReadStream('./foto.jpg'));

const res  = await axios.post(
  'https://api.nyzz.my.id/uploader/image?apikey=API_KEY',
  form,
  { headers: form.getHeaders() }
);
console.log('URL:', res.data.data.view_url);</pre></div>
      </div>
    </div>
  </div>

  <!-- NEXT.JS -->
  <div class="lang-content" id="lang-nextjs">
    <div class="doc-section">
      <div class="doc-section-head"><span class="method-badge method-get">GET</span><div class="doc-section-title">Brat Generator — Next.js</div></div>
      <div class="doc-section-body">
        <div class="code-block"><div class="code-top"><span class="code-lang">Next.js / React Component</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
        <pre class="code-body">'use client';
import { useState } from 'react';

export default function BratGenerator() {
  const [text, setText] = useState('');
  const [imgUrl, setImgUrl] = useState('');

  const generate = async () => {
    const url = `https://api.nyzz.my.id/brat?text=${encodeURIComponent(text)}&apikey=API_KEY`;
    const res  = await fetch(url);
    const blob = await res.blob();
    setImgUrl(URL.createObjectURL(blob));
  };

  return (
    &lt;div&gt;
      &lt;input value={text} onChange={e => setText(e.target.value)} placeholder="Teks brat..." /&gt;
      &lt;button onClick={generate}&gt;Generate&lt;/button&gt;
      {imgUrl && &lt;img src={imgUrl} alt="brat" /&gt;}
    &lt;/div&gt;
  );
}</pre></div>
        <div class="code-block"><div class="code-top"><span class="code-lang">Next.js / API Route (server-side)</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
        <pre class="code-body">// app/api/brat/route.js
export async function GET(request) {
  const { searchParams } = new URL(request.url);
  const text = searchParams.get('text') || 'brat';

  const res = await fetch(
    `https://api.nyzz.my.id/brat?text=${encodeURIComponent(text)}&apikey=${process.env.NYZZ_API_KEY}`
  );
  const buf = await res.arrayBuffer();
  return new Response(buf, { headers: { 'Content-Type': 'image/png' } });
}</pre></div>
      </div>
    </div>
  </div>

  <!-- PYTHON -->
  <div class="lang-content" id="lang-python">
    <div class="doc-section">
      <div class="doc-section-head"><span class="method-badge method-get">GET</span><div class="doc-section-title">Brat & Upload — Python</div></div>
      <div class="doc-section-body">
        <div class="code-block"><div class="code-top"><span class="code-lang">Python / requests — Brat</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
        <pre class="code-body">import requests

res = requests.get('https://api.nyzz.my.id/brat', params={
  'text':   'halo dunia',
  'apikey': 'API_KEY'
})
with open('brat.png', 'wb') as f:
    f.write(res.content)
print('Saved!')</pre></div>
        <div class="code-block"><div class="code-top"><span class="code-lang">Python / requests — Upload Image</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
        <pre class="code-body">import requests

with open('foto.jpg', 'rb') as f:
    res = requests.post(
        'https://api.nyzz.my.id/uploader/image',
        params={'apikey': 'API_KEY'},
        files={'file': f}
    )
data = res.json()
print('URL:', data['data']['view_url'])</pre></div>
      </div>
    </div>
  </div>

  <!-- CURL -->
  <div class="lang-content" id="lang-curl">
    <div class="doc-section">
      <div class="doc-section-head"><div class="doc-section-title">Semua Endpoint — cURL</div></div>
      <div class="doc-section-body">
        <div class="code-block"><div class="code-top"><span class="code-lang">Brat Generator</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
        <pre class="code-body">curl "https://api.nyzz.my.id/brat?text=halo&apikey=API_KEY" -o brat.png</pre></div>
        <div class="code-block"><div class="code-top"><span class="code-lang">Upload Image</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
        <pre class="code-body">curl -X POST "https://api.nyzz.my.id/uploader/image?apikey=API_KEY" \
  -F "file=@foto.jpg"</pre></div>
        <div class="code-block"><div class="code-top"><span class="code-lang">Upload Video</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
        <pre class="code-body">curl -X POST "https://api.nyzz.my.id/uploader/video?apikey=API_KEY" \
  -F "file=@video.mp4"</pre></div>
        <div class="code-block"><div class="code-top"><span class="code-lang">Upload Audio</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
        <pre class="code-body">curl -X POST "https://api.nyzz.my.id/uploader/audio?apikey=API_KEY" \
  -F "file=@audio.mp3"</pre></div>
        <div class="code-block"><div class="code-top"><span class="code-lang">Upload File</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
        <pre class="code-body">curl -X POST "https://api.nyzz.my.id/uploader/file?apikey=API_KEY" \
  -F "file=@dokumen.zip"</pre></div>
        <div class="code-block"><div class="code-top"><span class="code-lang">POST Brat (dengan header)</span><button class="code-copy" onclick="copyCode(this)">Copy</button></div>
        <pre class="code-body">curl -X POST "https://api.nyzz.my.id/brat" \
  -H "x-api-key: API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"text":"halo dunia"}' \
  -o brat.png</pre></div>
      </div>
    </div>
  </div>

  <!-- ENDPOINT LIST -->
  <div class="section" style="margin-top:16px">
    <div class="section-header"><div class="section-title">Semua Endpoint</div></div>
    <div class="docs-card">
      <div class="docs-card-header">
        <div class="docs-card-title">Base URL: https://api.nyzz.my.id</div>
        <div class="docs-card-desc">Semua request wajib menyertakan apikey.</div>
      </div>
      <div class="docs-card-body">
        <table class="params-table">
          <tr><th>Method</th><th>Endpoint</th><th>Deskripsi</th><th>Format</th></tr>
          <tr><td class="p-type">GET</td><td class="p-name">/brat</td><td>Generate brat image</td><td>?text=&apikey=</td></tr>
          <tr><td class="p-type">POST</td><td class="p-name">/brat</td><td>Generate brat image</td><td>body: {text, apikey}</td></tr>
          <tr><td class="p-type">POST</td><td class="p-name">/uploader/image</td><td>Upload JPG/PNG/JPEG</td><td>form-data: file</td></tr>
          <tr><td class="p-type">POST</td><td class="p-name">/uploader/video</td><td>Upload MP4</td><td>form-data: file</td></tr>
          <tr><td class="p-type">POST</td><td class="p-name">/uploader/audio</td><td>Upload MP3</td><td>form-data: file</td></tr>
          <tr><td class="p-type">POST</td><td class="p-name">/uploader/file</td><td>Upload semua format</td><td>form-data: file</td></tr>
          <tr><td class="p-type">POST</td><td class="p-name">/auth/register</td><td>Daftar akun</td><td>body: {username,email,password}</td></tr>
          <tr><td class="p-type">POST</td><td class="p-name">/auth/login</td><td>Login akun</td><td>body: {login,password}</td></tr>
          <tr><td class="p-type">GET</td><td class="p-name">/auth/me</td><td>Info akun</td><td>Bearer token</td></tr>
          <tr><td class="p-type">GET</td><td class="p-name">/user/stats</td><td>Statistik publik</td><td>—</td></tr>
        </table>
      </div>
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
      <div style="display:flex;flex-direction:column;align-items:center;gap:4px">
        <div class="footer-copy">Made with ❤️ by <a href="https://t.me/DzzXNzz" style="color:var(--accent2);text-decoration:none">@DzzXNzz</a></div>
        <div class="footer-copy">© 2026 NyzzAPI.</div>
      </div>
    </div>
  </div>
</footer>

<script src="app.js"></script>
<script>
function showLang(lang) {
  document.querySelectorAll('.lang-tab').forEach(t => t.classList.remove('active'));
  document.querySelectorAll('.lang-content').forEach(c => c.classList.remove('show'));
  event.target.classList.add('active');
  document.getElementById('lang-' + lang)?.classList.add('show');
}
</script>
</body>
</html>
EOF
echo "  ✓ docs.html"

echo ""
echo "╔══════════════════════════════════════╗"
echo "║     Semua halaman terupdate! ✓       ║"
echo "╚══════════════════════════════════════╝"
