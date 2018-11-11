import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gdg_ahmedabad_codelab/photo_util.dart';
import 'package:gdg_ahmedabad_codelab/api_config.dart';

class NetworkUtil {
  Future<List<PhotoUtil>> fetchPost() async {
    List<PhotoUtil> list = [];
    final response = await http.get(APIConfig.photosUrl);
    if (response.statusCode == 200) {
      List decodedJson = json.decode(response.body);
      print(json.decode(response.body));
      for (int i = 0; i < decodedJson.length; i++) {
        print(i);
        list.add(PhotoUtil.fromJson(decodedJson[i]));
      }
      print(list);
      return list;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
