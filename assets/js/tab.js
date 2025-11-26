// tab.js - Sistema de abas com controle de inicialização única

document.addEventListener('DOMContentLoaded', function() {
    const abas = document.querySelectorAll('.aba-link');
    const conteudoAba = document.getElementById('conteudo-aba');
    
    // Estado global para controle de inicialização
    window.abaAtual = null;
    window.componentesInicializados = {
        addLivro: false,
        meuslivros: false,
        info: false
    };
    
    // Timeout para evitar inicializações múltiplas
    let timeoutInicializacao = null;
    
    abas.forEach(aba => {
        aba.addEventListener('click', function() {
            const abaAlvo = this.getAttribute('data-aba');
            window.abaAtual = abaAlvo;
            
            console.log(`🔄 Mudando para aba: ${abaAlvo}`);
            
            // Resetar estado de inicialização para a aba atual
            window.componentesInicializados[abaAlvo] = false;
            
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
            
            // Limpar timeout anterior se existir
            if (timeoutInicializacao) {
                clearTimeout(timeoutInicializacao);
            }
            
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
                    console.log(`✅ Conteúdo da aba ${abaAlvo} carregado`);
                    
                    // Disparar evento personalizado quando o conteúdo da aba for carregado
                    const event = new CustomEvent('abaCarregada', {
                        detail: {
                            aba: abaAlvo,
                            conteudo: conteudo,
                            timestamp: new Date().getTime()
                        }
                    });
                    document.dispatchEvent(event);
                    
                    // Inicialização específica para cada aba (com delay único)
                    timeoutInicializacao = setTimeout(() => {
                        inicializarComponentesAba(abaAlvo);
                    }, 300);
                })
                .catch(err => {
                    console.error('❌ Erro no fetch:', err);
                    conteudoAba.innerHTML = `
                        <div class="erro" style="color: red; text-align: center; padding: 20px;">
                            Erro ao carregar a aba: ${err.message}
                            <br><button onclick="location.reload()">Recarregar</button>
                        </div>
                    `;
                });
        });
    });
    
    // Função para inicializar componentes específicos de cada aba
    function inicializarComponentesAba(abaAlvo) {
        // Verificar se já foi inicializado
        if (window.componentesInicializados[abaAlvo]) {
            console.log(`ℹ️ Componentes da aba ${abaAlvo} já inicializados. Ignorando...`);
            return;
        }
        
        console.log(`🎯 Inicializando componentes para aba: ${abaAlvo}`);
        
        switch(abaAlvo) {
            case 'addLivro':
                inicializarComponentesAddLivro();
                break;
            case 'meuslivros':
                inicializarComponentesMeusLivros();
                break;
            case 'info':
                inicializarComponentesInfo();
                break;
            default:
                console.log(`ℹ️ Nenhum componente específico para aba: ${abaAlvo}`);
        }
        
        // Marcar como inicializado
        window.componentesInicializados[abaAlvo] = true;
    }
    
    // Componentes específicos para a aba "Adicionar Livro"
    function inicializarComponentesAddLivro() {
        console.log('📖 Inicializando componentes da aba AddLivro...');
        
        // Verificar se já foi inicializado
        if (window.fotosInicializadas) {
            console.log('ℹ️ Gerenciador de fotos já inicializado. Ignorando...');
            return;
        }
        
        // Inicializar gerenciador de fotos (APENAS UMA VEZ)
        if (typeof window.inicializarGerenciadorFotos === 'function') {
            console.log('🔄 Chamando inicializarGerenciadorFotos...');
            
            // Apenas uma tentativa com delay adequado
            setTimeout(() => {
                const success = window.inicializarGerenciadorFotos();
                if (success) {
                    console.log('✅ Gerenciador de fotos inicializado com sucesso!');
                    window.fotosInicializadas = true;
                } else {
                    console.warn('⚠️ Falha na inicialização do gerenciador de fotos');
                }
            }, 500);
        } else {
            console.error('❌ Função inicializarGerenciadorFotos não encontrada!');
        }
        
        // Inicializar busca por ISBN (se existir)
        if (typeof window.inicializarBuscaISBN === 'function') {
            setTimeout(() => {
                window.inicializarBuscaISBN();
            }, 200);
        }
    }
    
    // Componentes específicos para a aba "Meus Livros"
    function inicializarComponentesMeusLivros() {
        console.log('📚 Inicializando componentes da aba MeusLivros...');
        // Adicione aqui a inicialização de componentes específicos para meuslivros
    }
    
    // Componentes específicos para a aba "Info"
    function inicializarComponentesInfo() {
        console.log('ℹ️ Inicializando componentes da aba Info...');
        // Adicione aqui a inicialização de componentes específicos para info
    }
    
    // Adiciona CSS da animação dinamicamente
    const style = document.createElement('style');
    style.textContent = `
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        /* Estilos para as fotos preview */
        .fotos-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin: 10px 0;
            min-height: 120px;
            padding: 10px;
            border: 2px dashed #ddd;
            border-radius: 8px;
            background-color: #f8f9fa;
        }
        
        .foto-item {
            transition: transform 0.2s ease;
            position: relative;
        }
        
        .foto-item:hover {
            transform: scale(1.05);
        }
        
        .foto-item img {
            border-radius: 4px;
            width: 80px;
            height: 100px;
            object-fit: cover;
            display: block;
        }
        
        .fotos-container:empty::before {
            content: "Nenhuma foto selecionada";
            color: #6c757d;
            font-style: italic;
        }
    `;
    document.head.appendChild(style);
    
    // Inicialização automática se já estiver em uma aba específica
    const abaAtivaInicial = document.querySelector('.aba-link.ativo');
    if (abaAtivaInicial) {
        const abaAlvoInicial = abaAtivaInicial.getAttribute('data-aba');
        console.log(`🎯 Aba inicial ativa: ${abaAlvoInicial}`);
        window.abaAtual = abaAlvoInicial;
        
        // Pequeno delay para garantir que o conteúdo está carregado
        setTimeout(() => {
            inicializarComponentesAba(abaAlvoInicial);
        }, 1000);
    }
    
    console.log('✅ Sistema de abas inicializado com sucesso!');
});

// Função global para forçar reinicialização se necessário
window.reinicializarAbaAtual = function() {
    if (window.abaAtual) {
        console.log(`🔄 Reinicializando componentes da aba: ${window.abaAtual}`);
        window.componentesInicializados[window.abaAtual] = false;
        
        // Disparar evento customizado
        const event = new CustomEvent('reinicializarAba', {
            detail: { aba: window.abaAtual }
        });
        document.dispatchEvent(event);
        
        // Re-inicializar componentes
        if (window.abaAtual === 'addLivro') {
            window.fotosInicializadas = false;
            if (typeof window.inicializarGerenciadorFotos === 'function') {
                setTimeout(() => {
                    window.inicializarGerenciadorFotos();
                    window.fotosInicializadas = true;
                }, 300);
            }
        }
    }
};

