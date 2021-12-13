const rawDataUrl = 'https://raw.githubusercontent.com/mdn/learning-area/main/javascript/apis/fetching-data/can-store/products.json';

fetch(rawDataUrl).then(function(response) {
    return response.json();
}).then(function(json) {
    let products = json;
    initialize(products);
}).catch(function(err) {
    console.log('Fetch problem: ' + err.message);
});

function initialize(products) {
    const category = document.querySelector('#category');
    const searchTerm = document.querySelector('#searchTerm');
    const searchBtn = document.querySelector('button');
    const main = document.querySelector('main');

    let lastCategory = category.value;
    let lastSearch = '';

    let categoryGroup = [];
    let finalGroup = [];

    finalGroup = products;
    updateDisplay();

    searchBtn.onclick = selectCategory;

    function updateDisplay() {
        while (main.firstChild) {
            main.removeChild(main.firstChild);
        }
    
        if (finalGroup.length === 0) {
            const para = document.createElement('p');
            para.textContent = 'No result to display!';
            main.appendChild(para);
        } else {
            for (let i = 0; i < finalGroup.length; i++) {
                fetchBlod(finalGroup[i]);
            }
        }
    }

    function fetchBlod(product) {
        let imgUrl = 'https://raw.githubusercontent.com/mdn/learning-area/main/javascript/apis/fetching-data/can-store/images/' + product.image;
        fetch(imgUrl).then(function(response) {
            return response.blob();
        }).then(function(blod) {
            let objectUrl = URL.createObjectURL(blod);
            showProduct(objectUrl, product);
        });
    }

    function showProduct(objectUrl, product) {
        const section = document.createElement('section');
        const heading = document.createElement('h2');
        const para = document.createElement('p');
        const image = document.createElement('img');

        section.setAttribute('class', product.type);
        heading.textContent = product.name.replace(product.name.charAt(0), product.name.charAt(0).toUpperCase());
        para.textContent = '$' + product.price.toFixed(2);
        image.src = objectUrl;
        image.alt = product.name;

        main.appendChild(section);
        section.appendChild(heading);
        section.appendChild(para);
        section.appendChild(image);
    }

    function selectCategory(e) {
        e.preventDefault();

        categoryGroup = [];
        finalGroup = [];

        if (category.value === lastCategory && searchTerm.value.trim() === lastSearch) {
            return;
        } else {
            lastCategory = category.value;
            lastSearch = searchTerm.value.trim();

            if (category.value === 'All') {
                categoryGroup = products;
                selectProducts();
            } else {
                let lowerCaseType = category.value.toLowerCase();
                for (let i = 0; i < products.length; i++) {
                    if (products[i].type === lowerCaseType) {
                        categoryGroup.push(products[i]);
                    }
                }

                selectProducts();
            }
        }
    }

    function selectProducts() {
        if (searchTerm.value.trim() === '') {
            finalGroup = categoryGroup;
            updateDisplay();
        } else {
            let lowerCaseSearchTerm = searchTerm.value.trim().toLowerCase();
            for (let i = 0; i < categoryGroup.length; i++) {
                if (categoryGroup[i].name.indexOf(lowerCaseSearchTerm) !== -1) {
                    finalGroup.push(categoryGroup[i]);
                }
            }

            updateDisplay();
        }
    }
}