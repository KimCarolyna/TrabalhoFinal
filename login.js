document.getElementById("loginForm").addEventListener("submit", async function (e) {
  e.preventDefault();

  const email = document.getElementById("email").value.trim();
  const senha = document.getElementById("senha").value.trim();
  const erroLogin = document.getElementById("erroLogin");

  try {
    // Lê o arquivo JSON com os administradores
    const resposta = await fetch("admins.json");
    const dados = await resposta.json();

    // Verifica se existe um admin com o e-mail e senha digitados
    const adminValido = dados.admins.find(
      (admin) => admin.email === email && admin.senha === senha
    );

    if (adminValido) {
      // Salva o login no localStorage
      localStorage.setItem("adminLogado", JSON.stringify({ email }));

      // Redireciona para o painel administrativo
      window.location.href = "admin.html";
    } else {
      // Mostra mensagem de erro
      erroLogin.textContent = "E-mail ou senha incorretos!";
    }
  } catch (erro) {
    console.error("Erro ao carregar admins.json:", erro);
    erroLogin.textContent = "Erro no servidor. Tente novamente mais tarde.";
  }
});

// Mostrar / ocultar senha
const toggleSenha = document.getElementById("toggleSenha");
const campoSenha = document.getElementById("senha");

toggleSenha.addEventListener("click", () => {
  const tipo = campoSenha.getAttribute("type");
  if (tipo === "password") {
    campoSenha.setAttribute("type", "text");
    toggleSenha.classList.remove("ri-eye-off-line");
    toggleSenha.classList.add("ri-eye-line");
  } else {
    campoSenha.setAttribute("type", "password");
    toggleSenha.classList.remove("ri-eye-line");
    toggleSenha.classList.add("ri-eye-off-line");
  }
});