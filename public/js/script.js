
// Sidebar Toggle
const sidebarToggle = document.querySelector('.dl-sidebar-toggle');
const mobileMenu = document.querySelector('.dl-mobile-menu');

sidebarToggle.addEventListener('click', function () {
    mobileMenu.classList.toggle('dl-active');
});

// Mobile Search Toggle
const mobileSearchToggle = document.querySelector('.dl-mobile-search-toggle');
const mobileSearchContainer = document.querySelector('.dl-mobile-search-container');

mobileSearchToggle.addEventListener('click', function () {
    mobileSearchContainer.classList.toggle('dl-active');
});

// Close sidebar when clicking outside
document.addEventListener('click', function (event) {
    if (!event.target.closest('.dl-sidebar-toggle') && !event.target.closest('.dl-mobile-menu')) {
        mobileMenu.classList.remove('dl-active');
        console.log('tess');
    }

    if (!event.target.closest('.dl-mobile-search-toggle') && !event.target.closest('.dl-mobile-search-container')) {
        mobileSearchContainer.classList.remove('dl-active');
    }
});

// Hero Slider Functionality
const heroSlider = document.querySelector('.dl-hero-slider');
const slides = document.querySelectorAll('.dl-hero-slide');
const bullets = document.querySelectorAll('.dl-hero-pagination-bullet');
const prevBtn = document.querySelector('.dl-hero-prev');
const nextBtn = document.querySelector('.dl-hero-next');

let currentSlide = 0;
let slideInterval;

// Update slide position
function updateSlider() {
    heroSlider.style.transform = `translateX(-${currentSlide * 100}%)`;

    // Update active bullet
    bullets.forEach((bullet, index) => {
        bullet.classList.toggle('active', index === currentSlide);
    });
}

// Next slide
function nextSlide() {
    currentSlide = (currentSlide + 1) % slides.length;
    updateSlider();
}

// Previous slide
function prevSlide() {
    currentSlide = (currentSlide - 1 + slides.length) % slides.length;
    updateSlider();
}

// Auto slide
function startInterval() {
    slideInterval = setInterval(nextSlide, 5000);
}

// Event listeners
nextBtn.addEventListener('click', () => {
    nextSlide();
    resetInterval();
});

prevBtn.addEventListener('click', () => {
    prevSlide();
    resetInterval();
});

// Bullet click
bullets.forEach((bullet, index) => {
    bullet.addEventListener('click', () => {
        currentSlide = index;
        updateSlider();
        resetInterval();
    });
});

// Reset interval
function resetInterval() {
    clearInterval(slideInterval);
    startInterval();
}

// Initialize
startInterval();

// Pause on hover
heroSlider.addEventListener('mouseenter', () => {
    clearInterval(slideInterval);
});

heroSlider.addEventListener('mouseleave', startInterval);

// Clear history button
const clearHistoryBtn = document.getElementById('dl-clear-history');
clearHistoryBtn.addEventListener('click', function () {
    historyContainer.innerHTML = `
            <div class="dl-empty-state">
                <i class="fas fa-history"></i>
                <p>Riwayat nontonmu masih kosong</p>
                <a href="#trending" class="dl-btn-primary">Mulai Menonton</a>
            </div>
        `;
});

// Filter top donghua by genre
const filterButtons = document.querySelectorAll('.dl-filter-btn');
filterButtons.forEach(button => {
    button.addEventListener('click', function () {
        // Remove active class from all buttons
        filterButtons.forEach(btn => btn.classList.remove('dl-active'));
        // Add active class to clicked button
        this.classList.add('dl-active');

        const filter = this.dataset.filter;
        const cards = document.querySelectorAll('.dl-top-donghua .dl-card');

        cards.forEach(card => {
            if (filter === 'all') {
                card.style.display = 'flex';
            } else {
                const genres = card.dataset.genre.split(',');
                if (genres.includes(filter)) {
                    card.style.display = 'flex';
                } else {
                    card.style.display = 'none';
                }
            }
        });
    });
});

// Helper function to create history item
function createHistoryItem(item) {
    const historyItem = document.createElement('div');
    historyItem.className = 'dl-history-item';
    historyItem.innerHTML = `
            <div class="dl-history-content">
                <h3 class="dl-history-title">${item.title}</h3>
                <div class="dl-history-meta">
                    <span>${item.episode}</span>
                    <span>${item.time}</span>
                </div>
                <div class="dl-history-progress">
                    <div class="dl-history-progress-bar" style="width: ${item.progress}%"></div>
                </div>
            </div>
        `;
    return historyItem;
}