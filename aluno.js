async function carregarAluno() {
  // 1) Tenta carregar aluno salvo localmente (login via alunos.json)
  const alunoLocal = localStorage.getItem("alunoLogado");

  if (alunoLocal) {
    const aluno = JSON.parse(alunoLocal);
    document.getElementById("nomeAluno").innerText = aluno.nome || "Aluno";
    document.getElementById("turma").innerText = aluno.turma || document.getElementById("turma").innerText;
    document.getElementById("disciplina").innerText = aluno.disciplina || document.getElementById("disciplina").innerText;
    document.getElementById("professor").innerText = aluno.professor || document.getElementById("professor").innerText;

    // Se quiser popular uma tabela de notas baseada no objeto aluno (caso exista):
    // preencherTabelaNotas(aluno.notas);

    return;
  }

  // 2) Se não houver alunoLocal, tenta fluxo via token (backend)
  const token = localStorage.getItem("token");
  if (!token) {
    alert("Você precisa estar logado!");
    window.location.href = "index.html";
    return;
  }

  try {
    const resp = await fetch("http://localhost:8080/aluno/me", {
      headers: { "Authorization": "Bearer " + token }
    });

    if (!resp.ok) {
      throw new Error("Erro ao carregar dados do aluno");
    }

    const dados = await resp.json();
    document.getElementById("nomeAluno").innerText = dados.nome || "Aluno";
    // preencher tabela de notas vinda do backend:
    if (dados.notas && Array.isArray(dados.notas)) {
      const tabela = document.getElementById("tabelaNotas");
      if (tabela) {
        tabela.innerHTML = "";
        dados.notas.forEach(n => {
          const row = tabela.insertRow();
          row.insertCell(0).innerText = n.disciplina;
          row.insertCell(1).innerText = n.n1 ?? "-";
          row.insertCell(2).innerText = n.n2 ?? "-";
          row.insertCell(3).innerText = n.n3 ?? "-";
          row.insertCell(4).innerText = n.media ?? "-";
        });
      }
    }
  } catch (erro) {
    console.error("Erro:", erro);
    alert("Erro ao carregar informações do aluno.");
  }
}

window.onload = carregarAluno;
