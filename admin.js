async function cadastrarUsuario() {
  const token = localStorage.getItem("token");
  const username = document.getElementById("username").value;
  const senha = document.getElementById("senha").value;
  const nome = document.getElementById("nome").value;
  const email = document.getElementById("email").value;
  const tipo = document.getElementById("tipo").value; // ADMIN, PROFESSOR, ALUNO

  const resp = await fetch("http://localhost:8080/admin/usuarios", {
    method: "POST",
    headers: {
      "Authorization": "Bearer " + token,
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ username, senha, nomeCompleto: nome, email, tipo })
  });

  if (resp.ok) {
    alert("Usuário cadastrado com sucesso!");
  } else {
    alert("Erro ao cadastrar usuário.");
  }
}

async function cadastrarAluno() {
  const token = localStorage.getItem("token");
  const idUsuario = document.getElementById("idUsuarioAluno").value;
  const nome = document.getElementById("nomeAluno").value;
  const cpf = document.getElementById("cpfAluno").value;
  const email = document.getElementById("emailAluno").value;
  const telefone = document.getElementById("telefoneAluno").value;
  const endereco = document.getElementById("enderecoAluno").value;
  const dataNascimento = document.getElementById("dataNascimentoAluno").value;

  const resp = await fetch("http://localhost:8080/admin/alunos", {
    method: "POST",
    headers: {
      "Authorization": "Bearer " + token,
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ idUsuario, nome, cpf, email, telefone, endereco, dataNascimento })
  });

  if (resp.ok) {
    alert("Aluno cadastrado com sucesso!");
  } else {
    alert("Erro ao cadastrar aluno.");
  }
}

async function cadastrarProfessor() {
  const token = localStorage.getItem("token");
  const idUsuario = document.getElementById("idUsuarioProfessor").value;
  const nome = document.getElementById("nomeProfessor").value;
  const cpf = document.getElementById("cpfProfessor").value;
  const email = document.getElementById("emailProfessor").value;
  const telefone = document.getElementById("telefoneProfessor").value;
  const formacao = document.getElementById("formacaoProfessor").value;
  const areaAtuacao = document.getElementById("areaAtuacaoProfessor").value;
  const remuneracao = document.getElementById("remuneracaoProfessor").value;

  const resp = await fetch("http://localhost:8080/admin/professores", {
    method: "POST",
    headers: {
      "Authorization": "Bearer " + token,
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ idUsuario, nome, cpf, email, telefone, formacao, areaAtuacao, remuneracao })
  });

  if (resp.ok) {
    alert("Professor cadastrado com sucesso!");
  } else {
    alert("Erro ao cadastrar professor.");
  }
}

async function cadastrarDisciplina() {
  const token = localStorage.getItem("token");
  const nome = document.getElementById("nomeDisciplina").value;
  const cargaHoraria = document.getElementById("cargaHorariaDisciplina").value;
  const idProfessor = document.getElementById("idProfessorDisciplina").value;

  const resp = await fetch("http://localhost:8080/admin/disciplinas", {
    method: "POST",
    headers: {
      "Authorization": "Bearer " + token,
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ nome, cargaHoraria, idProfessor })
  });

  if (resp.ok) {
    alert("Disciplina cadastrada com sucesso!");
  } else {
    alert("Erro ao cadastrar disciplina.");
  }
}
