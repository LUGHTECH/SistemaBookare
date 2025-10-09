// Configurações da API Google Books - SUBSTITUA PELA SUA CHAVE
const GOOGLE_BOOKS_API_KEY = "AIzaSyD6VorJvqdvj6QJOMjqkQfisWV5vxeO1tY";

// Variáveis globais
let capaFile = null;
let fotosFiles = [];
let capaUrlDaAPI = null;

// Função para mostrar alerta
function mostrarAlerta(mensagem, tipo) {
    const alertSuccess = document.getElementById('alertSuccess');
    const alertError = document.getElementById('alertError');
    
    // Esconder ambos primeiro
    alertSuccess.style.display = 'none';
    alertError.style.display = 'none';
    
    if (tipo === 'success') {
        alertSuccess.innerHTML = mensagem;
        alertSuccess.style.display = 'block';
        
        // Auto-esconder após 5 segundos
        setTimeout(() => {
            alertSuccess.style.display = 'none';
        }, 5000);
    } else {
        alertError.innerHTML = mensagem;
        alertError.style.display = 'block';
    }
}

// Inicialização quando o DOM estiver pronto
document.addEventListener('DOMContentLoaded', function() {
    console.log('Formulário de cadastro de livros inicializado');
    
    // Event listeners para upload de imagens
    const inputCapa = document.getElementById('inputCapa');
    const inputFotos = document.getElementById('inputFotos');
    
    if (inputCapa) {
        inputCapa.addEventListener('change', handleCapaUpload);
    }
    
    if (inputFotos) {
        inputFotos.addEventListener('change', handleFotosUpload);
    }
    
    // Enter no campo ISBN
    const inputISBN = document.getElementById('inputISBN');
    if (inputISBN) {
        inputISBN.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                buscarPorISBN();
            }
        });
    }
    
    // Prevenir envio tradicional do formulário e usar AJAX
    const formLivro = document.getElementById('formLivro');
    if (formLivro) {
        formLivro.addEventListener('submit', function(e) {
            e.preventDefault();
            handleFormSubmit();
        });
    }
});

// Função para buscar livro por ISBN
async function buscarPorISBN() {
    const isbn = document.getElementById('inputISBN').value.trim();
    const btnBuscar = document.getElementById('btnBuscarISBN');
    
    if (!isbn) {
        mostrarAlerta('Por favor, digite um ISBN', 'error');
        return;
    }
    
    // Validar formato do ISBN (10 ou 13 dígitos)
    const isbnLimpo = isbn.replace(/[-\s]/g, '');
    if (!/^(?:\d{10}|\d{13})$/.test(isbnLimpo)) {
        mostrarAlerta('Por favor, digite um ISBN válido (10 ou 13 dígitos)', 'error');
        return;
    }
    
    try {
        // Mostrar loading
        btnBuscar.textContent = '⏳ Buscando...';
        btnBuscar.classList.add('loading');
        
        const url = `https://www.googleapis.com/books/v1/volumes?q=isbn:${isbnLimpo}&key=${GOOGLE_BOOKS_API_KEY}`;
        
        const response = await fetch(url);
        
        if (!response.ok) {
            throw new Error(`Erro HTTP: ${response.status}`);
        }
        
        const data = await response.json();
        
        if (data.totalItems === 0) {
            mostrarAlerta('Nenhum livro encontrado com este ISBN. Preencha os dados manualmente.', 'error');
            return;
        }
        
        const livro = data.items[0].volumeInfo;
        preencherFormularioComDadosDaAPI(livro);
        
    } catch (error) {
        console.error('Erro na busca:', error);
        
        if (error.message.includes('quota')) {
            mostrarAlerta('Limite de consultas excedido. Tente novamente mais tarde.', 'error');
        } else if (error.message.includes('API key')) {
            mostrarAlerta('Erro de autenticação com a API. Verifique a chave da API.', 'error');
        } else {
            mostrarAlerta('Erro ao buscar livro. Verifique sua conexão e tente novamente.', 'error');
        }
    } finally {
        // Restaurar botão
        btnBuscar.textContent = '🔍 Buscar na API';
        btnBuscar.classList.remove('loading');
    }
}

