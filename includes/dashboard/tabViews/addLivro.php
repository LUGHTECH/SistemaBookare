
<form action="dashboard/tabViews/addLivro.act.php" method="post" id="formLivro" enctype="multipart/form-data">
    <!-- Campo hidden para o ID do usuário -->
    <input type="hidden" name="id_usuario" value="<?php echo $idUsuario; ?>">

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
                <input type="file" id="inputCapa" name="capa" accept="image/*" class="hidden">
                <button type="button" class="btn btn-primary" onclick="document.getElementById('inputCapa').click()">
                    📸 Selecionar Capa
                </button>
            </div>
            
            <div>
                <h4>Fotos do Livro (Máx. 6)</h4>
                <div class="fotos-container" id="fotosContainer">
                    <!-- Fotos serão adicionadas aqui -->
                </div>
                <input type="file" id="inputFotos" name="fotos[]" accept="image/*" multiple class="hidden">
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
        </div>
    </div>

</form>
    

