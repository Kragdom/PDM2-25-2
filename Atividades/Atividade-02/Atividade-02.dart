// Agregação e Composição
import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }
  Map<String, dynamic> toJson() {
    return {
      'nome do Dependente': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }
  Map<String, dynamic> toJson() {
    return {
      'funcionario': _nome,
      'Dependentes do Funcionario': _dependentes,
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }
  Map<String, dynamic> toJson() {
    return {
      'nome do projeto': _nomeProjeto,
      'funcionarios': _funcionarios,
    };
  }
}

void main() {
  // 1. Criar varios objetos Dependentes;
  var alex = Dependente("Alex");
  var gustavo = Dependente("Gustavo");
  var rodrigo = Dependente("Rodrigo");
  var gregorio = Dependente("Gregorio");
  var pauro = Dependente("Pauro");
  var jean = Dependente("Jean");
  // 2. Criar varios objetos Funcionario
  // 3. Associar os Dependentes criados aos respectivos
  // funcionarios
  Funcionario cayque = Funcionario("Cayque", [gustavo, gregorio]);
  Funcionario andre = Funcionario("André", [alex, rodrigo]);
  Funcionario pablo = Funcionario("Pablo", [jean, pauro]);

  // 4. Criar uma lista de Funcionarios
  List<Funcionario> empregados = [cayque, andre, pablo];
  // 5. criar um objeto Equipe Projeto chamando o metodo
  //    contrutor que da nome ao projeto e insere uma
  //    coleção de funcionario
  var projeto = EquipeProjeto("Bomba Atómica", empregados);
  // 6. Printar no formato JSON o objeto Equipe Projeto.

  final JsonEncoder jsonEncoder = JsonEncoder.withIndent(' ');
  final String jsonString = jsonEncoder.convert(projeto);
  print(jsonString);
}
