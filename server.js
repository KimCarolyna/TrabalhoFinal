// server.js
const express = require('express');
const fs = require('fs');
const path = require('path');
const bodyParser = require('body-parser');

const app = express();
const PORT = 3000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(__dirname));

const dadosPath = path.join(__dirname, 'dados.json');

// 🔹 Página inicial -> login.html
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'login.html'));
});

// 🔹 Rota para salvar cadastro
app.post('/salvar', (req, res) => {
  const novoCadastro = req.body;

  // Validação simples
  if (!novoCadastro.nome || !novoCadastro.email || !novoCadastro.senha) {
    return res.json({ success: false, message: '⚠️ Preencha todos os campos.' });
  }

  let cadastros = [];

  // Lê o arquivo se ele já existir
  if (fs.existsSync(dadosPath)) {
    cadastros = JSON.parse(fs.readFileSync(dadosPath));
  }

  // Verifica se o e-mail já foi cadastrado
  const existe = cadastros.find((user) => user.email === novoCadastro.email);
  if (existe) {
    return res.json({ success: false, message: '⚠️ E-mail já cadastrado!' });
  }

  // Adiciona novo usuário e salva
  cadastros.push(novoCadastro);
  fs.writeFileSync(dadosPath, JSON.stringify(cadastros, null, 2));

  res.json({ success: true, message: '✅ Cadastro salvo com sucesso!' });
});

// 🔹 Rota para listar cadastros
app.get('/listar', (req, res) => {
  if (!fs.existsSync(dadosPath)) {
    return res.json([]);
  }
  const cadastros = JSON.parse(fs.readFileSync(dadosPath));
  res.json(cadastros);
});

// 🔹 Rota para login
app.post('/login', (req, res) => {
  const { email, senha } = req.body;

  if (!fs.existsSync(dadosPath)) {
    return res.json({ success: false, message: '❌ Nenhum cadastro encontrado.' });
  }

  const cadastros = JSON.parse(fs.readFileSync(dadosPath));

  const usuario = cadastros.find(
    (u) => u.email === email && u.senha === senha
  );

  if (usuario) {
    res.json({
      success: true,
      message: `✅ Login bem-sucedido! Bem-vindo(a), ${usuario.nome}!`,
    });
  } else {
    res.json({ success: false, message: '❌ E-mail ou senha incorretos.' });
  }
});

// 🔹 Inicia o servidor
app.listen(PORT, () => {
  console.log(`✅ Servidor rodando em: http://localhost:${PORT}`);
});

