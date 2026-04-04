const API = 'https://api.nyzz.my.id';

const LOGO_SVG = `<svg viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg>`;

const API_LIST = [
  { name:'Brat Generator', category:'Maker',    method:'GET',  endpoint:'/brat',             page:'maker-brat.html',     desc:'Generate gambar brat style viral TikTok' },
  { name:'Image Upload',   category:'Uploader', method:'POST', endpoint:'/uploader/image',   page:'uploader-image.html', desc:'Upload gambar JPG, PNG, JPEG' },
  { name:'Video Upload',   category:'Uploader', method:'POST', endpoint:'/uploader/video',   page:'uploader-video.html', desc:'Upload video MP4' },
  { name:'Audio Upload',   category:'Uploader', method:'POST', endpoint:'/uploader/audio',   page:'uploader-audio.html', desc:'Upload audio MP3' },
  { name:'File Upload',    category:'Uploader', method:'POST', endpoint:'/uploader/file',    page:'uploader-file.html',  desc:'Upload semua format file' },
];

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
    <div class="sidebar-search" onclick="openSearch()">
      <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
      Search API...
    </div>

    <div class="sidebar-label">Main</div>
    <a class="sidebar-item" href="index.html" data-page="index.html">
      <span class="s-icon"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/></svg></span>Dashboard
    </a>
    <a class="sidebar-item" href="apikey.html" data-page="apikey.html">
      <span class="s-icon"><svg viewBox="0 0 24 24"><circle cx="8" cy="15" r="4"/><path d="M12 15h8M16 11v8"/></svg></span>API Key
    </a>
    <a class="sidebar-item" href="docs.html" data-page="docs.html">
      <span class="s-icon"><svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg></span>Documentation
    </a>

    <div class="sidebar-divider"></div>
    <div class="sidebar-label">API Categories</div>

    <button class="sidebar-item sidebar-toggle" onclick="toggleGroup('maker')">
      <span class="s-icon"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="3"/><path d="M12 1v4M12 19v4M4.22 4.22l2.83 2.83M16.95 16.95l2.83 2.83M1 12h4M19 12h4M4.22 19.78l2.83-2.83M16.95 7.05l2.83-2.83"/></svg></span>
      Maker
      <span class="sidebar-badge">1</span>
      <svg class="chevron" id="chev-maker" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"/></svg>
    </button>
    <div class="sidebar-sub" id="group-maker" style="display:none">
      <a class="sidebar-item" href="maker-brat.html" data-page="maker-brat.html">
        <span class="s-icon"><svg viewBox="0 0 24 24"><path d="M12 2L2 7l10 5 10-5-10-5z"/><path d="M2 17l10 5 10-5"/><path d="M2 12l10 5 10-5"/></svg></span>Brat Generator
      </a>
    </div>

    <button class="sidebar-item sidebar-toggle" onclick="toggleGroup('uploader')">
      <span class="s-icon"><svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" y1="3" x2="12" y2="15"/></svg></span>
      Uploader
      <span class="sidebar-badge">4</span>
      <svg class="chevron" id="chev-uploader" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"/></svg>
    </button>
    <div class="sidebar-sub" id="group-uploader" style="display:none">
      <a class="sidebar-item" href="uploader-image.html" data-page="uploader-image.html">
        <span class="s-icon"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="18" height="18" rx="2"/><circle cx="8.5" cy="8.5" r="1.5"/><polyline points="21 15 16 10 5 21"/></svg></span>Image Upload
      </a>
      <a class="sidebar-item" href="uploader-video.html" data-page="uploader-video.html">
        <span class="s-icon"><svg viewBox="0 0 24 24"><polygon points="23 7 16 12 23 17 23 7"/><rect x="1" y="5" width="15" height="14" rx="2"/></svg></span>Video Upload
      </a>
      <a class="sidebar-item" href="uploader-audio.html" data-page="uploader-audio.html">
        <span class="s-icon"><svg viewBox="0 0 24 24"><path d="M9 18V5l12-2v13"/><circle cx="6" cy="18" r="3"/><circle cx="18" cy="16" r="3"/></svg></span>Audio Upload
      </a>
      <a class="sidebar-item" href="uploader-file.html" data-page="uploader-file.html">
        <span class="s-icon"><svg viewBox="0 0 24 24"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/></svg></span>File Upload
      </a>
    </div>

    <div class="sidebar-divider"></div>
    <div class="sidebar-label">Akun</div>

    <a class="sidebar-item" href="account.html" data-page="account.html">
      <span class="s-icon"><svg viewBox="0 0 24 24"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg></span>
      <span id="sidebar-account-text">Profil</span>
    </a>
    <a class="sidebar-item" href="settings.html" data-page="settings.html">
      <span class="s-icon"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83-2.83l.06-.06A1.65 1.65 0 0 0 4.68 15a1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1 0-4h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 2.83-2.83l.06.06A1.65 1.65 0 0 0 9 4.68a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 2.83l-.06.06A1.65 1.65 0 0 0 19.4 9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1z"/></svg></span>Setting
    </a>

    <div id="sidebar-auth-area"></div>
  </div>
