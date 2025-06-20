document.addEventListener('DOMContentLoaded', function() {
    // Sidebar Toggle
    const sidebarToggle = document.querySelector('.sidebar-toggle');
    const mobileMenu = document.querySelector('.mobile-menu');
    
    sidebarToggle.addEventListener('click', function() {
        mobileMenu.classList.toggle('active');
    });
    
    // Mobile Search Toggle
    const mobileSearchToggle = document.querySelector('.mobile-search-toggle');
    const mobileSearchContainer = document.querySelector('.mobile-search-container');
    
    mobileSearchToggle.addEventListener('click', function() {
        mobileSearchContainer.classList.toggle('active');
    });
    
    // Close sidebar when clicking outside
    document.addEventListener('click', function(event) {
        if (!event.target.closest('.sidebar-toggle') && !event.target.closest('.mobile-menu')) {
            mobileMenu.classList.remove('active');
        }
        
        if (!event.target.closest('.mobile-search-toggle') && !event.target.closest('.mobile-search-container')) {
            mobileSearchContainer.classList.remove('active');
        }
    });
    
    // Sample data for donghua (in a real app, this would come from an API)
    const donghuaData = [
        {
            id: 1,
            title: 'Soul Land',
            image: 'https://anichin.club/wp-content/uploads/2023/12/Supreme-Alchemy.webp',
            rating: 4.8,
            episodes: 250,
            genre: ['Action', 'Adventure', 'Fantasy'],
            description: 'Tang San spent his life in the Tang Outer Sect, dedicated to the creation and mastery of hidden weapons. Once he stole the secret lore of the Inner Sect to reach the pinnacle of his art, his only way out was death. But after throwing himself off the deadly Hell\'s Peak he was reborn in a different world, the world of Douluo Dalu, a world where every person has a spirit of their own, and those with spirit power can cultivate their spirits to become Spirit Masters.'
        },
        {
            id: 2,
            title: 'Battle Through the Heavens',
            image: 'images/hero-bg.jpg',
            rating: 4.7,
            episodes: 150,
            genre: ['Action', 'Adventure', 'Fantasy'],
            description: 'In a land where no magic is present. A land where the strong make the rules and the weak have to obey. A land filled with alluring treasures and beauty, yet also filled with unforeseen danger. Three years ago, Xiao Yan, who had shown talents none had seen in decades, suddenly lost everything. His powers, his reputation, and his promise to his mother. What sorcery has caused him to lose all of his powers? And why has his fiancee suddenly shown up?'
        },
        {
            id: 3,
            title: 'The Grandmaster of Demonic Cultivation',
            image: 'images/image.jpg',
            rating: 4.9,
            episodes: 35,
            genre: ['Action', 'Fantasy', 'Historical'],
            description: 'Wei Wuxian was once one of the most powerful men of his generation, a talented and clever young cultivator who harnessed demonic energy to create devastating new techniques. But when the other clans turned against him, he was killed by his closest ally. Thirteen years later, Wei Wuxian is reborn in the body of a lunatic and reunited with Lan Wangji, a former classmate of his. Together, they solve mysteries and uncover the true culprit behind Wei Wuxian\'s death.'
        },
        {
            id: 4,
            title: 'Heaven Official\'s Blessing',
            image: 'images/image2.jpg',
            rating: 4.8,
            episodes: 12,
            genre: ['Fantasy', 'Romance', 'Supernatural'],
            description: 'Xie Lian was the Crown Prince of Xianle, a prosperous kingdom. He was a beloved martial god, until a rebellion caused his downfall. After being banished from the heavens twice, he ascends for the third time, but now as the laughingstock of all three realms. On his first mission, he meets a mysterious demon who rules over ghosts and terrifies the heavens... yet unbeknownst to Xie Lian, this demon king has been paying attention to him for a very, very long time.'
        },
        {
            id: 5,
            title: 'Stellar Transformations',
            image: 'images/image3.jpg',
            rating: 4.5,
            episodes: 52,
            genre: ['Action', 'Adventure', 'Fantasy'],
            description: 'In a universe where the strong prey on the weak, Qin Yu is born with a birth defect that prevents him from practicing internal techniques. In order to gain his father\'s recognition, he resolutely chooses to follow the more difficult and painful path of practicing external techniques. As the years go by, he grows up, but what really changes his life is a mysterious meteoric crystal stone.'
        },
        {
            id: 6,
            title: 'Perfect World',
            image: 'images/image.jpg',
            rating: 4.6,
            episodes: 78,
            genre: ['Action', 'Adventure', 'Fantasy'],
            description: 'The story revolves around a young man named Shi Hao who lives in a world where cultivation is the norm. Born with a supreme bone in his body, he is betrayed by his own clan and has the bone extracted from him. Left to die, he miraculously survives and begins his journey to become the strongest cultivator, seeking to uncover the secrets of his world and his own destiny.'
        }
    ];
    
    // Sample watch history data
    const watchHistory = [
        {
            id: 1,
            title: 'Soul Land',
            image: 'https://via.placeholder.com/300x450/2f3542/ffffff?text=Soul+Land',
            episode: 'Episode 143',
            time: '2 days ago',
            progress: 70
        },
        {
            id: 3,
            title: 'The Grandmaster of Demonic Cultivation',
            image: 'https://via.placeholder.com/300x450/2f3542/ffffff?text=Mo+Dao+Zu+Shi',
            episode: 'Episode 21',
            time: '1 week ago',
            progress: 45
        }
    ];

    // Hero Slider Functionality
    const heroSlider = document.querySelector('.hero-slider');
    const slides = document.querySelectorAll('.hero-slide');
    const bullets = document.querySelectorAll('.hero-pagination-bullet');
    const prevBtn = document.querySelector('.hero-prev');
    const nextBtn = document.querySelector('.hero-next');
    
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
    
    // Populate trending section
    const trendingContainer = document.querySelector('#trending .card-container');
    donghuaData.slice(0, 6).forEach(item => {
        trendingContainer.appendChild(createCard(item));
    });
    
    // Populate watch history
    const historyContainer = document.querySelector('.history-container');
    if (watchHistory.length > 0) {
        document.querySelector('.empty-state').classList.add('hidden');
        watchHistory.forEach(item => {
            historyContainer.appendChild(createHistoryItem(item));
        });
    }
    
    // Clear history button
    const clearHistoryBtn = document.getElementById('clear-history');
    clearHistoryBtn.addEventListener('click', function() {
        historyContainer.innerHTML = `
            <div class="empty-state">
                <i class="fas fa-history"></i>
                <p>Riwayat nontonmu masih kosong</p>
                <a href="#trending" class="btn-primary">Mulai Menonton</a>
            </div>
        `;
    });
    
    // Filter top donghua by genre
    const filterButtons = document.querySelectorAll('.filter-btn');
    filterButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Remove active class from all buttons
            filterButtons.forEach(btn => btn.classList.remove('active'));
            // Add active class to clicked button
            this.classList.add('active');
            
            const filter = this.dataset.filter;
            const cards = document.querySelectorAll('.top-donghua .card');
            
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
    
    // Helper function to create card element
    function createCard(item) {
        const card = document.createElement('div');
        card.className = 'card';
        card.innerHTML = `
            <div class="card-img">
                <img src="${item.image}" alt="${item.title}">
                <div class="card-badge">NEW</div>
            </div>
            <div class="card-content">
                <h3 class="card-title">${item.title}</h3>
                <div class="card-meta">
                    <span>${item.episodes} eps</span>
                    <span class="card-rating"><i class="fas fa-star"></i> ${item.rating}</span>
                </div>
            </div>
        `;
        return card;
    }
    
    // Helper function to create history item
    function createHistoryItem(item) {
        const historyItem = document.createElement('div');
        historyItem.className = 'history-item';
        historyItem.innerHTML = `
            <div class="history-content">
                <h3 class="history-title">${item.title}</h3>
                <div class="history-meta">
                    <span>${item.episode}</span>
                    <span>${item.time}</span>
                </div>
                <div class="history-progress">
                    <div class="history-progress-bar" style="width: ${item.progress}%"></div>
                </div>
            </div>
        `;
        return historyItem;
    }
});