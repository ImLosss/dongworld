const recContainer = document.querySelector('#recommendation .dl-recommendation-container');
if (recContainer) {
    donghuaData.slice(0, 10).forEach(item => {
        recContainer.appendChild(createCard(item));
    });
}