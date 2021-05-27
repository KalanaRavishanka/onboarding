import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _sliderIndex = 0;

  final List<String> images = [
    "assets/slider_1.png",
    "assets/slider_2.png",
    "assets/slider_3.png",
    "assets/slider_4.png",
  ];

  final IndexController controller = IndexController();

  @override
  Widget build(BuildContext context) {
    TransformerPageView transformerPageView = TransformerPageView(
      pageSnapping: true,
      onPageChanged: (index) {
        setState(() {
          this._sliderIndex = index;
        });
      },
      loop: false,
      controller: controller,
      transformer: new PageTransformerBuilder(
          builder: (Widget child, TransformInfo info) {
        return new Material(
          color: Colors.white,
          elevation: 8.0,
          textStyle: new TextStyle(color: Colors.white),
          borderRadius: new BorderRadius.circular(12.0),
          child: new Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new ParallaxContainer(
                    child: new Image.asset(
                      images[info.index],
                      fit: BoxFit.contain,
                      height: 350,
                    ),
                    position: info.position,
                    translationFactor: 400.0,
                  )
                ],
              ),
            ),
          ),
        );
      }),
      itemCount: 4,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: transformerPageView,
    );
  }
}
