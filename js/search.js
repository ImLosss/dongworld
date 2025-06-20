document.addEventListener('DOMContentLoaded', function() {
    const searchForm = document.getElementById('search-form');
    const searchInput = document.getElementById('search-input');
    const searchResultsSection = document.getElementById('search-results');
    const closeSearchBtn = document.getElementById('close-search');
    
    // Sample data for search (in a real app, this would come from an API)
    const searchData = [
        {
            id: 1,
            title: 'Soul Land',
            image: 'https://via.placeholder.com/300x450/2f3542/ffffff?text=Soul+Land',
            type: 'Series',
            episodes: 250
        },
        {
            id: 2,
            title: 'Battle Through the Heavens',
            image: 'https://via.placeholder.com/300x450/2f3542/ffffff?text=Battle+Through+the+Heavens',
            type: 'Series',
            episodes: 150
        },
        {
            id: 3,
            title: 'The Grandmaster of Demonic Cultivation',
            image: 'https://via.placeholder.com/300x450/2f3542/ffffff?text=Mo+Dao+Zu+Shi',
            type: 'Series',
            episodes: 35
        },
        {
            id: 4,
            title: 'Heaven Official\'s Blessing',
            image: 'https://via.placeholder.com/300x450/2f3542/ffffff?text=Heaven+Official%27s+Blessing',
            type: 'Series',
            episodes: 12
        },
        {
            id: 101,
            title: 'White Snake',
            image: 'https://via.placeholder.com/300x450/2f3542/ffffff?text=White+Snake',
            type: 'Movie',
            duration: '1h 39m'
        },
        {
            id: 102,
            title: 'Ne Zha',
            image: 'https://via.placeholder.com/300x450/2f3542/ffffff?text=Ne+Zha',
            type: 'Movie',
            duration: '1h 50m'
        }
    ];
    
    searchForm.addEventListener('submit', function(e) {
        e.preventDefault();
        const query = searchInput.value.trim().toLowerCase();
        
        if (query.length === 0) return;
        
        // Hide all sections
        document.querySelectorAll('.section:not(#search-results)').forEach(section => {
            section.classList.add('hidden');
        });
        
        // Show search results section
        searchResultsSection.classList.remove('hidden');
        
        // Filter search results
        const results = searchData.filter(item => 
            item.title.toLowerCase().includes(query)
        );
        
        // Display results
        const resultsContainer = document.querySelector('.search-results-container');
        resultsContainer.innerHTML = '';
        
        if (results.length === 0) {
            resultsContainer.innerHTML = `
                <div class="empty-state">
                    <i class="fas fa-search"></i>
                    <p>Tidak ada hasil untuk "${query}"</p>
                    <p>Coba kata kunci yang berbeda</p>
                </div>
            `;
        } else {
            results.forEach(item => {
                resultsContainer.appendChild(createSearchResultItem(item));
            });
        }
        
        // Scroll to search results
        searchResultsSection.scrollIntoView({ behavior: 'smooth' });
    });
    
    // Close search results
    closeSearchBtn.addEventListener('click', function() {
        searchResultsSection.classList.add('hidden');
        document.querySelectorAll('.section:not(#search-results)').forEach(section => {
            section.classList.remove('hidden');
        });
        searchInput.value = '';
    });
    
    // Helper function to create search result item
    function createSearchResultItem(item) {
        const resultItem = document.createElement('a');
        resultItem.className = 'search-result-item';
        resultItem.href = `#${item.id}`;
        
        const meta = item.type === 'Series' 
            ? `${item.episodes} episodes` 
            : item.duration;
        
        resultItem.innerHTML = `
            <div class="search-result-img">
                <img src="${item.image}" alt="${item.title}">
            </div>
            <div>
                <h3 class="search-result-title">${item.title}</h3>
                <p class="search-result-meta">${item.type} • ${meta}</p>
            </div>
        `;
        
        return resultItem;
    }
});