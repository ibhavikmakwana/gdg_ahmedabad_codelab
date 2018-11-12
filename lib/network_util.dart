import 'dart:async';
import 'dart:convert';

import 'package:gdg_ahmedabad_codelab/api_config.dart';
import 'package:gdg_ahmedabad_codelab/photo_util.dart';
import 'package:http/http.dart' as http;

class NetworkUtil {
  Future<List<PhotoUtil>> fetchPhotos(int page) async {
    String photosUrl =
        "https://api.unsplash.com/photos/?page=" + page.toString();
    print(photosUrl);

    List<PhotoUtil> list = [];
    final response = await http.get(photosUrl,
        headers: {'Authorization': "Client-ID " + APIConfig.accessKey});

    if (response.statusCode == 200) {
      List decodedJson = json.decode(response.body);
      print(json.decode(response.body));
      for (int i = 0; i < decodedJson.length; i++) {
        list.add(PhotoUtil.fromJson(decodedJson[i]));
      }
      return list;
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
