const API = 'https://api.nyzz.my.id';

const LOGO_SVG = `<svg viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg>`;

// ── ALL API LIST (untuk search) ───────────────
const API_LIST = [
  { name:'Brat Generator', category:'Maker', method:'GET',  endpoint:'/brat',             page:'maker-brat.html',     desc:'Generate gambar brat style viral TikTok' },
  { name:'Image Upload',   category:'Uploader', method:'POST', endpoint:'/upload',         page:'uploader-image.html', desc:'Upload 1 file, dapatkan URL publik' },
  { name:'Multi Upload',   category:'Uploader', method:'POST', endpoint:'/upload/multiple',page:'uploader-multi.html', desc:'Upload hingga 5 file sekaligus' },
];

// ── SIDEBAR HTML ──────────────────────────────
const SIDEBAR_HTML = `
<nav class="topbar">
  <div class="topbar-left">
    <button class="hamburger" id="hamburger"><span></span><span></span><span></span></button>
    <a href="index.html" class="logo">
      <div class="logo-icon">${LOGO_SVG}</div>
      <div class="logo-text">Nyzz<em>API</em></div>
    </a>
  </div>
  <div class="topbar-right">
    <div class="status-dot">Online</div>
  </div>
</nav>
<div class="overlay" id="overlay"></div>
<aside class="sidebar" id="sidebar">
  <div class="sidebar-inner">

    <!-- SEARCH -->
    <div class="sidebar-search" onclick="openSearch()">
      <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
      Search API...
      <span class="search-kbd">⌘K</span>
    </div>

    <div class="sidebar-label">Main</div>
    <a class="sidebar-item" href="index.html" data-page="index.html">
      <span class="s-icon"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/></svg></span>
      Dashboard
    </a>
    <a class="sidebar-item" href="apikey.html" data-page="apikey.html">
      <span class="s-icon"><svg viewBox="0 0 24 24"><circle cx="8" cy="15" r="4"/><path d="M12 15h8M16 11v8"/></svg></span>
      API Key
    </a>
    <a class="sidebar-item" href="docs.html" data-page="docs.html">
      <span class="s-icon"><svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg></span>
      Documentation
    </a>

    <div class="sidebar-divider"></div>
    <div class="sidebar-label">API Categories</div>

    <!-- MAKER TOGGLE -->
    <button class="sidebar-item sidebar-toggle" id="toggle-maker" onclick="toggleGroup('maker')">
      <span class="s-icon"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="3"/><path d="M12 1v4M12 19v4M4.22 4.22l2.83 2.83M16.95 16.95l2.83 2.83M1 12h4M19 12h4M4.22 19.78l2.83-2.83M16.95 7.05l2.83-2.83"/></svg></span>
      Maker
      <span class="sidebar-badge">1</span>
      <svg class="chevron" id="chev-maker" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"/></svg>
    </button>
    <div class="sidebar-sub" id="group-maker" style="display:none">
      <a class="sidebar-item" href="maker-brat.html" data-page="maker-brat.html">
        <span class="s-icon"><svg viewBox="0 0 24 24"><path d="M12 2L2 7l10 5 10-5-10-5z"/><path d="M2 17l10 5 10-5"/><path d="M2 12l10 5 10-5"/></svg></span>
        Brat Generator
      </a>
    </div>

    <!-- UPLOADER TOGGLE -->
    <button class="sidebar-item sidebar-toggle" id="toggle-uploader" onclick="toggleGroup('uploader')">
      <span class="s-icon"><svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" y1="3" x2="12" y2="15"/></svg></span>
      Uploader
      <span class="sidebar-badge">2</span>
      <svg class="chevron" id="chev-uploader" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"/></svg>
    </button>
    <div class="sidebar-sub" id="group-uploader" style="display:none">
      <a class="sidebar-item" href="uploader-image.html" data-page="uploader-image.html">
        <span class="s-icon"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="18" height="18" rx="2"/><circle cx="8.5" cy="8.5" r="1.5"/><polyline points="21 15 16 10 5 21"/></svg></span>
        Image Upload
      </a>
      <a class="sidebar-item" href="uploader-multi.html" data-page="uploader-multi.html">
        <span class="s-icon"><svg viewBox="0 0 24 24"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/></svg></span>
        Multi Upload
      </a>
    </div>

  </div>
</aside>

<!-- SEARCH MODAL -->
<div class="modal-overlay" id="search-modal" onclick="if(event.target===this)closeSearch()">
  <div class="search-popup">
    <div class="search-input-wrap">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
      <input type="text" id="search-input" placeholder="Cari API... contoh: upload, brat" oninput="doSearch(this.value)" autocomplete="off">
      <button onclick="closeSearch()" class="search-close-btn">Esc</button>
    </div>
    <div id="search-results" class="search-results"></div>
  </div>
</div>`;

