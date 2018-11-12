import 'package:flutter/material.dart';
import 'package:gdg_ahmedabad_codelab/photo_util.dart';

class Detail extends StatelessWidget {
  final PhotoUtil photoList;

  Detail(this.photoList);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            buildImageHero(),
            buildBottomText(),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///Bottom Text displays the name of the user
  buildBottomText() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.black38,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "By ${photoList.user.name}",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
        ),
      ),
    );
  }

  ///Image widget
  buildImageHero() {
    return Hero(
      tag: photoList.urls.small,
      child: Image.network(
        photoList.urls.small,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
