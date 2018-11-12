import 'package:flutter/material.dart';
import 'package:gdg_ahmedabad_codelab/detail.dart';
import 'package:gdg_ahmedabad_codelab/network_util.dart';
import 'package:gdg_ahmedabad_codelab/photo_util.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int page = 1;
  ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()
      ..addListener(_scrollListener);
  }

  void _scrollListener() {
    print("Page:${controller.position.extentAfter}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.photo_size_select_actual,
          color: Colors.white,
        ),
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Photos',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<PhotoUtil>>(
        future: NetworkUtil().fetchPhotos(page),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildPhotosListView(snapshot);
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ///
  ListView buildPhotosListView(AsyncSnapshot<List<PhotoUtil>> snapshot) {
    return ListView.builder(
//      controller: controller,//Uncomment this line for the pagination
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Detail(snapshot.data[index]),
                ),
              );
            },
            child: Hero(
              tag: snapshot.data[index].urls.small,
              child: Image.network(
                snapshot.data[index].urls.small,
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
