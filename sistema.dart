import 'dart:io';
import 'cliente.dart';
import 'funcionario.dart';
import 'locacao.dart';
import 'marca.dart';
import 'modelo.dart';
import 'veiculo.dart';

List<Cliente> clientes = [];
List<Funcionario> funcionarios = [];
List<Marca> marcas = [];
List<Modelo> modelos = [];
List<Veiculo> veiculos = [];
List<Locacao> locacoes = [];

  ////MENUS////
//principal://
void menuPrincipal(){
  print('Menu Principal');
  print('1 - Cadastros');
  print('2 - Locação');
  print('3 - Relatórios');
  print('4 - Sair');
}

//cadastro://
void menuCadastro(){
  print('Menu Cadastros');
  print('1 - Cadastrar Cliente');
  print('2 - Cadastrar Funcionario');
  print('3 - Cadastrar Marca');
  print('4 - Cadastrar Modelo');
  print('5 - Cadastrar Veículo');
  print('6 - Menu Principal');
}

//relatório://
void menuRelatorio(){
  print('Menu Relatórios');
  print('1 - Locações por Cliente');
  print('2 - Locações por Funcionário');
  print('3 - Locações por Veiculo');
  print('4 - Menu Principal');
}

  ////CLIENTES////
//cadastrar://
int id_cliente = 1;
void addCliente(){
  var cliente = new Cliente();
  print('O código do cliente é ${id_cliente}');
  cliente.id = id_cliente;
  print('Informe o nome do cliente: ');
  cliente.nome = stdin.readLineSync();
  print("Informe o CPF do cliente: ");
  cliente.cpf = int.parse(stdin.readLineSync()!);
  print('Informe o telefone do cliente: ');
  cliente.telefone = int.parse(stdin.readLineSync()!);
  print('Informe o endereço do cliente: ');
  cliente.endereco = stdin.readLineSync();
  clientes.add(cliente);
  exibirCliente();
  id_cliente = id_cliente + 1;
}

//exibir://
void exibirCliente(){
  for (var i = 0; i < clientes.length; i++) {
    print("Lista de Clientes \n"
        "ID: ${clientes[i].id} \n"
        "Nome: ${clientes[i].nome} \n"
        "CPF: ${clientes[i].cpf} \n"
        "Telefone: ${clientes[i].telefone}\n"
        "Endereço: ${clientes[i].endereco}\n");
  }
}

//relatorio://
void locacoes_cliente(){
  int? id_cliente;
  print('Sobre qual cliente gostaria de obter o relatório? ');
  id_cliente = int.parse(stdin.readLineSync()!);
  for(int i = 0; i < locacoes.length; i++){
    if(id_cliente == locacoes[i].id_cliente){
      print('|||Relatório de Clientes||| \n');
      print('O cliente ${clientes[i].nome} realizou a locação do veículo da marca ${marcas[i].nome}, do modelo ${modelos[i].nome}, e está locação teve o custo de ${locacoes[i].total} reais.');
    }
  }
}

  ////FUNCIONÁRIOS////
//cadastrar://
int id_funcionario = 1;
void addFuncionario(){
  var funcionario = new Funcionario();
  print('O código do funcionário é ${id_funcionario}');
  funcionario.id = id_funcionario;
  print('Informe o nome do funcionario: ');
  funcionario.nome = stdin.readLineSync();
  print('Informe o telefone do funcionario: ');
  funcionario.telefone = int.parse(stdin.readLineSync()!);
  funcionarios.add(funcionario);
  exibirFuncionario();
  id_funcionario = id_funcionario + 1;
}

//exibir://
void exibirFuncionario(){
  for (var i = 0; i < funcionarios.length; i++) {
    print("Lista de Funcionários \n"
        "ID: ${funcionarios[i].id} \n"
        "Nome: ${funcionarios[i].nome} \n"
        "Telefone: ${funcionarios[i].telefone}\n");
  }
}

