<!-- Estilo genrico aso para teste, gerei por i.a ja qu agente vai trabalhar so o crud
 ignore essa parte por enquanto,  -->
<style>
    .container-cadastro-livro {
        display: flex;
        gap: 20px;
        margin: 20px;
        padding: 20px;
        background: #f8f9fa;
        border-radius: 10px;
    }
    
    .lado-esquerdo, .lado-direito {
        flex: 1;
        padding: 20px;
        background: white;
        border: 1px solid #dee2e6;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .capa-preview {
        width: 200px;
        height: 300px;
        border: 2px dashed #ccc;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 10px;
        background: #f8f9fa;
    }
    
    .capa-preview img {
        max-width: 100%;
        max-height: 100%;
        object-fit: cover;
    }
    
    .fotos-container {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 10px;
        margin-top: 10px;
    }
    
    .foto-preview {
        width: 100px;
        height: 100px;
        border: 1px solid #ddd;
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
        background: #f8f9fa;
    }
    
    .foto-preview img {
        max-width: 100%;
        max-height: 100%;
        object-fit: cover;
    }
    
    .remover-foto {
        position: absolute;
        top: -5px;
        right: -5px;
        background: red;
        color: white;
        border: none;
        border-radius: 50%;
        width: 20px;
        height: 20px;
        cursor: pointer;
        font-size: 12px;
    }
    
    .form-group {
        margin-bottom: 15px;
    }
    
    .form-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #495057;
    }
    
    .form-group input,
    .form-group select,
    .form-group textarea {
        width: 100%;
        padding: 8px 12px;
        border: 1px solid #ced4da;
        border-radius: 4px;
        font-size: 14px;
    }
    
    .form-group input:focus,
    .form-group select:focus,
    .form-group textarea:focus {
        border-color: #007bff;
        outline: none;
        box-shadow: 0 0 0 2px rgba(0,123,255,0.25);
    }
    
    .busca-isbn {
        display: flex;
        gap: 10px;
        margin-bottom: 20px;
        padding: 15px;
        background-color: #e7f3ff;
        border-radius: 8px;
        border-left: 4px solid #007bff;
    }
    
    .busca-isbn input {
        flex: 1;
        padding: 10px;
        border: 1px solid #b3d7ff;
        border-radius: 4px;
    }
    
    .btn {
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
        transition: all 0.3s ease;
    }
    
    .btn:hover {
        transform: translateY(-1px);
        box-shadow: 0 2px 4px rgba(0,0,0,0.2);
    }
    
    .btn-primary {
        background-color: #007bff;
        color: white;
    }
    
    .btn-primary:hover {
        background-color: #0056b3;
    }
    
    .btn-success {
        background-color: #28a745;
        color: white;
    }
    
    .btn-success:hover {
        background-color: #1e7e34;
    }
    
    .btn-danger {
        background-color: #dc3545;
        color: white;
    }
    
    .hidden {
        display: none;
    }
    
    .loading {
        opacity: 0.6;
        pointer-events: none;
    }
    
    .section-title {
        color: #343a40;
        border-bottom: 2px solid #007bff;
        padding-bottom: 10px;
        margin-bottom: 20px;
    }
    
    .alert {
        padding: 10px 15px;
        border-radius: 4px;
        margin-bottom: 15px;
        display: none;
    }
    
    .alert-success {
        background-color: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
    }
    
    .alert-error {
        background-color: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
    }
</style>

<div class="container-cadastro-livro">
    <!-- Alertas para feedback -->
    <div id="alertSuccess" class="alert alert-success" style="display: none;"></div>
    <div id="alertError" class="alert alert-error" style="display: none;"></div>

    <!-- Lado Esquerdo - Imagens -->
    <div class="lado-esquerdo">
        <h3 class="section-title">📷 Imagens do Livro</h3>
        
        <div class="mb-4">
            <h4>Capa do Livro</h4>
            <div class="capa-preview" id="capaPreview">
                <span style="color: #6c757d;">Nenhuma capa selecionada</span>
            </div>
            <input type="file" id="inputCapa" accept="image/*" class="hidden">
            <button type="button" class="btn btn-primary" onclick="document.getElementById('inputCapa').click()">
                📸 Selecionar Capa
            </button>
        </div>
        
        <div>
            <h4>Fotos do Livro (Máx. 6)</h4>
            <div class="fotos-container" id="fotosContainer">
                <!-- Fotos serão adicionadas aqui -->
            </div>
            <input type="file" id="inputFotos" accept="image/*" multiple class="hidden">
            <button type="button" class="btn btn-primary" onclick="document.getElementById('inputFotos').click()">
                📷 Adicionar Fotos
            </button>
        </div>
    </div>
    
    <!-- Lado Direito - Formulário -->
    <div class="lado-direito">
        <h3 class="section-title">📖 Informações do Livro</h3>
        
        <!-- Busca por ISBN -->
        <div class="busca-isbn">
            <input type="text" id="inputISBN" placeholder="Digite o ISBN do livro (10 ou 13 dígitos)" style="flex: 1;">
            <button type="button" class="btn btn-primary" id="btnBuscarISBN" onclick="buscarPorISBN()">
                🔍 Buscar na API
            </button>
        </div>
        
        <form id="formLivro">
            <!-- Campo hidden para o ID do usuário -->
            <input type="hidden" name="id_usuario" value="<?php echo $idUsuario; ?>">
            
            <div class="form-group">
                <label for="nomeLivro"> Nome do Livro *</label>
                <input type="text" id="nomeLivro" name="nomeLivro" required>
            </div>
            
            <div class="form-group">
                <label for="anoPublicacao"> Ano de Publicação</label>
                <input type="number" id="anoPublicacao" name="anoPublicacao" min="1000" max="<?php echo date('Y'); ?>">
            </div>
            
            <div class="form-group">
                <label for="autor"> Autor *</label>
                <input type="text" id="autor" name="autor" required>
            </div>
            
            <div class="form-group">
                <label for="genero"> Gênero *</label>
                <input type="text" id="genero" name="genero" required>
            </div>
            
            <div class="form-group">
                <label for="editora"> Editora</label>
                <input type="text" id="editora" name="editora">
            </div>
            
            <div class="form-group">
                <label for="idioma"> Idioma *</label>
                <select id="idioma" name="idioma" required>
                    <option value="">Selecione o idioma</option>
                    <option value="pt">Português</option>
                    <option value="en">Inglês</option>
                    <option value="es">Espanhol</option>
                    <option value="fr">Francês</option>
                    <option value="de">Alemão</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="sinopse"> Sinopse</label>
                <textarea id="sinopse" name="sinopse" rows="5" placeholder="Digite a sinopse do livro..."></textarea>
            </div>
            
            <div class="form-group">
                <label for="estadoConservacao"> Estado de Conservação *</label>
                <select id="estadoConservacao" name="estadoConservacao" required>
                    <option value="">Selecione o estado</option>
                    <option value="Novo">Novo</option>
                    <option value="Seminovo">Seminovo</option>
                    <option value="Com Marcas de Uso">Com Marcas de Uso</option>
                    <option value="Danos Leves">Danos Leves</option>
                    <option value="Danos Severos">Danos Severos</option>
                </select>
            </div>
            
            <button type="submit" class="btn btn-success" style="width: 100%; padding: 12px;">
                 Cadastrar Livro
            </button>
        </form>
    </div>
</div>