</aside>

<div class="modal-overlay" id="search-modal" onclick="if(event.target===this)closeSearch()">
  <div class="search-popup">
    <div class="search-input-wrap">
      <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
      <input type="text" id="search-input" placeholder="Cari API... contoh: upload, brat" oninput="doSearch(this.value)" autocomplete="off">
    </div>
    <div id="search-results" class="search-results"></div>
  </div>
</div>`;

document.addEventListener('DOMContentLoaded', () => {
  const wrap = document.getElementById('nav-wrap');
  if (wrap) wrap.innerHTML = SIDEBAR_HTML;

  const page = window.location.pathname.split('/').pop() || 'index.html';
  document.querySelectorAll('.sidebar-item[data-page]').forEach(el => {
    if (el.dataset.page === page) {
      el.classList.add('active');
      const sub = el.closest('.sidebar-sub');
      if (sub) {
        sub.style.display = 'block';
        const gid = sub.id.replace('group-','');
        const chev = document.getElementById('chev-'+gid);
        if (chev) chev.style.transform = 'rotate(180deg)';
      }
    }
  });

  const hamburger = document.getElementById('hamburger');
  const sidebar   = document.getElementById('sidebar');
  const overlay   = document.getElementById('overlay');
  if (hamburger) {
    hamburger.onclick = () => { hamburger.classList.toggle('active'); sidebar.classList.toggle('open'); overlay.classList.toggle('show'); };
    overlay.onclick   = () => { hamburger.classList.remove('active'); sidebar.classList.remove('open'); overlay.classList.remove('show'); };
  }

  document.addEventListener('keydown', e => {
    if ((e.metaKey||e.ctrlKey)&&e.key==='k'){e.preventDefault();openSearch();}
    if (e.key==='Escape') closeSearch();
  });

  initUpload();
  trackRequest();
  updateAuthSidebar();
  renderSearchDefault();
});

function updateAuthSidebar() {
  const area  = document.getElementById('sidebar-auth-area'); if (!area) return;
  const token = localStorage.getItem('nyzz_token');
  const user  = JSON.parse(localStorage.getItem('nyzz_user')||'null');
  if (token && user) {
    area.innerHTML = `
      <div class="sidebar-user">
        <div class="sidebar-avatar">${user.username?.[0]?.toUpperCase()||'U'}</div>
        <div class="sidebar-user-info">
          <div class="sidebar-username">${user.username}</div>
          <div class="sidebar-plan">${user.plan==='premium'?'⭐ Premium':'Free Plan'}</div>
        </div>
      </div>
      <button class="sidebar-item sidebar-logout" onclick="logout()">
        <span class="s-icon"><svg viewBox="0 0 24 24"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg></span>Logout
      </button>`;
  } else {
    area.innerHTML = `
      <a class="sidebar-item" href="login.html">
        <span class="s-icon"><svg viewBox="0 0 24 24"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" y1="12" x2="3" y2="12"/></svg></span>Login
      </a>
      <a class="sidebar-item" href="register.html">
        <span class="s-icon"><svg viewBox="0 0 24 24"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="8.5" cy="7" r="4"/><line x1="20" y1="8" x2="20" y2="14"/><line x1="23" y1="11" x2="17" y2="11"/></svg></span>Register
      </a>`;
  }
}
function logout() { localStorage.removeItem('nyzz_token'); localStorage.removeItem('nyzz_user'); window.location.href='index.html'; }

function toggleGroup(id) {
  const group=document.getElementById('group-'+id); const chev=document.getElementById('chev-'+id); if(!group)return;
  const isOpen=group.style.display!=='none'; group.style.display=isOpen?'none':'block';
  if(chev)chev.style.transform=isOpen?'rotate(0deg)':'rotate(180deg)';
}

function openSearch(){document.getElementById('search-modal')?.classList.add('show');setTimeout(()=>document.getElementById('search-input')?.focus(),80);renderSearchDefault();}
function closeSearch(){document.getElementById('search-modal')?.classList.remove('show');const inp=document.getElementById('search-input');if(inp)inp.value='';}
function renderSearchDefault(){renderResults(API_LIST);}
function doSearch(q){if(!q.trim()){renderSearchDefault();return;}const l=q.toLowerCase();renderResults(API_LIST.filter(a=>a.name.toLowerCase().includes(l)||a.endpoint.toLowerCase().includes(l)||a.category.toLowerCase().includes(l)||a.desc.toLowerCase().includes(l)));}
function renderResults(list){
  const el=document.getElementById('search-results');if(!el)return;
  if(!list.length){el.innerHTML=`<div class="search-empty">Tidak ada hasil</div>`;return;}
  el.innerHTML=list.map(a=>`<a class="search-item" href="${a.page}"><div class="search-item-left"><span class="method-badge ${a.method==='GET'?'method-get':'method-post'}">${a.method}</span><div><div class="search-item-name">${a.name}</div><div class="search-item-ep">${a.endpoint}</div></div></div><div class="search-item-cat">${a.category}</div></a>`).join('');
}

async function trackRequest(){
  const el=document.getElementById('stat-requests'); const eu=document.getElementById('stat-users');
  try{
    const res=await fetch(`${API}/user/stats`); const data=await res.json();
    if(data.status==='sukses'){if(el)animateCount(el,data.data.total_requests);if(eu)animateCount(eu,data.data.total_users);}
  }catch{const k='nyzz_total_requests';let c=parseInt(localStorage.getItem(k)||'0')+1;localStorage.setItem(k,c);if(el)animateCount(el,c);}
}
function animateCount(el,target){let cur=Math.max(0,target-40);const t=setInterval(()=>{cur=Math.min(cur+2,target);el.textContent=cur.toLocaleString();if(cur>=target)clearInterval(t);},16);}

function openModal(id){document.getElementById(id)?.classList.add('show');}
function closeModal(id){document.getElementById(id)?.classList.remove('show');}
document.addEventListener('click',e=>{if(e.target.classList.contains('modal-overlay')&&e.target.id!=='search-modal')e.target.classList.remove('show');});

function switchTab(btn,groupPrefix,tabId){
  btn.closest('.resp-tabs').querySelectorAll('.resp-tab').forEach(t=>t.classList.remove('t-success','t-error'));
  const body=btn.closest('.docs-card-body')||btn.closest('.section');
  body?.querySelectorAll('.resp-content').forEach(c=>c.classList.remove('show'));
  btn.classList.add(tabId.includes('success')?'t-success':'t-error');
  document.getElementById(groupPrefix+'-'+tabId)?.classList.add('show');
}
function copyCode(btn){const pre=btn.closest('.code-block').querySelector('pre.code-body');navigator.clipboard.writeText(pre?.innerText||'').then(()=>{btn.textContent='Copied!';btn.classList.add('copied');setTimeout(()=>{btn.textContent='Copy';btn.classList.remove('copied');},2000);});}

function initUpload(){
  const input=document.getElementById('upload-input'); const zone=document.getElementById('upload-zone'); if(!input||!zone)return;
  input.onchange=()=>{const file=input.files[0];if(!file)return;const r=new FileReader();r.onload=e=>{zone.innerHTML=`<img class="upload-preview" src="${e.target.result}">`;};r.readAsDataURL(file);const res=document.getElementById('upload-result');if(res)res.style.display='none';};
  zone.addEventListener('dragover',e=>{e.preventDefault();zone.classList.add('drag');});
  zone.addEventListener('dragleave',()=>zone.classList.remove('drag'));
  zone.addEventListener('drop',e=>{e.preventDefault();zone.classList.remove('drag');const f=e.dataTransfer.files[0];if(!f)return;const dt=new DataTransfer();dt.items.add(f);input.files=dt.files;input.dispatchEvent(new Event('change'));});
}
async function doUpload(endpoint='/uploader/image',fieldName='file',inputId='upload-input',btnId='upload-btn',resultId='upload-result',urlId='upload-url'){
  const input=document.getElementById(inputId); if(!input?.files[0])return alert('Pilih file dulu!');
  const btn=document.getElementById(btnId); const txt=btn.querySelector('.btn-text'); const spn=btn.querySelector('.spinner');
  btn.disabled=true;txt.style.display='none';spn.style.display='block';
  try{
    const apiKey=localStorage.getItem('nyzz_apikey')||prompt('Masukkan API Key kamu:');
    if(!apiKey){btn.disabled=false;txt.style.display='';spn.style.display='none';return;}
    const form=new FormData();form.append(fieldName,input.files[0]);
    const res=await fetch(`${API}${endpoint}?apikey=${apiKey}`,{method:'POST',body:form});
    const data=await res.json();
    if(data.status==='sukses'){document.getElementById(urlId).textContent=data.data.view_url||data.data.url;document.getElementById(resultId).style.display='block';localStorage.setItem('nyzz_apikey',apiKey);}
    else alert('Error: '+data.message);
  }catch(e){alert('Gagal: '+e.message);}
  finally{btn.disabled=false;txt.style.display='';spn.style.display='none';}
}
function copyUrl(btnId='copy-btn',urlId='upload-url'){const url=document.getElementById(urlId)?.textContent;if(!url)return;navigator.clipboard.writeText(url);const btn=document.getElementById(btnId);btn.textContent='✓ Tersalin!';btn.classList.add('copied');setTimeout(()=>{btn.textContent='Salin URL';btn.classList.remove('copied');},2000);}

async function generateBrat(){
  const text=document.getElementById('brat-text')?.value.trim(); if(!text)return alert('Isi teks dulu!');
  const btn=document.getElementById('brat-btn'); const txt=btn.querySelector('.btn-text'); const spn=btn.querySelector('.spinner');
  btn.disabled=true;txt.style.display='none';spn.style.display='block';
  try{
    const apiKey=localStorage.getItem('nyzz_apikey')||prompt('Masukkan API Key kamu:');
    if(!apiKey){btn.disabled=false;txt.style.display='';spn.style.display='none';return;}
    const url=`${API}/brat?text=${encodeURIComponent(text)}&apikey=${apiKey}`;
    const res=await fetch(url); if(!res.ok)throw new Error('Gagal generate');
    const blob=await res.blob(); const objUrl=URL.createObjectURL(blob);
    const img=document.getElementById('brat-img'); img.src=objUrl;
    document.getElementById('brat-preview').style.display='block';
    const dl=document.getElementById('brat-download'); dl.href=objUrl; dl.download='brat.png'; dl.style.display='block';
    localStorage.setItem('nyzz_apikey',apiKey);
  }catch(e){alert('Gagal: '+e.message);}
  finally{btn.disabled=false;txt.style.display='';spn.style.display='none';}
}