//relatorio://
void locacoes_funcionario(){
  int? id_funcionario = 0;
  print('Sobre qual funcionario gostaria de obter o relatório? ');
  id_funcionario = int.parse(stdin.readLineSync()!);
  for(int i = 0; i < funcionarios.length; i++){
    int funcionario_cont = 0;
    for(int f = 0; f < locacoes.length; f++){
      if(locacoes[f].id_funcionario == funcionarios[i].id){
        funcionario_cont ++;
      }
    }
    if(id_funcionario == locacoes[i].id_funcionario){
      print('|||Relatório de Funcionários||| \n');
      print('O funcionário ${funcionarios[i].nome} realizou ${funcionario_cont} locações.');
    }
  }
}

  ////MARCAS////
//cadastrar://
int id_marca = 1;
void addMarca(){
  var marca = new Marca();
  print('O código da marca do veículo é ${id_marca}');
  marca.id = id_marca;
  print('Informe o nome da marca: ');
  marca.nome = stdin.readLineSync();
  marcas.add(marca);
  exibirMarca();
  id_marca = id_marca + 1;
}

//exibir://
void exibirMarca(){
  for (var i = 0; i < marcas.length; i++) {
    print("Lista de Marcas \n"
        "ID: ${marcas[i].id} \n"
        "Nome: ${marcas[i].nome} \n");
  }
}

  ////MODELOS////
//cadastrar://
int id_modelo = 1;
void addModelo(){
  var modelo = new Modelo();
  print('O código do modelo do veículo é ${id_modelo}');
  modelo.id = id_modelo;
  print('Informe o nome da modelo: ');
  modelo.nome = stdin.readLineSync();
  modelos.add(modelo);
  exibirModelo();
  id_modelo = id_modelo + 1;
}
//exibir://
void exibirModelo(){
  for (var i = 0; i < modelos.length; i++) {
    print("Lista de Modelos \n"
        "ID: ${modelos[i].id} \n"
        "Nome: ${modelos[i].nome} \n");
  }
}

  ////VEICULOS////
//cadastrar://
int id_veiculo = 1;
void addVeiculo(){
  var veiculo = new Veiculo();
  print('O código do veículo é ${id_veiculo}');
  veiculo.id = id_veiculo;
  print('Informe a marca do veiculo: ');
  veiculo.id_marca = int.parse(stdin.readLineSync()!);
  print('Informe o modelo do veiculo: ');
  veiculo.id_modelo = int.parse(stdin.readLineSync()!);
  print('Informe os kilometros rodados do veiculo: ');
  veiculo.km_rodado = int.parse(stdin.readLineSync()!);
  print('Informe o valor do veiculo: ');
  veiculo.valor = double.parse(stdin.readLineSync()!);
  veiculos.add(veiculo);
  exibirVeiculo();
  id_veiculo = id_veiculo + 1;
}

//exibir://
void exibirVeiculo(){
  for (var i = 0; i < veiculos.length; i++) {
    print("Lista de Veículos \n"
        "ID: ${veiculos[i].id} \n"
        "Marca: ${veiculos[i].id_marca} \n"
        "Modelo: ${veiculos[i].id_modelo} \n"
        "Kilometros rodados: ${veiculos[i].km_rodado}\n"
        "Valor: ${veiculos[i].valor}\n");
  }
}

double gerarTotal(id_veiculos, qtdDias){
  double? total_veiculos;
  for(var i = 0; i < veiculos.length; i++){
    if(veiculos[i].id == id_veiculos){
      total_veiculos = veiculos[i].valor! * qtdDias!;
    }
  }
  return total_veiculos!;
}

//relatorio://
void locacoes_veiculo(){
  int? id_veiculos = 0;
  print('Sobre qual veículo gostaria de obter o relatório? ');
  id_veiculos = int.parse(stdin.readLineSync()!);
  for(int i = 0; i < veiculos.length; i++){
    int veiculo_cont = 0;
    for(int v = 0; v < locacoes.length; v++){
      if(locacoes[v].id_veiculo == veiculos[i].id){
        veiculo_cont ++;
      }
    }
    if(id_veiculos == locacoes[i].id_veiculo){
      print('|||Relatório de Veículos||| \n');
      print('O veículo de código ${locacoes[i].id_veiculo} do modelo ${modelos[i].nome}, foi incluído em ${veiculo_cont} locações.');
    }
  }
}

  ////LOCAÇÃO////
