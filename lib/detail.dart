import 'package:flutter/material.dart';
import 'package:gdg_ahmedabad_codelab/photo_response.dart';
import 'package:gdg_ahmedabad_codelab/widgets/bottom_aligned_text.dart';

class Detail extends StatelessWidget {
  final PhotoResponse photoList;

  Detail(this.photoList);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            buildImageHero(),
            BottomAlignedText(photoList.user.name),
            buildBackIcon(context),
          ],
        ),
      ),
    );
  }

  ///
  Align buildBackIcon(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: CircleAvatar(
          backgroundColor: Colors.black12,
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
