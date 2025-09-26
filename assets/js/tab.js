document.addEventListener('DOMContentLoaded', function() {
    const abas = document.querySelectorAll('.aba-link');
    const conteudoAba = document.getElementById('conteudo-aba');
    
    abas.forEach(aba => {
        aba.addEventListener('click', function() {
            const abaAlvo = this.getAttribute('data-aba');
            
            // Atualiza aba ativa
            abas.forEach(b => b.classList.remove('ativo'));
            this.classList.add('ativo');
            
            // Mostra loading
            conteudoAba.innerHTML = `
                <div class="loading" style="text-align: center; padding: 40px;">
                    <div class="spinner" style="width: 40px; height: 40px; border: 4px solid #f3f3f3; border-top: 4px solid #007bff; border-radius: 50%; animation: spin 1s linear infinite; margin: 0 auto 20px;"></div>
                    <p>Carregando ${this.textContent}...</p>
                </div>
            `;
            
            // CORREÇÃO: Caminho correto para os includes
            fetch(`../includes/dashboard/tabViews/${abaAlvo}.php`)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Arquivo não encontrado: ' + response.status);
                    }
                    return response.text();
                })
                .then(conteudo => {
                    conteudoAba.innerHTML = conteudo;
                })
                .catch(err => {
                    console.error('Erro no fetch:', err);
                    conteudoAba.innerHTML = `
                        <div class="erro" style="color: red; text-align: center; padding: 20px;">
                            Erro ao carregar a aba: ${err.message}
                            <br><button onclick="location.reload()">Recarregar</button>
                        </div>
                    `;
                });
        });
    });
    
    // Adiciona CSS da animação dinamicamente
    const style = document.createElement('style');
    style.textContent = `
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    `;
    document.head.appendChild(style);
});