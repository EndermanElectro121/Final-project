// Digital clock
const clock = document.getElementById("clock");

function updateClock() {
    const now = new Date();

    clock.textContent = now.toLocaleTimeString();
}

updateClock();
setInterval(updateClock, 1000);


// Click counter
const counter = document.getElementById("counter");
const counterButton = document.getElementById("counterButton");

let clicks = 0;

counterButton.addEventListener("click", () => {
    clicks++;
    counter.textContent = clicks;
});


// Theme switcher
const themeButton = document.getElementById("themeButton");

themeButton.addEventListener("click", () => {
    document.body.classList.toggle("dark");

    if (document.body.classList.contains("dark")) {
        themeButton.textContent = "☀️ Light mode";
    } else {
        themeButton.textContent = "🌙 Dark mode";
    }
});


// Health check
const healthButton = document.getElementById("healthButton");
const healthMessage = document.getElementById("healthMessage");

healthButton.addEventListener("click", () => {
    const currentTime = new Date().toLocaleTimeString();

    healthMessage.textContent =
        `Frontend is responding successfully at ${currentTime}`;

    healthMessage.style.color = "#16a34a";
});

console.log("Mini DevOps Dashboard initialized successfully!");