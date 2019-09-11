import 'package:flutter/material.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController writerController = TextEditingController();
    writerController.text = "prueba";
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  FlutterNfcReader.read().then((response) {
                    print(response.content);
                    if (response.status != NFCStatus.error) {
                      writerController.text = response.toString();
                    }
                  });
                },
                child: Text("Read"),
              ),
              Container(
                height: 200,
                child: TextField(
                controller: writerController,
              ),)
              ,
              RaisedButton(
                onPressed: () {
                  FlutterNfcReader.write(" ", writerController.text)
                      .then((value) {
                    print(value.content);
                  });
                },
                child: Text("Write"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
