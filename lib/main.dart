import 'fetch_file.dart';
import 'package:flutter/material.dart';
import 'catch_error.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

bool assetsToFile = false;

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  String file1 = 'assets/somefile.txt';
  String file2 = 'assets/data.txt';

  TextEditingController _controllerTextField = TextEditingController();
  final styleBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      width: 2.0,
    ),
  );

  @override
  void initState() {
    super.initState();
    print('init');
    _controllerTextField.addListener(() { });
  }

  @override
  void dispose() {
    _controllerTextField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson 8'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {},
        children: <Widget>[

          //Задание 1
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text('Задание 1'),
                    SizedBox(height: 20),
                    CatchError(nameFile: file1),
                    SizedBox(height: 20),
                    CatchError(nameFile: file2),
                  ],
                ),
              ),
            ],
          ),

          //Задание 2
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text('Задание 2'),
                    SizedBox(height: 20),
                    Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            controller: _controllerTextField,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Введите имя файла',
                              focusedBorder: styleBorder,
                              enabledBorder: styleBorder,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          child: ElevatedButton(
                            onPressed: () {
                              assetsToFile = true;
                              setState(() {});
                            },
                            child: Text('Найти'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(80, 60),
                              primary: Colors.black,
                              onPrimary: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: CatchError(nameFile: (assetsToFile && _controllerTextField.text.isNotEmpty) ? 'assets/${_controllerTextField.text}.txt' : ''),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


