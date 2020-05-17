import 'dart:convert';

import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi{

  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try{
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

      Map<String, String> hearders = {
        "Content-Type": "application/json"
      };

      Map params = {
        "username": login,
        "password": senha
      };

      String s = json.encode(params);

      var response = await http.post(url, body: s,headers: hearders);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mResponse = json.decode(response.body);



      if(response.statusCode == 200) {
        final user = Usuario.fromJson(mResponse);
        return ApiResponse.ok(user);
      }

      return ApiResponse.error(mResponse["error"]);
    }catch(error, excepetion){
      print("Erro no login $error > $excepetion");
      
      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }

}