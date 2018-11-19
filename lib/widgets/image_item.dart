import 'package:flutter/material.dart';
import 'package:gdg_ahmedabad_codelab/detail.dart';
import 'package:gdg_ahmedabad_codelab/photo_response.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageItemWidget extends StatelessWidget {
  final PhotoResponse data;

  const ImageItemWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      margin: EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: GestureDetector(
          onTap: () {
            navigateToDetailScreen(context);
          },
          child: Hero(
            tag: data.urls.small,
            child: Stack(
              children: <Widget>[
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: data.urls.small,
                  fit: BoxFit.cover,
                ),
                buildBottomText(),
              ],
            ),
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
            "By ${data.user.name}",
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
        builder: (context) => Detail(data),
      ),
    );
  }
}
