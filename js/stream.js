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

const recContainer = document.querySelector('#recommendation .dl-recommendation-container');
if (recContainer) {
    donghuaData.slice(0, 10).forEach(item => {
        recContainer.appendChild(createCard(item));
    });
}

function createCard(item) {
    const card = document.createElement('div');
    card.className = 'dl-card';
    card.innerHTML = `
        <div class="dl-card-img">
            <img src="${item.image}" alt="${item.title}">
            <div class="dl-card-badge">NEW</div>
        </div>
        <div class="dl-card-content">
            <h3 class="dl-card-title">${item.title}</h3>
            <div class="dl-card-meta">
                <span>${item.episodes} eps</span>
                <span class="dl-card-rating"><i class="fas fa-star"></i> ${item.rating}</span>
            </div>
        </div>
    `;
    return card;
}