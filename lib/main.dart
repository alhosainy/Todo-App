import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/src/data/repository/controller.dart';
import 'package:to_do_app/src/data/source/storage/controller.dart';
import 'package:to_do_app/src/domain/usecases/controller.dart';
import 'package:to_do_app/src/presentation/pages.dart';
import 'package:to_do_app/src/presentation/themes.dart';
import 'package:to_do_app/src/presentation/viewmodel/controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      enableLog: true,
    ),
  );
 
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

// _HomeState class that extends State
class _HomeState extends State<Home> {
  // Variables to store data
  Map? data = {};
  List<String> list = <String>['first', 'second', 'third'];
  List<String>? titleList = ['first title'];
  Map<String, Object> map = {
    'title': 'title',
    'body': 'body',
  };
  String _bodyField = "";
  String _titleField = "";
  // Initialize state
  @override
  void initState() {
    super.initState();
  }

  // Build the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        title: const Text('ToDo App'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
        itemCount: list.length,
        itemBuilder: (context, i) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                        child: Text('Title',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold))),
                    const Text('Body', style: TextStyle(fontSize: 20)),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          //TODO : delete this
                        },
                        child: const Text('Delete '),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.brown[300]),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white)),
                      ),
                    ),
                  ]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown[500],
        onPressed: () async {
          setState(() {
            list.add('value');
            titleList?.add('added to title list');
          });

          dynamic result = await showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                      backgroundColor: Colors.brown[50],
                      title: const Text('Add a note'),
                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Title',
                                ),
                                onChanged: (value) {
                                  _titleField = value;
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                maxLines: 2,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Body'),
                                onChanged: (value) {
                                  _bodyField = value;
                                },
                              ),
                              const SizedBox(height: 10.0),
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.brown[500])),
                                onPressed: () {
                                  Navigator.of(context).pop({
                                    'title': _titleField,
                                    'body': _bodyField,
                                  });
                                },
                                child: const Text('Add'),
                              ),
                            ],
                          ),
                        )
                      ]));
          setState(() {
            data = {
              'title': result?['title'],
              'body': result?['body'],
            };
            print(data);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