// Função para preencher o formulário com dados da API
function preencherFormularioComDadosDaAPI(livro) {
    // Preencher campos básicos
    document.getElementById('nomeLivro').value = livro.title || '';
    document.getElementById('anoPublicacao').value = livro.publishedDate ? 
        new Date(livro.publishedDate).getFullYear() : '';
    document.getElementById('autor').value = livro.authors ? 
        livro.authors.join(', ') : '';
    document.getElementById('genero').value = livro.categories ? 
        livro.categories[0] : '';
    document.getElementById('editora').value = livro.publisher || '';
    document.getElementById('sinopse').value = livro.description || '';

    const campos = ['nomeLivro', 'anoPublicacao', 'autor', 'genero', 'editora', 'sinopse', 'idioma'];
    campos.forEach(id =>{
        const campo = document.getElementById(id);
        if (campo && campo.value.trim() !== ''){
            campo.readOnly = true;
            campo.style.backgroundColor = '#f3f3f3'; // deixa visualmente "travado"
        }
    })
    
    // Idioma - mapear para os códigos do seu banco
    if (livro.language) {
        const idiomaMap = {
            'pt': 'pt', 'portuguese': 'pt', 'português': 'pt', 'portugues': 'pt',
            'en': 'en', 'english': 'en', 'inglês': 'en', 'ingles': 'en',
            'es': 'es', 'spanish': 'es', 'espanhol': 'es',
            'fr': 'fr', 'french': 'fr', 'francês': 'fr', 'frances': 'fr',
            'de': 'de', 'german': 'de', 'alemão': 'de', 'alemão': 'de'
        };
        const idiomaEncontrado = idiomaMap[livro.language.toLowerCase()];
        if (idiomaEncontrado) {
            document.getElementById('idioma').value = idiomaEncontrado;
        }
    }
    
    // Carregar capa da API
    if (livro.imageLinks) {
        // Tentar obter a imagem de melhor qualidade disponível
        const capaUrl = livro.imageLinks.thumbnail || 
                       livro.imageLinks.smallThumbnail || 
                       livro.imageLinks.medium || 
                       livro.imageLinks.large;
        
        if (capaUrl) {
            carregarCapaDaAPI(capaUrl);
        }
    }
    
    mostrarAlerta('Dados do livro carregados com sucesso!', 'success');
}

// Função para carregar capa da API
function carregarCapaDaAPI(url) {
    capaUrlDaAPI = url;
    
    // Melhorar a qualidade da imagem quando possível
    let melhorQualidadeUrl = url
        .replace('http:', 'https:')
        .replace('&edge=curl', '')
        .replace('zoom=1', 'zoom=0')
        .replace('_SX50_', '_SX300_')
        .replace('_SY75_', '_SX300_')
        .replace('_SL75_', '_SL300_');
    
    const capaPreview = document.getElementById('capaPreview');
    capaPreview.innerHTML = `<img src="${melhorQualidadeUrl}" alt="Capa do livro" onerror="this.style.display='none'">`;
    
    // Adicionar a URL da capa como campo hidden no formulário
    let hiddenInput = document.querySelector('input[name="capaUrl"]');
    if (!hiddenInput) {
        hiddenInput = document.createElement('input');
        hiddenInput.type = 'hidden';
        hiddenInput.name = 'capaUrl';
        document.getElementById('formLivro').appendChild(hiddenInput);
    }
    hiddenInput.value = melhorQualidadeUrl;
}

// Manipular upload da capa
function handleCapaUpload(event) {
    const file = event.target.files[0];
    if (!file) return;
    
    if (!file.type.startsWith('image/')) {
        mostrarAlerta('Por favor, selecione um arquivo de imagem válido.', 'error');
        return;
    }
    
    // Verificar tamanho do arquivo (máximo 5MB)
    if (file.size > 5 * 1024 * 1024) {
        mostrarAlerta('A imagem deve ter no máximo 5MB.', 'error');
        return;
    }
    
    capaFile = file;
    capaUrlDaAPI = null; // Reset da URL da API
    
    // Remover campo hidden da capa da API se existir
    const hiddenInput = document.querySelector('input[name="capaUrl"]');
    if (hiddenInput) {
        hiddenInput.remove();
    }
    
    const reader = new FileReader();
    reader.onload = function(e) {
        const capaPreview = document.getElementById('capaPreview');
        capaPreview.innerHTML = `<img src="${e.target.result}" alt="Capa do livro">`;
    };
    reader.readAsDataURL(file);
}

// Manipular upload de fotos
function handleFotosUpload(event) {
    const files = Array.from(event.target.files);
    
    // Verificar limite de fotos
    if (fotosFiles.length + files.length > 6) {
        mostrarAlerta('Máximo de 6 fotos permitidas.', 'error');
        return;
    }
    
    files.forEach(file => {
        if (!file.type.startsWith('image/')) {
            mostrarAlerta(`Arquivo ${file.name} não é uma imagem válida.`, 'error');
            return;
        }
        
        // Verificar tamanho do arquivo (máximo 5MB)
        if (file.size > 5 * 1024 * 1024) {
            mostrarAlerta(`A imagem ${file.name} deve ter no máximo 5MB.`, 'error');
            return;
        }
        
        fotosFiles.push(file);
        
        const reader = new FileReader();
        reader.onload = function(e) {
            const fotosContainer = document.getElementById('fotosContainer');
            const fotoDiv = document.createElement('div');
            fotoDiv.className = 'foto-preview';
            fotoDiv.innerHTML = `
                <img src="${e.target.result}" alt="Foto do livro">
                <button type="button" class="remover-foto" onclick="removerFoto(${fotosFiles.length - 1})">×</button>
            `;
            fotosContainer.appendChild(fotoDiv);
        };
        reader.readAsDataURL(file);
    });
    
    // Limpar input
    event.target.value = '';
}

