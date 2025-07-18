<!-- filepath: /home/alexandre/eresume_online/bmvc_start_from_this/app/views/html/index.tpl -->
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Painel do Administrador - Currículos</title>
  <style>
    * {
      box-sizing: border-box;
    }
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f6f8;
      margin: 0;
      padding: 20px;
    }
    header {
      background-color: #2e86de;
      color: white;
      padding: 20px;
      text-align: center;
      border-radius: 8px;
    }
    main {
      margin-top: 20px;
    }
    .form-container, .list-container {
      background-color: white;
      padding: 20px;
      border-radius: 8px;
      margin-bottom: 20px;
      box-shadow: 0 0 10px rgba(0,0,0,0.05);
    }
    label {
      display: block;
      margin-top: 10px;
    }
    input {
      width: 100%;
      padding: 8px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    button {
      margin-top: 15px;
      padding: 10px 20px;
      background-color: #2e86de;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    button:hover {
      background-color: #1c5fa5;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 15px;
    }
    th, td {
      border: 1px solid #ddd;
      padding: 10px;
      text-align: left;
    }
    th {
      background-color: #f0f0f0;
    }
    .remove-btn {
      background-color: #e74c3c;
    }
    .remove-btn:hover {
      background-color: #c0392b;
    }
  </style>
</head>
<body>

<header>
  <h1>Controle de Currículos</h1>
</header>

<main>
  <div class="form-container">
    <h2>Adicionar Novo Currículo</h2>
    <form id="curriculoForm">
      <label for="nome">Nome:</label>
      <input type="text" id="nome" required />

      <label for="email">E-mail:</label>
      <input type="email" id="email" required />

      <label for="cargo">Cargo Desejado:</label>
      <input type="text" id="cargo" required />

      <button type="submit">Adicionar</button>
    </form>
  </div>

  <div class="list-container">
    <h2>Currículos Recebidos</h2>
    <table id="tabelaCurriculos">
      <thead>
        <tr>
          <th>Nome</th>
          <th>E-mail</th>
          <th>Cargo</th>
          <th>Ação</th>
        </tr>
      </thead>
      <tbody>
        <!-- Currículos serão adicionados aqui -->
      </tbody>
    </table>
  </div>
</main>

<script>
  const form = document.getElementById('curriculoForm');
  const tabela = document.querySelector('#tabelaCurriculos tbody');

  form.addEventListener('submit', function (e) {
    e.preventDefault();

    const nome = document.getElementById('nome').value;
    const email = document.getElementById('email').value;
    const cargo = document.getElementById('cargo').value;

    const novaLinha = document.createElement('tr');
    novaLinha.innerHTML = `
      <td>${nome}</td>
      <td>${email}</td>
      <td>${cargo}</td>
      <td><button class="remove-btn" onclick="removerLinha(this)">Remover</button></td>
    `;
    tabela.appendChild(novaLinha);

    form.reset();
  });

  function removerLinha(botao) {
    const linha = botao.parentNode.parentNode;
    linha.remove();
  }
</script>

</body>
</html>
