import 'package:flutter/material.dart';
import 'package:gdg_ahmedabad_codelab/network_util.dart';
import 'package:gdg_ahmedabad_codelab/photo_response.dart';
import 'package:gdg_ahmedabad_codelab/widgets/image_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Future<List<PhotoResponse>> photos;


  @override
  void initState() {
    super.initState();
    photos = NetworkUtil().fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.photo_size_select_actual,
          color: Colors.white,
        ),
        title: Text(
          'Photos',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<PhotoResponse>>(
        future: photos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildPhotosListView(snapshot);
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  double _kGridViewBreakpoint = 450.0;

  ///Build the list view and grid view
  buildPhotosListView(AsyncSnapshot<List<PhotoResponse>> snapshot) {
    if (MediaQuery
        .of(context)
        .size
        .width < _kGridViewBreakpoint) {
      return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) => ImageItemWidget(snapshot.data[index]),
        addAutomaticKeepAlives: true,
      );
    } else {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => ImageItemWidget(snapshot.data[index]),
      );
    }
  }
}
