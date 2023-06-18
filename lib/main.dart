import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class Words{
  String enteredText1 = '';
  String enteredText2 = '';

  Words({required this.enteredText1, required this.enteredText2});
}

class _HomePageState extends State<HomePage> {

  List<Words> dataList = [];

  void _showDialog(){
    showDialog(context: context, builder: (BuildContext context){
      String enteredText1 = '';
      String enteredText2 = '';

      return AlertDialog(
        title: Text('New Word'),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22),
        actions: [
          TextField(
            onChanged: (value) {
              enteredText1 = value;
            },
            decoration: InputDecoration(
              labelText: 'Enter title',
              enabledBorder: myInputBoder(),
              focusedBorder: myFocusBoder(),
            ),
          ),
          TextField(
            onChanged: (value) {
              enteredText2 = value;
            },
            decoration: InputDecoration(
              labelText: 'Enter description',
              enabledBorder: myInputBoder(),
              focusedBorder: myFocusBoder(),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text('Cancel')),
              TextButton(onPressed: (){
                setState(() {
                  dataList.add(Words(enteredText1: enteredText1, enteredText2: enteredText2));
                });
              }, child: Text('Save'),),
            ],
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('NotePad'),
        ),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index){
          return Card(
            color: Colors.grey,
            child: ListTile(
              title: Text(
                dataList[index].enteredText1,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                dataList[index].enteredText2,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        child: Icon(Icons.add),
      ),

    );
  }

  OutlineInputBorder myInputBoder() {
    return OutlineInputBorder(
      borderRadius:
      BorderRadius.all(Radius.elliptical(10, 5)),
      borderSide: BorderSide(
        color: Colors.grey.shade300,
        width: 3,
      ),
    );
  }

  OutlineInputBorder myFocusBoder() {
    return OutlineInputBorder(
      borderRadius:
      BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 2,
      ),
    );
  }
}