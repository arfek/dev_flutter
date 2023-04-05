import 'package:http/http.dart' as http;


Future requestGET(String path, {Map<dynamic, dynamic>? params}) async{

  //Chumbado assim para testar...
  String url = 'https://host.com.br$path';

  if(params != null){
    url = '$url&${params.keys.map((key) => '$key=${params[key]}').join('&')}';
  }

  http.Response response = await _doGet(url);

  return response;
}

Future<http.Response> _doGet(String request) async {
  var url = Uri.parse(request);
  return await http.get(url);
}




