// Remover foto
function removerFoto(index) {
    fotosFiles.splice(index, 1);
    atualizarPreviewFotos();
}

// Atualizar preview das fotos
function atualizarPreviewFotos() {
    const fotosContainer = document.getElementById('fotosContainer');
    fotosContainer.innerHTML = '';
    
    fotosFiles.forEach((file, index) => {
        const reader = new FileReader();
        reader.onload = function(e) {
            const fotoDiv = document.createElement('div');
            fotoDiv.className = 'foto-preview';
            fotoDiv.innerHTML = `
                <img src="${e.target.result}" alt="Foto do livro">
                <button type="button" class="remover-foto" onclick="removerFoto(${index})">×</button>
            `;
            fotosContainer.appendChild(fotoDiv);
        };
        reader.readAsDataURL(file);
    });
}

// Manipular envio do formulário via AJAX
async function handleFormSubmit() {
    // Validar campos obrigatórios
    const camposObrigatorios = ['nomeLivro', 'autor', 'genero', 'idioma', 'estadoConservacao'];
    for (let campo of camposObrigatorios) {
        const element = document.getElementById(campo);
        if (!element.value) {
            mostrarAlerta(`Por favor, preencha o campo: ${element.labels[0].textContent}`, 'error');
            return;
        }
    }

    // Coletar dados do formulário
    const formData = new FormData();
    
    // Dados básicos do livro
    formData.append('nomeLivro', document.getElementById('nomeLivro').value);
    formData.append('anoPublicacao', document.getElementById('anoPublicacao').value);
    formData.append('autor', document.getElementById('autor').value);
    formData.append('genero', document.getElementById('genero').value);
    formData.append('editora', document.getElementById('editora').value);
    formData.append('idioma', document.getElementById('idioma').value);
    formData.append('sinopse', document.getElementById('sinopse').value);
    formData.append('estadoConservacao', document.getElementById('estadoConservacao').value);
    formData.append('isbn', document.getElementById('inputISBN').value);
    formData.append('id_usuario', document.querySelector('input[name="id_usuario"]').value);

    // Adicionar capa
    if (capaFile) {
        formData.append('capa', capaFile);
    } else if (capaUrlDaAPI) {
        formData.append('capaUrl', capaUrlDaAPI);
    }

    // Adicionar fotos
    fotosFiles.forEach((foto, index) => {
        formData.append(`fotos[${index}]`, foto);
    });

    // Desabilitar o botão de enviar para evitar múltiplos envios
    const submitBtn = document.querySelector('#formLivro button[type="submit"]');
    const originalText = submitBtn.innerHTML;
    submitBtn.disabled = true;
    submitBtn.innerHTML = '⏳ Cadastrando...';

    try {
        // Enviar para o servidor
        const response = await fetch('addLivro.act.php', {
            method: 'POST',
            body: formData
        });
        
        const resultado = await response.json();

      

        
        if (resultado.success) {
            alert("ID inserido: " + resultado.idGerado);

            mostrarAlerta('Livro cadastrado com sucesso!', 'success');
            limparFormulario();
        } else {
            mostrarAlerta('Erro ao cadastrar livro: ' + resultado.message, 'error');
        }
        
    } catch (error) {
        console.error('Erro:', error);
        mostrarAlerta('Erro ao cadastrar livro. Tente novamente.', 'error');
    } finally {
        // Reativar o botão
        submitBtn.disabled = false;
        submitBtn.innerHTML = originalText;
    }
}

// Limpar formulário
function limparFormulario() {
    document.getElementById('formLivro').reset();
    document.getElementById('inputISBN').value = '';
    document.getElementById('capaPreview').innerHTML = '<span style="color: #6c757d;">Nenhuma capa selecionada</span>';
    document.getElementById('fotosContainer').innerHTML = '';
    capaFile = null;
    fotosFiles = [];
    capaUrlDaAPI = null;

    // Remover o campo hidden da capaUrl se existir
    const hiddenInput = document.querySelector('input[name="capaUrl"]');
    if (hiddenInput) {
        hiddenInput.remove();
    }
}