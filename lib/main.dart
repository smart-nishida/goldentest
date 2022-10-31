import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    print("height: $height");
    print("width: $width");

    return MaterialApp(
      home: Container(
        color: Colors.white,
        child: Center(
          child: AspectRatio(
            /// 9:19.5扱いのiPhone11
            // aspectRatio: 9/19.5, // 9:19.5だと横幅が空いてしまう
            aspectRatio: 414.0/848.0, // MediaQueryで取得した縦、横サイズで指定するとサイズはちょうど収まる → 厳密には9:19.5ではなく、おおよそ9:19.5ということっぽい
            /// 9:19扱いのPixel4XL
            // aspectRatio: 9/19, // 9:19だと横幅が空いてしまう
            // aspectRatio: 411.42857142857144/820.5714285714286, // MediaQueryで取得した縦、横サイズで指定するとサイズはちょうど収まる → 厳密には9:19ではなく、おおよそ9:19ということっぽい
            child: Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: Container(
                color: Colors.grey,
                child: Center(
                  child: Container(
                    height: 300,
                    width: 200,
                    color: Colors.cyanAccent,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'You have pushed the button this many times:',
                          ),
                          Text(
                            '$_counter',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
