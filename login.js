document.getElementById("loginForm").addEventListener("submit", async function (e) {
  e.preventDefault();

  const email = document.getElementById("email").value.trim().toLowerCase();
  const senha = document.getElementById("senha").value.trim();
  const erroLogin = document.getElementById("erroLogin");

  erroLogin.textContent = ""; // limpa mensagem antes

  try {
    // === Verifica ADMINISTRADORES ===
    const respAdmins = await fetch("admins.json");
    const dadosAdmins = await respAdmins.json();
    const adminValido = dadosAdmins.admins.find(
      (admin) => admin.email.toLowerCase() === email && admin.senha === senha
    );

    if (adminValido) {
      localStorage.setItem("adminLogado", JSON.stringify(adminValido));
      window.location.href = "admin.html";
      return;
    }

    // === Verifica PROFESSORES ===
    const respProfs = await fetch("professores.json");
    const dadosProfs = await respProfs.json();
    const professorValido = dadosProfs.professores.find(
      (prof) => prof.email.toLowerCase() === email && prof.senha === senha
    );

    if (professorValido) {
      localStorage.setItem("professorLogado", JSON.stringify(professorValido));
      window.location.href = "professor.html";
      return;
    }

    // === Verifica ALUNOS ===
    const respAlunos = await fetch("alunos.json");
    const dadosAlunos = await respAlunos.json();
    const alunoValido = dadosAlunos.alunos.find(
      (aluno) => aluno.email.toLowerCase() === email && aluno.senha === senha
    );

    if (alunoValido) {
      // salva o aluno no localStorage para usar no painel
      localStorage.setItem("alunoLogado", JSON.stringify(alunoValido));

      // Se você tiver um backend que devolve token, aqui você faria a requisição para obter
      // token e salvar também. Para testes simples com JSON local, isso não é necessário.
      window.location.href = "aluno.html";
      return;
    }

    // Caso não encontre em nenhum JSON:
    erroLogin.textContent = "E-mail ou senha incorretos!";
  } catch (erro) {
    console.error("Erro ao carregar dados:", erro);
    erroLogin.textContent = "Erro no servidor. Tente novamente mais tarde.";

    // dica de debug:
    // se estiver testando direto abrindo o arquivo no navegador (file://),
    // fetch("alunos.json") pode falhar. Rode um servidor (Live Server, http-server etc).
  }
});

// === Mostrar / ocultar senha ===
const toggleSenha = document.getElementById("toggleSenha");
const campoSenha = document.getElementById("senha");

if (toggleSenha && campoSenha) {
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
}

// ====================================================
// CASO O OUTRO CÓDIGO NÃO  FUNCIONE, USAR ESSE ANTIGO.
// ====================================================
