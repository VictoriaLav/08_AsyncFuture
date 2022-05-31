
import 'package:flutter/material.dart';
import 'fetch_file.dart';
import 'main.dart';

class CatchError extends StatefulWidget {
  CatchError({Key? key, required this.nameFile}) : super(key: key);
  String nameFile;

  @override
  State<CatchError> createState() => _CatchErrorState();
}

class _CatchErrorState extends State<CatchError> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.nameFile.isNotEmpty ? 'Доступ к файлу ${widget.nameFile}' : ''),
        SizedBox(height: 10),
        FutureBuilder<String>(
          future: fetchFileFromAssets(widget.nameFile),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                assetsToFile = false;
                return Center(child: Text('NONE'));
                break;
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
                break;
              case ConnectionState.done:
                assetsToFile = false;
                return SingleChildScrollView(child: Text(snapshot.data));
                break;
              default:
                assetsToFile = false;
                return SingleChildScrollView(
                  child: Text('Default'),
                );
            }
          },
        ),
      ],
    );
  }
}