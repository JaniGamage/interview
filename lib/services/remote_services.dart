import 'package:mypos/model/post.dart';
import 'package:http/http.dart' as http;


class RemoteService{
  Future<List<Post>?> getPosts() async{
    var client = http.Client();

    var uri = Uri.parse('/api/v1.0/Employees');
    var response = await client.get(uri);
    if (response.statusCode == 200){
      var json = response.body;
     // return postFromJson(json);
    }
  }
}