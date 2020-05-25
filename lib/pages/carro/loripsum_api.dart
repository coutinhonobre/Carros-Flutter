import 'dart:async';

import 'package:carros/pages/carro/simple_bloc.dart';
import 'package:carros/utils/prefs.dart';
import 'package:http/http.dart' as http;

class LoripsumBloc extends SimpleBloc<String> {

  static String lorin;

  fetch() async {
    try {
      String s =  lorin ?? await LoripsumApi.getLoripsum();
      lorin = s;
      add(s);
    } catch (e) {
      addError(e);
    }
  }
}

class LoripsumApi {
  static Future<String> getLoripsum() async {
    var url = 'https://loripsum.net/api';

    print("GET > $url");

    var response = await http.get(url);

    String text = response.body;

    text = text.replaceAll("<p>", "");
    text = text.replaceAll("</p>", "");

    return text;
  }
}
