import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> todosTitle = <String>["ToDo 2", "ToDo 1"];
  List<String> todosDesc = <String>["Do laundry", "Buy groceries"];

  TextEditingController textTitleController = TextEditingController();
  TextEditingController textDescController = TextEditingController();

  void addItemToList() {
    setState(() {
      todosTitle.insert(0, textTitleController.text);
      todosDesc.insert(0, textDescController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                style: TextStyle(fontSize: 20),
                controller: textTitleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Title",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                style: TextStyle(fontSize: 20),
                controller: textDescController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Description"),
              ),
              SizedBox(height: 50),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: todosTitle.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          child: Container(
                              child: Column(
                            children: <Widget>[
                              Text(
                                "${todosTitle[index]}",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                              Text(
                                "${todosDesc[index]}",
                                style: TextStyle(fontSize: 20),
                                maxLines: 3,
                              )
                            ],
                          )),
                        );
                      }))
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            onPressed: () {
              addItemToList();
            },
            child: const Icon(
              Icons.add,
              size: 60,
              color: Colors.blueAccent,
            ),
            backgroundColor: Theme.of(context).indicatorColor,
          ),
        ));
  }
}
