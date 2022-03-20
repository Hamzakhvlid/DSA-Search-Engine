
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  String _choice = '';
  int number = 0;
  int limit = 10;
  bool isButtonActive = false;
  bool isPressed = false;
  List<String> items = [
    'HCI Should Be Better',
    'stack',
    'queue',
    'linkedlist',
    'trees',
    'heap',
    'hashmap',
    'dsa',
    'fuck'
  ];

  get eCtrl => null;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Data Structures'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body:
            // Padding(
            //   padding: const EdgeInsets.all(25),child:
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Please Select any  approach for data traversal '),
            ListTile(
              leading: Radio<String>(
                  value: 'queue',
                  groupValue: _choice,
                  onChanged: (value) {
                    setState(() {
                      _choice = value!;
                    });
                  }),
              title: const Text('First In First out (oldest)'),
            ),
            ListTile(
              leading: Radio<String>(
                value: 'stack',
                groupValue: _choice,
                onChanged: (value) {
                  setState(() {
                    _choice = value!;
                  });
                },
              ),
              title: const Text('Last In first out (recent) '),
            ),
            ListTile(
              leading: Radio<String>(
                value: 'array',
                groupValue: _choice,
                onChanged: (value) {
                  setState(() {
                    _choice = value!;
                  });
                },
              ),
              title: const Text('The data will not grow or shrink '),
            ),
            ListTile(
              leading: Radio<String>(
                value: 'list',
                groupValue: _choice,
                onChanged: (value) {
                  setState(() {
                    _choice = value!;
                  });
                },
              ),
              title: const Text('The data will grow or shrink dynamically'),
            ),
            ListTile(
              leading: Radio<String>(
                value: 'tree',
                groupValue: _choice,
                onChanged: (value) {
                  setState(() {
                    _choice = value!;
                  });
                },
              ),
              title: const Text('Want insertion,deletion in O(log n) time '),
            ),
            ListTile(
              leading: Radio<String>(
                value: 'heap',
                groupValue: _choice,
                onChanged: (value) {
                  setState(() {
                    _choice = value!;
                  });
                },
              ),
              title: const Text('To remove the data with highest or lowest priority'),
            ),
            Center(
              child: Card(
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        color: Colors.amber,
                        height: 150,
                        width: 550,
                        child: LayoutBuilder(builder: (context, constraints) {
                          if (_choice == 'array') {
                            isButtonActive = true;
                            return Text('ARRAYS');
                          } else if (_choice == 'stack') {
                            isButtonActive = true;
                            return Text('STACK');
                          } else if (_choice == 'queue') {
                            isButtonActive = true;
                            return Text('QUEUE');
                          } else if (_choice == 'list') {
                            isButtonActive = true;
                            return Text('LINKED LIST');
                          } else if (_choice == 'tree') {
                            isButtonActive = true;
                            return Text('TREES');
                          } else if (_choice == 'heap') {
                            isButtonActive = true;
                            return Text('HEAPS');
                          } else {
                            isButtonActive = true;
                            return Text('What The Fuck!!!!!!!!!!');
                          }
                        })),
                  ],
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: isButtonActive
                    ? () {
                        setState(() {
                          isPressed = true;
                          //                   Navigator.push(context,
                          // MaterialPageRoute(builder: (context) => Listing()));
                        });
                      }
                    : null,
                child: Text('Display'),
              ),
            ),
            //
            // new TextField(
            //   //controller: eCtrl,
            //   onSubmitted: (text) {
            //     items.add(text);
            //     // eCtrl.clear();
            //     setState(() {});
            //   },
            // ),
            new Expanded(
              child: Center(
                  child: Container(
                // margin: EdgeInsets.all(50),
                // height: 50,
                // width: 50,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return new LayoutBuilder(builder: (context, constraints) {
                      if (isPressed == true) {
                        return Center(
                          child: Card(
                            margin: EdgeInsets.all(20),
                            child: Text(items[index]),
                          ),
                        );
                      } else {
                        return Text('');
                      }
                    });
                    // Center(
                    //   child: Card(
                    //       margin: EdgeInsets.all(20),
                    //       child: Text(items[index])),
                    // );
                  },
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
