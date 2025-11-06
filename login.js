document.getElementById("loginForm").addEventListener("submit", async function (e) {
  e.preventDefault();

  const email = document.getElementById("email").value.trim();
  const senha = document.getElementById("senha").value.trim();
  const erroLogin = document.getElementById("erroLogin");

  try {
    // === Verifica ADMINISTRADORES ===
    const respAdmins = await fetch("admins.json");
    const dadosAdmins = await respAdmins.json();
    const adminValido = dadosAdmins.admins.find(
      (admin) => admin.email === email && admin.senha === senha
    );

    if (adminValido) {
      localStorage.setItem("adminLogado", JSON.stringify(adminValido));
      window.location.href = "admin.html";
      return; // encerra a função
    }

    // === Verifica ALUNOS ===
    const respAlunos = await fetch("alunos.json");
    const dadosAlunos = await respAlunos.json();
    const alunoValido = dadosAlunos.alunos.find(
      (aluno) => aluno.email === email && aluno.senha === senha
    );

    if (alunoValido) {
      localStorage.setItem("alunoLogado", JSON.stringify(alunoValido));
      window.location.href = "aluno.html";
      return;
    }

    // Caso não encontre em nenhum JSON:
    erroLogin.textContent = "E-mail ou senha incorretos!";
  } catch (erro) {
    console.error("Erro ao carregar dados:", erro);
    erroLogin.textContent = "Erro no servidor. Tente novamente mais tarde.";
  }
});

// === Mostrar / ocultar senha ===
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