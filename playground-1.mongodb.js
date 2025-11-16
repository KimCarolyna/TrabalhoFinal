/* global use, db */
// MongoDB Playground para Gestão Acadêmica FINAL

// Seleciona o banco de dados do seu projeto
use('gestao-academica');

// --- 1. Limpar Coleções (Recomendado) ---
db.getCollection('alunos').deleteMany({});
db.getCollection('professores').deleteMany({});
db.getCollection('administradores').deleteMany({});
console.log("Coleções limpas.");

// =========================================================================
// COLEÇÃO: ALUNOS (Remoção de João Silva)
// =========================================================================

db.getCollection('alunos').insertMany([
  {
    "nome": "Pedro Alves",
    "turma": "3ºA",
    "disciplina": "Matemática",
    "professor": "Samuel Mendes"
  },
  {
    "nome": "Lara Costa",
    "turma": "2ºB",
    "disciplina": "História",
    "professor": "Jerffi Duarte"
  }
]);

// Consulta de exemplo: Agrupa e conta alunos por turma
db.getCollection('alunos').aggregate([
  { $group: { _id: '$turma', totalAlunos: { $sum: 1 } } },
  { $sort: { "_id": 1 } }
]);

// =========================================================================
// COLEÇÃO: PROFESSORES
// =========================================================================

db.getCollection('professores').insertMany([
  {
    "nome": "Ana Souza",
    "disciplinas": ["Desenvolvimento Web", "Banco de Dados"],
    "turmas": ["3ºA - Informática", "3ºB - Informática"]
  },
  {
    "nome": "Carlos Andrade",
    "disciplinas": ["Lógica de Programação", "Estruturas de Dados"],
    "turmas": ["2ºA - Informática"]
  },
  {
    "nome": "Mariana Lopes",
    "disciplinas": ["Matemática Aplicada", "Estatística"],
    "turmas": ["1ºB - Matemática", "2ºB - Matemática"]
  },
  {
    "nome": "João Silva",
    "disciplinas": ["Banco de Dados", "Engenharia de Software"],
    "turmas": ["3ºA - Informática", "3ºC - Sistemas"]
  }
]);

// Consulta de exemplo: Lista professores que ensinam "Banco de Dados"
db.getCollection('professores').find({
  "disciplinas": "Banco de Dados"
});

// =========================================================================
// COLEÇÃO: ADMINISTRADORES
// =========================================================================

db.getCollection('administradores').insertMany([
  {
    "nome": "Jerffi Duarte",
    "login": "Jerffi",
    "nivelAcesso": "COORDENADOR"
  },
  {
    "nome": "Samuel Mendes",
    "login": "Samuelmds",
    "nivelAcesso": "DIRETOR"
  }
]);

// Consulta de exemplo: Busca administradores com nível de acesso "DIRETOR"
db.getCollection('administradores').find({
  "nivelAcesso": "DIRETOR"
});