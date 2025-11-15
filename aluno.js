async function carregarAluno() {
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

    document.getElementById("nomeAluno").innerText = dados.nome;

    const tabela = document.getElementById("tabelaNotas");
    tabela.innerHTML = ""; // limpa antes de preencher

    dados.notas.forEach(n => {
      const row = tabela.insertRow();
      row.insertCell(0).innerText = n.disciplina;
      row.insertCell(1).innerText = n.n1 ?? "-";
      row.insertCell(2).innerText = n.n2 ?? "-";
      row.insertCell(3).innerText = n.n3 ?? "-";
      row.insertCell(4).innerText = n.media ?? "-";
    });
  } catch (erro) {
    console.error("Erro:", erro);
    alert("Erro ao carregar informações do aluno.");
  }
}

window.onload = carregarAluno;
