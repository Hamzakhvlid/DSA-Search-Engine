import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';

import 'secondpage.dart';
import 'dart:io';

final List<int> list = [];

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  void picker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    //file got picked

    if (result != null) {
      PlatformFile file = result.files.first;

// openfile(file);
      final Stream<List<int>>? readStream;
      readStream = file.readStream;
      print(readStream);

      print(file.bytes);
      print(file.name);
      File newfile = new File(file.path!);
      List<String> fileData = await newfile.readAsLines();
      //anonymous function to convert list into int
      print(fileData);
      print(fileData.length);

      for (int i = 0; i < fileData.length; i++) {
        list.add(int.parse(fileData[i]));
        print(list[i]);
      }

      //This will pass list to second page

      getDataList(list);
    }

    setState(() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SecondPageFinal()));
    });
  }

  // void openfile(PlatformFile file) {
  //   OpenFile.open(file.path!);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: Text('DSA Search Engine'),
          leading: IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => FirstPage()),
                  (Route<dynamic> route) => false,
                );
              },
              icon: Icon(Icons.home))),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Container(
              color: Colors.blue,
              child: ElevatedButton(
                child: Text('Pick File!'),
                onPressed: () {
                  picker();
                },
              ),
            ),
          ),
          Card(
              child: Container(
            child: Text(
                'WELCOME! To Our Data Structure And Algorithms Search Engine'),
            margin: EdgeInsets.all(50),
            alignment: Alignment.center,
          )),
          Card(
            child: Container(
              child: Text('This Will Help You Help Find Best Algorithms'),
              margin: EdgeInsets.all(50),
              alignment: Alignment.center,
            ),
          ),
        ],
      )),
    ));
  }
}
