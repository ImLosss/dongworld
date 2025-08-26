document.addEventListener('DOMContentLoaded', function() {
    const searchForm = document.getElementById('dl-search-form');
    const searchInput = document.getElementById('dl-search-input');
    const searchResultsSection = document.getElementById('dl-search-results');
    const closeSearchBtn = document.getElementById('dl-close-search');
    
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
            image: 'images/image.jpg',
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
        document.querySelectorAll('.dl-section:not(#dl-search-results)').forEach(section => {
            section.classList.add('dl-hidden');
        });
        
        // Show search results section
        searchResultsSection.classList.remove('dl-hidden');
        
        // Filter search results
        const results = searchData.filter(item => 
            item.title.toLowerCase().includes(query)
        );
        
        // Display results
        const resultsContainer = document.querySelector('.dl-search-results-container');
        resultsContainer.innerHTML = '';
        
        if (results.length === 0) {
            resultsContainer.innerHTML = `
                <div class="dl-empty-state">
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
        searchResultsSection.classList.add('dl-hidden');
        document.querySelectorAll('.dl-section:not(#dl-search-results)').forEach(section => {
            section.classList.remove('dl-hidden');
        });
        searchInput.value = '';
    });
    
    // Helper function to create search result item
    function createSearchResultItem(item) {
        const resultItem = document.createElement('a');
        resultItem.className = 'dl-search-result-item';
        resultItem.href = `#${item.id}`;
        
        const meta = item.type === 'Series' 
            ? `${item.episodes} episodes` 
            : item.duration;
        
        resultItem.innerHTML = `
            <div class="dl-search-result-img">
                <img src="${item.image}" alt="${item.title}">
            </div>
            <div>
                <h3 class="dl-search-result-title">${item.title}</h3>
                <p class="dl-search-result-meta">${item.type} • ${meta}</p>
            </div>
        `;
        
        return resultItem;
    }
});