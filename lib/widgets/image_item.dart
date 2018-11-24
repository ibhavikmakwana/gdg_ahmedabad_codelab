import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';

import 'package:gdg_ahmedabad_codelab/detail.dart';
import 'package:gdg_ahmedabad_codelab/photo_response.dart';

class ImageItemWidget extends StatefulWidget {
  final PhotoResponse data;

  ImageItemWidget(this.data);

  @override
  ImageItemWidgetState createState() {
    return new ImageItemWidgetState();
  }
}

class ImageItemWidgetState extends State<ImageItemWidget> {
  bool isLoded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      margin: EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: GestureDetector(
          onTap: () {
            navigateToDetailScreen(context);
          },
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Hero(
                  tag: widget.data.urls.regular,
                  child: Image(
                    image: AdvancedNetworkImage(widget.data.urls.regular,
                        loadedCallback: () {
                      setState(() {
                        isLoded = true;
                      });
                    }, loadFailedCallback: () {
                      print('Oh, no!');
                    }),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              buildBottomText(),

            !isLoded ? Align(
              alignment: Alignment.center,
              key: Key(widget.data.urls.regular),
              child: CircularProgressIndicator(strokeWidth: 1.0,),
            ) : Container()
            ],
          ),
        ),
      ),
    );
  }

  ///Bottom user name text
  buildBottomText() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        color: Colors.black38,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "By ${widget.data.user.name}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
          ),
        ),
      ),
    );
  }

  ///Navigate to the detail screen with Hero animation
  void navigateToDetailScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Detail(widget.data),
      ),
    );
  }
}
