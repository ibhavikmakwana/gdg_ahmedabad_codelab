import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gdg_ahmedabad_codelab/api_config.dart';
import 'package:gdg_ahmedabad_codelab/network_util.dart';
import 'package:gdg_ahmedabad_codelab/photo_util.dart';

void main() {
  runApp(MaterialApp(
    home: PhotosHome(),
  ));
}

class PhotosHome extends StatefulWidget {
  @override
  PhotosHomeState createState() {
    return new PhotosHomeState();
  }
}

class PhotosHomeState extends State<PhotosHome> {
  List<PhotoUtil> photoList = [];
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   NetworkUtil().getPhotos().then((data) {
  //     print('done');
  //   });
  // }

  Future<dynamic> getPhotos() async {
    var response = await http.get(APIConfig.photosUrl).then((onValue){
      print(onValue);
    });
    var decodedJson = jsonDecode(response.body);
    print(decodedJson);
    print(response.body);
    return decodedJson;
    // setState(() {
    //   // photoList = PhotoUtil.fromJson(decodedJson);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Photos'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
              debugPrint('done');
            getPhotos().then((data) {
              setState(() {
                photoList = data;
              });
            });
          },
        ),
      ),
      body: ListView.builder(
        itemCount: photoList.length,
        itemBuilder: (context, index) {
          return Text(photoList[index].urls);
        },
      ),
    );
  }
}
