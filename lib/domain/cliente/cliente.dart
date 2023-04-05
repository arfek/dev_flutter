import 'dart:convert';

class Cliente{

  String nomeRazao;
  String nomeFantasia;
  String cpfCnpj;

  Cliente(this.nomeRazao, this.nomeFantasia, this.cpfCnpj);

  Cliente.fromJsonObject(Map<String, dynamic> jsonObj):
        nomeRazao = jsonObj['nomeRazao'],
        nomeFantasia = jsonObj['nomeFantasia'],
        cpfCnpj = jsonObj['cpfCnpj'];

  static List<Cliente> fromJson(String jsonStr){
    List<Cliente> list = [];

    var jsonArray = jsonDecode(jsonStr);

    for (Map<String, dynamic> jsonObj in jsonArray){
      list.add(Cliente.fromJsonObject(jsonObj));
    }

    return list;
  }
}