// ── INIT ──────────────────────────────────────
document.addEventListener('DOMContentLoaded', () => {
  const wrap = document.getElementById('nav-wrap');
  if (wrap) wrap.innerHTML = SIDEBAR_HTML;

  // Active page
  const page = window.location.pathname.split('/').pop() || 'index.html';
  document.querySelectorAll('.sidebar-item[data-page]').forEach(el => {
    if (el.dataset.page === page) {
      el.classList.add('active');
      // Auto-expand parent group
      const sub = el.closest('.sidebar-sub');
      if (sub) {
        sub.style.display = 'block';
        const groupId = sub.id.replace('group-','');
        const chev = document.getElementById('chev-'+groupId);
        if (chev) chev.style.transform = 'rotate(180deg)';
      }
    }
  });

  // Hamburger
  const hamburger = document.getElementById('hamburger');
  const sidebar   = document.getElementById('sidebar');
  const overlay   = document.getElementById('overlay');
  if (hamburger) {
    hamburger.onclick = () => {
      hamburger.classList.toggle('active');
      sidebar.classList.toggle('open');
      overlay.classList.toggle('show');
    };
    overlay.onclick = () => {
      hamburger.classList.remove('active');
      sidebar.classList.remove('open');
      overlay.classList.remove('show');
    };
  }

  // Close sidebar on mobile nav click
  document.querySelectorAll('.sidebar-item[data-page]').forEach(el => {
    el.addEventListener('click', () => {
      if (window.innerWidth < 768) {
        hamburger?.classList.remove('active');
        sidebar?.classList.remove('open');
        overlay?.classList.remove('show');
      }
    });
  });

  // Keyboard shortcut search
  document.addEventListener('keydown', e => {
    if ((e.metaKey || e.ctrlKey) && e.key === 'k') { e.preventDefault(); openSearch(); }
    if (e.key === 'Escape') closeSearch();
  });

  initUpload();
  trackRequest();
  renderSearchDefault();
});

// ── SIDEBAR TOGGLE ────────────────────────────
function toggleGroup(id) {
  const group = document.getElementById('group-' + id);
  const chev  = document.getElementById('chev-' + id);
  if (!group) return;
  const isOpen = group.style.display !== 'none';
  group.style.display = isOpen ? 'none' : 'block';
  if (chev) chev.style.transform = isOpen ? 'rotate(0deg)' : 'rotate(180deg)';
}

// ── SEARCH ────────────────────────────────────
function openSearch() {
  document.getElementById('search-modal')?.classList.add('show');
  setTimeout(() => document.getElementById('search-input')?.focus(), 100);
  renderSearchDefault();
}
function closeSearch() {
  document.getElementById('search-modal')?.classList.remove('show');
  const inp = document.getElementById('search-input');
  if (inp) inp.value = '';
  renderSearchDefault();
}
function renderSearchDefault() {
  renderResults(API_LIST);
}
function doSearch(q) {
  if (!q.trim()) { renderSearchDefault(); return; }
  const lower = q.toLowerCase();
  const results = API_LIST.filter(a =>
    a.name.toLowerCase().includes(lower) ||
    a.endpoint.toLowerCase().includes(lower) ||
    a.category.toLowerCase().includes(lower) ||
    a.desc.toLowerCase().includes(lower)
  );
  renderResults(results);
}
function renderResults(list) {
  const el = document.getElementById('search-results');
  if (!el) return;
  if (!list.length) {
    el.innerHTML = `<div class="search-empty">Tidak ada hasil ditemukan</div>`;
    return;
  }
  el.innerHTML = list.map(a => `
    <a class="search-item" href="${a.page}">
      <div class="search-item-left">
        <span class="method-badge ${a.method==='GET'?'method-get':'method-post'}">${a.method}</span>
        <div>
          <div class="search-item-name">${a.name}</div>
          <div class="search-item-ep">${a.endpoint}</div>
        </div>
      </div>
      <div class="search-item-cat">${a.category}</div>
    </a>
  `).join('');
}

// ── REQUEST COUNTER ───────────────────────────
function trackRequest() {
  const key = 'nyzz_total_requests';
  let count = parseInt(localStorage.getItem(key) || '1247');
  count++;
  localStorage.setItem(key, count);
  const el = document.getElementById('stat-requests');
  if (el) animateCount(el, count);
}
function animateCount(el, target) {
  let cur = Math.max(0, target - 50);
  const timer = setInterval(() => {
    cur = Math.min(cur + 2, target);
    el.textContent = cur.toLocaleString();
    if (cur >= target) clearInterval(timer);
  }, 16);
}

// ── MODALS ────────────────────────────────────
function openModal(id)  { document.getElementById(id)?.classList.add('show'); }
function closeModal(id) { document.getElementById(id)?.classList.remove('show'); }
document.addEventListener('click', e => {
  if (e.target.classList.contains('modal-overlay') && !e.target.id.includes('search')) {
    e.target.classList.remove('show');
  }
});

