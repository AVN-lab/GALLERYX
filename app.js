// ── Photo data ────────────────────────────────────────────────
// Using Unsplash Source for royalty-free demo images (category-based URLs).
const PHOTOS = [
  { id: 1,  title: 'Golden Hour Valley',      category: 'Nature',       author: 'Alex Rivers',    url: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600&q=80' },
  { id: 2,  title: 'City Lights at Dusk',     category: 'Urban',        author: 'Sam Torres',     url: 'https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?w=600&q=80' },
  { id: 3,  title: 'Ocean Horizon',           category: 'Seascape',     author: 'Mia Chen',       url: 'https://images.unsplash.com/photo-1505118380757-91f5f5632de0?w=600&q=80' },
  { id: 4,  title: 'Abstract Bloom',          category: 'Macro',        author: 'Jordan Lee',     url: 'https://images.unsplash.com/photo-1490750967868-88df5691cc43?w=600&q=80' },
  { id: 5,  title: 'Desert Dunes',            category: 'Landscape',    author: 'Priya Singh',    url: 'https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=600&q=80' },
  { id: 6,  title: 'Forest Path',             category: 'Nature',       author: 'Luca Moretti',   url: 'https://images.unsplash.com/photo-1448375240586-882707db888b?w=600&q=80' },
  { id: 7,  title: 'Mountain Peak',           category: 'Adventure',    author: 'Kai Nakamura',   url: 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=600&q=80' },
  { id: 8,  title: 'Rainy Street Café',       category: 'Urban',        author: 'Chloé Martin',   url: 'https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=600&q=80' },
  { id: 9,  title: 'Aurora Borealis',         category: 'Night Sky',    author: 'Finn Eriksson',  url: 'https://images.unsplash.com/photo-1531366936337-7c912a4589a7?w=600&q=80' },
  { id: 10, title: 'Tropical Waterfall',      category: 'Nature',       author: 'Sofia Vasquez',  url: 'https://images.unsplash.com/photo-1555169062-013468b47731?w=600&q=80' },
  { id: 11, title: 'Old Town Alley',          category: 'Architecture', author: 'Omar Hassan',    url: 'https://images.unsplash.com/photo-1519677100203-a0e668c92439?w=600&q=80' },
  { id: 12, title: 'Autumn Reflections',      category: 'Landscape',    author: 'Elena Popova',   url: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=600&q=80' },
];

const STORAGE_KEY = 'galleryx_maybe_later';

// ── State ─────────────────────────────────────────────────────
function loadSaved() {
  try {
    return new Set(JSON.parse(localStorage.getItem(STORAGE_KEY) || '[]'));
  } catch {
    return new Set();
  }
}

function persistSaved(saved) {
  localStorage.setItem(STORAGE_KEY, JSON.stringify([...saved]));
}

let savedIds = loadSaved();

// ── DOM helpers ───────────────────────────────────────────────
function createCard(photo, inLaterTab) {
  const isSaved = savedIds.has(photo.id);

  const card = document.createElement('article');
  card.className = 'card';
  card.dataset.id = photo.id;

  card.innerHTML = `
    <div class="card-img-wrap">
      <img src="${photo.url}" alt="${photo.title}" loading="lazy" />
      <span class="card-category">${photo.category}</span>
    </div>
    <div class="card-body">
      <h2 class="card-title">${photo.title}</h2>
      <p class="card-meta">By ${photo.author}</p>
      <button class="btn-later${isSaved ? ' saved' : ''}" data-id="${photo.id}">
        <span class="icon">${isSaved ? '🕰️' : '🔖'}</span>
        <span class="label">${isSaved ? (inLaterTab ? 'Remove' : 'Saved') : 'Maybe Later'}</span>
      </button>
    </div>
  `;

  return card;
}

// ── Render ────────────────────────────────────────────────────
function renderGallery() {
  const grid = document.getElementById('gallery-grid');
  grid.innerHTML = '';
  PHOTOS.forEach(photo => grid.appendChild(createCard(photo, false)));
}

function renderLater() {
  const grid    = document.getElementById('later-grid');
  const empty   = document.getElementById('later-empty');
  const saved   = PHOTOS.filter(p => savedIds.has(p.id));

  grid.innerHTML = '';

  if (saved.length === 0) {
    empty.style.display = 'block';
    grid.style.display  = 'none';
  } else {
    empty.style.display = 'none';
    grid.style.display  = '';
    saved.forEach(photo => grid.appendChild(createCard(photo, true)));
  }
}

function updateBadge() {
  const badge = document.getElementById('later-count');
  const count = savedIds.size;
  badge.textContent = count;
  badge.dataset.count = count;
}

// ── Toggle Maybe Later ────────────────────────────────────────
function toggleLater(id, inLaterTab, btn) {
  if (savedIds.has(id)) {
    savedIds.delete(id);
  } else {
    savedIds.add(id);
  }
  persistSaved(savedIds);
  updateBadge();

  // Refresh only the relevant tab to avoid full re-render flicker
  if (inLaterTab) {
    renderLater();
  } else if (btn) {
    // Update just the clicked card's button state in-place
    const isSaved = savedIds.has(id);
    btn.classList.toggle('saved', isSaved);
    btn.querySelector('.icon').textContent = isSaved ? '🕰️' : '🔖';
    btn.querySelector('.label').textContent = isSaved ? 'Saved' : 'Maybe Later';
  }
}

// ── Tab switching ─────────────────────────────────────────────
function switchTab(tab) {
  document.querySelectorAll('.tab-btn').forEach(btn => {
    btn.classList.toggle('active', btn.dataset.tab === tab);
  });
  document.querySelectorAll('.tab-panel').forEach(panel => {
    panel.classList.toggle('active', panel.id === `tab-${tab}`);
  });

  if (tab === 'later') renderLater();
}

// ── Event delegation ──────────────────────────────────────────
document.getElementById('gallery-grid').addEventListener('click', e => {
  const btn = e.target.closest('.btn-later');
  if (!btn) return;
  toggleLater(Number(btn.dataset.id), false, btn);
});

document.getElementById('later-grid').addEventListener('click', e => {
  const btn = e.target.closest('.btn-later');
  if (!btn) return;
  toggleLater(Number(btn.dataset.id), true);
});

document.querySelector('.nav-tabs').addEventListener('click', e => {
  const btn = e.target.closest('.tab-btn');
  if (!btn) return;
  switchTab(btn.dataset.tab);
});

// ── Init ──────────────────────────────────────────────────────
renderGallery();
updateBadge();
