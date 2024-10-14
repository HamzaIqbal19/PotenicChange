// import 'package:flutter/material.dart';
// import 'package:video_thumbnail_imageview/video_thumbnail_imageview.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Video Thumbnail ImageView',
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//             child: VTImageView(
//               videoUrl:
//               "VIDEO URL",
//               width: 200.0,
//               height: 200.0,
//               errorBuilder: (context, error, stack) {
//                 return Container(
//                   width: 200.0,
//                   height: 200.0,
//                   color: Colors.blue,
//                   child: Center(
//                     child: Text("Image Loading Error"),
//                   ),
//                 );
//               }, assetPlaceHolder: 'assets/images/video_image.webp',
//             )),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String? _thumbnailUrl;

  String thumbnail = '';

  @override
  void initState() {
    super.initState();
    thumbnail = getYoutubeThumbnail('https://www.youtube.com/watch?v=e8lgclXZKAs&t=29s');
    print(thumbnail);
  }
  String getYoutubeThumbnail(String videoUrl) {
    final Uri? uri = Uri.tryParse(videoUrl);
    if (uri == null) {
      return 'null';
    }

    return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Video Thumbnail"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
               Image.network(thumbnail),

              ],
            ),
          ),
        ));
  }
}