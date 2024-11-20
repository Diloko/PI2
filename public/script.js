document.getElementById('login-form').addEventListener('submit', function(event) {
    event.preventDefault(); // Impede o comportamento padrão de redirecionamento

    const formData = new FormData(event.target);

    fetch('/login', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        document.getElementById('tabela-container').innerHTML = data; // Insere a resposta completa sem duplicar a estrutura
    })
    .catch(error => console.error('Erro:', error));
});
