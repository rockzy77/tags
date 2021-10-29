import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  List tags = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tags"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: controller,
                decoration: InputDecoration(labelText: 'Enter Your tag'),
              ),
              MaterialButton(
                onPressed: () {
                  String value = controller.text;
                  setState(() {
                    tags.add(value);
                    controller.clear();
                  });

                  print(tags);
                },
                child: Text('Add Tag'),
                color: Colors.red,
              ),
              Wrap(
                  children: List.generate(tags.length, (index) {
                return Chip(
                  backgroundColor: Colors.green,
                  labelStyle: TextStyle(color: Colors.white),
                  label: Text(tags[index]),
                );
              }))
            ],
          ),
        ),
      ),
    );
  }
}