//cadastrar://
int id_locacao = 1;
void addLocacao(){
  var locacao = new Locacao();
  print('O código da locação é ${id_locacao}');
  locacao.id = id_locacao;
  print('Informe o código do veículo: ');
  locacao.id_veiculo = int.parse(stdin.readLineSync()!);
  print('Informe o código do cliente: ');
  locacao.id_cliente = int.parse(stdin.readLineSync()!);
  print('Informe o código do funcionario: ');
  locacao.id_funcionario = int.parse(stdin.readLineSync()!);
  print('Informe a data de saída do veículo: ');
  locacao.data_saida = stdin.readLineSync();
  print('Informe a data de entrega do veículo: ');
  locacao.data_entrega = stdin.readLineSync();
  print('Informe quantos dias o veículo irá ficar locado:');
  locacao.dias_locado = int.parse(stdin.readLineSync()!);
  locacoes.add(locacao);
  id_locacao = id_locacao + 1;
}

//exibir://
void exibirLocacao(){
  for (var i = 0; i < locacoes.length; i++) {
    print("Lista de Locações \n"
        "Id: ${locacoes[i].id} "
        "Veículo: ${locacoes[i].id_veiculo} "
        "Cliente: ${locacoes[i].id_cliente} "
        "Funcionário: ${locacoes[i].id_funcionario} "
        "Data de saída: ${locacoes[i].data_saida} "
        "Data de entrega: ${locacoes[i].data_entrega} "
        "Quantidade de dias locado: ${locacoes[i].dias_locado} ");
  }
}
//valor total da locação://
void totalLocacao() {
  double? total_locacao = 0;
  for(var i = 0; i < locacoes.length; i++){
    total_locacao = total_locacao! + locacoes[i].total!;
  }
  print('Esta locação teve um custo de ${total_locacao} reais');
}

////sistema:////
void main(){
  int op;
  String? resp = "m";

  do{
    menuPrincipal();
    print("Informe a opção desejada: ");
    op = int.parse(stdin.readLineSync()!);
    switch(op){
      case 1://op cadastrar//
        String? resp = "n";
        do {
          menuCadastro();
          print("Informe a opção desejada: ");
          op = int.parse(stdin.readLineSync()!);
          switch(op){
            case 1://cadastrar cliente//
              addCliente();
              exibirCliente();
            break;
            case 2://cadastrar funcionario//
              addFuncionario();
              exibirFuncionario();
            break;
            case 3://cadastrar marca//
              addMarca();
              exibirMarca();
            break;
            case 4://cadastrar modelo//
              addModelo();
              exibirModelo();
            break;
            case 5://cadastrar veiculo//
              addVeiculo();
              exibirVeiculo();
            break;
            case 6://retorno ao menu principal//
              print('Você irá retornar ao Menu Principal');
              menuPrincipal();
            break;
          }
        }while(resp == "n");
      break;
      case 2://op locação//
        addLocacao();
        exibirLocacao();
      break;
      case 3://op relatorios//
        String? resp = "o";
        do {
          menuRelatorio();
          print("Informe a opção desejada: ");
          op = int.parse(stdin.readLineSync()!);
          switch(op){
            case 1://locacao por cliente//
              locacoes_cliente();
            break;
            case 2://locacao por funcionario//
              locacoes_funcionario();
            break;
            case 3://locacao por veiculo//
              locacoes_veiculo();
            break;
            case 4://retorno ao menu principal//
              print('Você irá retornar ao Menu Principal');
              menuPrincipal();
            break;
          }
        }while(resp == "o");
      break;
      case 4://op sair//
        print("Deseja realmente encerrar o sistema?");
        resp = stdin.readLineSync();
      break;
    }
  }while(resp == "m");
}