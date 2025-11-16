/* document.getElementById("loginForm").addEventListener("submit", async function (e) {
  e.preventDefault();

  const username = document.getElementById("email").value.trim(); // pode ser email ou username
  const senha = document.getElementById("senha").value.trim();
  const erroLogin = document.getElementById("erroLogin");

  try {
    const resp = await fetch("http://localhost:8080/auth/login", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ username: username, password: senha })
    });

    if (!resp.ok) {
      erroLogin.textContent = "Usuário ou senha inválidos!";
      return;
    }

    const dados = await resp.json();
    localStorage.setItem("token", dados.token);
    localStorage.setItem("role", dados.role);
    localStorage.setItem("nome", dados.nomeCompleto);

    // Redireciona conforme o tipo
    if (dados.role === "ADMIN") {
      window.location.href = "admin.html";
    } else if (dados.role === "PROFESSOR") {
      window.location.href = "professor.html";
    } else if (dados.role === "ALUNO") {
      window.location.href = "aluno.html";
    }
  } catch (erro) {
    console.error("Erro no login:", erro);
    erroLogin.textContent = "Erro no servidor. Tente novamente mais tarde.";
  }
});

// === Mostrar / ocultar senha (mantém igual) ===
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
})*/;
