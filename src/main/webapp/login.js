document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    const message = document.getElementById('message');

    if (username === 'mityrc' && password === 'mityrc@1234') {
        message.style.color = 'green';
        message.textContent = 'Login successful!';
        // Redirect to index.html after a short delay
        setTimeout(() => {
            window.location.href = 'admin_index.html'; 
        }, 1000);  // Redirects after 1 second (1000 milliseconds)
    } else {
        message.style.color = 'red';
        message.textContent = 'Invalid username or password!';
    }
});
