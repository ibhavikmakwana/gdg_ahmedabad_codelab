import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gdg_ahmedabad_codelab/photo_util.dart';
import 'package:gdg_ahmedabad_codelab/api_config.dart';

class NetworkUtil {
  Future<List<PhotoUtil>> getPhotos() async {
    print('insideutil');
    String url = APIConfig.photosUrl;
    List<PhotoUtil> response;
    await http.get(url).then((data){
      print(data); 
      response = json.decode(data.body);
   
    });
    return response;
  }
}