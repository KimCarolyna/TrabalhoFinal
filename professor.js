async function carregarDisciplinas() {
  const token = localStorage.getItem("token");
  const resp = await fetch("http://localhost:8080/professor/disciplinas", {
    headers: { "Authorization": "Bearer " + token }
  });

  const disciplinas = await resp.json();
  const select = document.getElementById("disciplinasSelect");
  select.innerHTML = "";

  disciplinas.forEach(d => {
    const opt = document.createElement("option");
    opt.value = d;
    opt.text = d;
    select.add(opt);
  });
}

async function carregarAlunos() {
  const token = localStorage.getItem("token");
  const disciplinaNome = document.getElementById("disciplinasSelect").value;

  // Primeiro precisamos buscar o id da disciplina pelo nome
  const respDisc = await fetch("http://localhost:8080/admin/disciplinas", {
    headers: { "Authorization": "Bearer " + token }
  });
  const todasDisciplinas = await respDisc.json();
  const disciplina = todasDisciplinas.find(d => d.nome === disciplinaNome);

  if (!disciplina) {
    alert("Disciplina não encontrada!");
    return;
  }

  const resp = await fetch(`http://localhost:8080/professor/disciplinas/${disciplina.idDisciplina}/alunos`, {
    headers: { "Authorization": "Bearer " + token }
  });

  const alunos = await resp.json();
  const tabela = document.getElementById("tabelaAlunos");
  tabela.innerHTML = "";

  alunos.forEach(a => {
    const row = tabela.insertRow();
    row.insertCell(0).innerText = a.aluno;
    row.insertCell(1).innerText = a.n1 ?? "-";
    row.insertCell(2).innerText = a.n2 ?? "-";
    row.insertCell(3).innerText = a.n3 ?? "-";
    row.insertCell(4).innerText = a.media ?? "-";

    // Botão para lançar notas
    const btn = document.createElement("button");
    btn.innerText = "Lançar Notas";
    btn.onclick = () => lancarNotas(disciplina.idDisciplina, a.idMatricula);
    row.insertCell(5).appendChild(btn);
  });
}

async function lancarNotas(idDisciplina, idMatricula) {
  const token = localStorage.getItem("token");
  const n1 = prompt("Digite N1:");
  const n2 = prompt("Digite N2:");
  const n3 = prompt("Digite N3:");

  const resp = await fetch(`http://localhost:8080/professor/disciplinas/${idDisciplina}/lancar/${idMatricula}`, {
    method: "POST",
    headers: {
      "Authorization": "Bearer " + token,
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ n1: parseFloat(n1), n2: parseFloat(n2), n3: parseFloat(n3) })
  });

  if (resp.ok) {
    alert("Notas lançadas com sucesso!");
    carregarAlunos();
  } else {
    alert("Erro ao lançar notas.");
  }
}

window.onload = carregarDisciplinas;
