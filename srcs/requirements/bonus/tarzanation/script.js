// script.js

// Add smooth scrolling to navigation links
document.querySelectorAll('nav ul li a').forEach(link => {
    link.addEventListener('click', (e) => {
        e.preventDefault();
        const href = link.getAttribute('href');
        document.querySelector(href).scrollIntoView({ behavior: 'smooth' });
    });
});

// Add hover effect to language cards
const languageCards = document.querySelectorAll('.language-card');

languageCards.forEach(card => {
    card.addEventListener('mouseenter', () => {
        card.style.transform = 'translateY(-5px)';
    });

    card.addEventListener('mouseleave', () => {
        card.style.transform = 'none';
    });
});
