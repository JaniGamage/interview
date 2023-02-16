import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://examination.24x7retail.com/';

class BaseClient {
  var client = http.Client();

  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'Authorization': 'Bearer sfie328370428387=',
      //?D(G+KbPeSgVkYp3s6v9y$B&E)H@McQf this api key show some error
      'api_key': '?D(G+KbPeSgVkYp3s6v9yB&E)H@McQf',
    };

    var response = await client.delete(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
}