// ── RESPONSE TABS ─────────────────────────────
function switchTab(btn, groupPrefix, tabId) {
  btn.closest('.resp-tabs').querySelectorAll('.resp-tab').forEach(t => t.classList.remove('t-success','t-error'));
  const body = btn.closest('.docs-card-body') || btn.closest('.section');
  body?.querySelectorAll('.resp-content').forEach(c => c.classList.remove('show'));
  btn.classList.add(tabId.includes('success') ? 't-success' : 't-error');
  document.getElementById(groupPrefix + '-' + tabId)?.classList.add('show');
}

// ── CODE COPY ─────────────────────────────────
function copyCode(btn) {
  const pre = btn.closest('.code-block').querySelector('pre.code-body');
  navigator.clipboard.writeText(pre?.innerText||'').then(() => {
    btn.textContent='Copied!'; btn.classList.add('copied');
    setTimeout(()=>{btn.textContent='Copy';btn.classList.remove('copied');},2000);
  });
}

// ── UPLOAD ────────────────────────────────────
function initUpload() {
  const input = document.getElementById('upload-input');
  const zone  = document.getElementById('upload-zone');
  if (!input || !zone) return;
  input.onchange = () => {
    const file = input.files[0]; if (!file) return;
    const r = new FileReader();
    r.onload = e => { zone.innerHTML=`<img class="upload-preview" src="${e.target.result}">`; };
    r.readAsDataURL(file);
    const res = document.getElementById('upload-result');
    if (res) res.style.display='none';
  };
  zone.addEventListener('dragover', e=>{e.preventDefault();zone.classList.add('drag');});
  zone.addEventListener('dragleave',()=>zone.classList.remove('drag'));
  zone.addEventListener('drop',e=>{
    e.preventDefault();zone.classList.remove('drag');
    const f=e.dataTransfer.files[0];if(!f)return;
    const dt=new DataTransfer();dt.items.add(f);
    input.files=dt.files;input.dispatchEvent(new Event('change'));
  });
}
async function doUpload() {
  const input=document.getElementById('upload-input');
  if(!input?.files[0])return alert('Pilih file dulu!');
  const btn=document.getElementById('upload-btn');
  const txt=btn.querySelector('.btn-text');
  const spn=btn.querySelector('.spinner');
  btn.disabled=true;txt.style.display='none';spn.style.display='block';
  try {
    const form=new FormData();form.append('file',input.files[0]);
    const res=await fetch(`${API}/upload`,{method:'POST',body:form});
    const data=await res.json();
    if(data.status==='sukses'){
      document.getElementById('upload-url').textContent=data.data.link;
      document.getElementById('upload-result').style.display='block';
      const k='nyzz_total_requests';
      localStorage.setItem(k,parseInt(localStorage.getItem(k)||0)+1);
    } else alert('Error: '+data.message);
  } catch(e){alert('Gagal: '+e.message);}
  finally{btn.disabled=false;txt.style.display='';spn.style.display='none';}
}
function copyUrl(btnId='copy-btn',urlId='upload-url'){
  const url=document.getElementById(urlId)?.textContent;if(!url)return;
  navigator.clipboard.writeText(url);
  const btn=document.getElementById(btnId);
  btn.textContent='✓ Tersalin!';btn.classList.add('copied');
  setTimeout(()=>{btn.textContent='Salin URL';btn.classList.remove('copied');},2000);
}

// ── BRAT ──────────────────────────────────────
let _bt;
function previewBrat(){
  clearTimeout(_bt);
  const text=document.getElementById('brat-text')?.value.trim();
  const preview=document.getElementById('brat-preview');
  const dl=document.getElementById('brat-download');
  if(!text){if(preview)preview.style.display='none';if(dl)dl.style.display='none';return;}
  _bt=setTimeout(()=>{
    const url=`${API}/brat?text=${encodeURIComponent(text)}`;
    const img=document.getElementById('brat-img');
    img.src=url;
    img.onload=()=>{preview.style.display='block';};
    dl.href=url;dl.style.display='block';
  },500);
}
async function generateBrat(){
  const text=document.getElementById('brat-text')?.value.trim();
  if(!text)return alert('Isi teks dulu!');
  const btn=document.getElementById('brat-btn');
  const txt=btn.querySelector('.btn-text');
  const spn=btn.querySelector('.spinner');
  btn.disabled=true;txt.style.display='none';spn.style.display='block';
  const url=`${API}/brat?text=${encodeURIComponent(text)}`;
  const img=document.getElementById('brat-img');
  img.src=url;
  img.onload=()=>{
    document.getElementById('brat-preview').style.display='block';
    const dl=document.getElementById('brat-download');
    dl.href=url;dl.style.display='block';
    btn.disabled=false;txt.style.display='';spn.style.display='none';
  };
  img.onerror=()=>{
    alert('Gagal generate!');
    btn.disabled=false;txt.style.display='';spn.style.display='none';
  };
}
