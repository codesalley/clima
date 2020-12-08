import 'dart:convert';

import 'package:http/http.dart' as http;

class GetNetworkData {
  String url;
  GetNetworkData(this.url);
  Future getWeather() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      print('you messed up');
    }
  }
}
