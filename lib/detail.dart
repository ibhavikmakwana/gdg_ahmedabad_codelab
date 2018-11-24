import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
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
            BottomAlignedText(photoList.user),
            buildBackIcon(context),
          ],
        ),
      ),
    );
  }

  ///
  buildBackIcon(BuildContext context) {
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
    return Align(
      alignment: Alignment.center,
      child: Hero(
        tag: photoList.urls.regular,
        child: Image(
          height: double.maxFinite,
          width: double.maxFinite,
          fit: BoxFit.cover,
          image: AdvancedNetworkImage(photoList.urls.regular, loadedCallback: () {
            print('It works!');
          }, loadFailedCallback: () {
            print('Oh, no!');
          }),
        ),
      ),
    );
  }
}
