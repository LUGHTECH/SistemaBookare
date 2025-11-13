// fotoCadastro.js - Versão corrigida com todas as funções definidas

let eventListenerAdicionado = false;

// Função para lidar com as fotos selecionadas - DEFINIDA NO ESCOPO GLOBAL
function handleFotosChange(files) {
    console.log('🖼️ Processando fotos...');
    const fotosContainer = document.getElementById('fotosContainer');
    
    if (!fotosContainer) {
        console.error('❌ Container de fotos não encontrado!');
        return;
    }
    
    fotosContainer.innerHTML = '';
    
    if (files && files.length > 0) {
        const filesArray = Array.from(files).slice(0, 5);
        
        filesArray.forEach((file, index) => {
            if (!file.type.startsWith('image/')) {
                console.log('📁 Arquivo não é imagem:', file.name);
                return;
            }
            
            const reader = new FileReader();
            
            reader.onload = function(e) {
                const fotoWrapper = document.createElement('div');
                fotoWrapper.className = 'foto-item';
                fotoWrapper.style.cssText = `
                    position: relative;
                    display: inline-block;
                    margin: 5px;
                    border: 1px solid #ddd;
                    border-radius: 5px;
                    padding: 3px;
                    background: white;
                    vertical-align: top;
                `;
                
                const img = document.createElement('img');
                img.src = e.target.result;
                img.style.cssText = `
                    width: 80px;
                    height: 100px;
                    object-fit: cover;
                    display: block;
                `;
                img.alt = 'Preview da foto do livro';
                
                const removeBtn = document.createElement('button');
                removeBtn.textContent = '×';
                removeBtn.type = 'button';
                removeBtn.title = 'Remover foto';
                removeBtn.style.cssText = `
                    position: absolute;
                    top: -8px;
                    right: -8px;
                    background: red;
                    color: white;
                    border: none;
                    border-radius: 50%;
                    width: 20px;
                    height: 20px;
                    cursor: pointer;
                    font-size: 12px;
                    line-height: 1;
                    z-index: 10;
                `;
                
                removeBtn.addEventListener('click', function() {
                    console.log('🗑️ Removendo foto', index);
                    fotoWrapper.remove();
                    
                    // Atualizar o input files
                    const inputFotos = document.getElementById('inputFotos');
                    const dt = new DataTransfer();
                    const currentFiles = Array.from(inputFotos.files);
                    currentFiles.splice(index, 1);
                    currentFiles.forEach(f => dt.items.add(f));
                    inputFotos.files = dt.files;
                    
                    // Se não há mais fotos, mostrar mensagem
                    if (dt.files.length === 0) {
                        fotosContainer.innerHTML = '<span style="color: #6c757d;">Nenhuma foto selecionada</span>';
                    }
                });
                
                fotoWrapper.appendChild(img);
                fotoWrapper.appendChild(removeBtn);
                fotosContainer.appendChild(fotoWrapper);
            };
            
            reader.onerror = function() {
                console.error('❌ Erro ao ler arquivo:', file.name);
            };
            
            reader.readAsDataURL(file);
        });
        
        if (files.length > 5) {
            const alertMsg = document.createElement('div');
            alertMsg.textContent = 'Apenas as primeiras 5 fotos serão consideradas';
            alertMsg.style.cssText = `
                color: #856404;
                background-color: #fff3cd;
                border: 1px solid #ffeaa7;
                padding: 8px;
                border-radius: 4px;
                margin-top: 10px;
                font-size: 14px;
                width: 100%;
            `;
            fotosContainer.appendChild(alertMsg);
        }
    } else {
        fotosContainer.innerHTML = '<span style="color: #6c757d;">Nenhuma foto selecionada</span>';
    }
}

function inicializarGerenciadorFotos() {
    console.log('🔄 Inicializando gerenciador de fotos para a aba addLivro...');
    
    const inputFotos = document.getElementById('inputFotos');
    const fotosContainer = document.getElementById('fotosContainer');
    
    console.log('📋 Elementos encontrados:', {
        inputFotos: !!inputFotos,
        fotosContainer: !!fotosContainer
    });
    
    if (!inputFotos || !fotosContainer) {
        console.warn('⚠️ Elementos não encontrados na tentativa de inicialização');
        return false;
    }
    
    // VERIFICAÇÃO CRÍTICA: Evitar múltiplos event listeners
    if (eventListenerAdicionado) {
        console.log('ℹ️ Event listener já adicionado. Ignorando...');
        return true;
    }
    
    console.log('✅ Elementos encontrados! Configurando event listeners...');
    
    // Configurar event listener para as fotos (APENAS UMA VEZ)
    inputFotos.addEventListener('change', function(e) {
        console.log('📸 Fotos selecionadas:', this.files.length);
        handleFotosChange(this.files); // Agora a função está definida globalmente
    });
    
    eventListenerAdicionado = true;
    
    // Inicializar container vazio
    if (fotosContainer.children.length === 0) {
        fotosContainer.innerHTML = '<span style="color: #6c757d;">Nenhuma foto selecionada</span>';
    }
    
    console.log('🎉 Gerenciador de fotos inicializado com sucesso!');
    return true;
}

// Escutar evento de aba carregada
document.addEventListener('abaCarregada', function(e) {
    console.log('🎯 Evento abaCarregada disparado:', e.detail.aba);
    
    if (e.detail.aba === 'addLivro') {
        console.log('📖 Aba addLivro carregada - inicializando fotos...');
        
        // Pequeno delay para garantir que o DOM foi atualizado
        setTimeout(() => {
            const success = inicializarGerenciadorFotos();
            if (!success) {
                console.log('🔄 Tentando novamente em 500ms...');
                setTimeout(() => inicializarGerenciadorFotos(), 500);
            }
        }, 200);
    }
});

// Iniciar quando o DOM estiver pronto
document.addEventListener('DOMContentLoaded', function() {
    console.log('🚀 DOM carregado - configurando sistema de fotos...');
    
    // Verificar se já estamos na aba addLivro (no carregamento inicial)
    const abaAtiva = document.querySelector('.aba-link.ativo');
    if (abaAtiva && abaAtiva.getAttribute('data-aba') === 'addLivro') {
        console.log('📖 Aba addLivro já está ativa na inicialização');
        setTimeout(() => inicializarGerenciadorFotos(), 1000);
    }
});

// Função de teste global
window.testarFotos = function() {
    console.log('🧪 Testando função testarFotos...');
    const container = document.getElementById('fotosContainer');
    if (container) {
        container.innerHTML = '<div style="color: green; padding: 10px; border: 2px solid green;">✅ JavaScript funcionando perfeitamente!</div>';
        console.log('✅ Teste bem-sucedido!');
    } else {
        console.error('❌ Container de fotos não encontrado para teste');
        alert('Container de fotos não encontrado! Verifique o console.');
    }
};

// Exportar funções para uso global
window.inicializarGerenciadorFotos = inicializarGerenciadorFotos;
window.handleFotosChange = handleFotosChange;

console.log('📄 fotoCadastro.js carregado - funções disponíveis:', {
    inicializarGerenciadorFotos: typeof inicializarGerenciadorFotos,
    handleFotosChange: typeof handleFotosChange,
    testarFotos: typeof testarFotos
});