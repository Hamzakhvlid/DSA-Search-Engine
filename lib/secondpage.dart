import 'package:datastruc/Models/Sorting/best_sorting.dart';
import 'package:datastruc/firstpage.dart';
import 'package:flutter/material.dart';
import 'dialogs.dart';
import 'main.dart';
import 'thirdpage.dart';
import 'Models/Searching/best_search.dart';

List<int>  globalList=[];
final mycontroller = TextEditingController();
String message = "";
//This class is used to get data from first page
class getDataList {
  var dataList;

  getDataList(this.dataList) {
    globalList = dataList;
  }
}

class Data {
  String Search(String s) {
    
    var bestS = BestSearch(globalList);
    return bestS.best(int.parse(s));
  }

  String Sort() {
    var bestSor = bestSort(globalList);

    return bestSor.best();
  }
}

class SecondPageFinal extends StatefulWidget {
  const SecondPageFinal({Key? key}) : super(key: key);

  @override
  State<SecondPageFinal> createState() => _SecondPageFinalState();
}

class _SecondPageFinalState extends State<SecondPageFinal> {
  get texController => null;

  get builder => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text('Searching & Sorting'),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
            body: SafeArea(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  Card(
                    child: Container(
                      child: ElevatedButton(
                        child: Text('Sort'),
                        onPressed: () async {
                          var data = Data();
                          message = data.Sort();
                         
                          sortAlertDialog1(context, message);
                        },
                      ),
                    ),
                  ),
                  // const SizedBox(height: 50, width: 50,),
                  // Text('Hello'),
                  Card(
                      elevation: 5,
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(children: [
                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'integer for search'),
                              controller: mycontroller,
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  var data = Data();
                                  message = data.Search(mycontroller.text);
                                  searchAlertDialog2(context, message);
                                },
                                child: Text('Search'))
                          ]))),

                  Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        child: Text('Get Data structure'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ThirdPage()),
                          );
                        },
                      )),
                ]))));
  }
}
