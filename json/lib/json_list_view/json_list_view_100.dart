import 'package:flutter/material.dart';
import 'package:json/json_list_view/services.dart';
import 'package:json/json_list_view/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JsonListView100(),
    );
  }
}

class JsonListView100 extends StatefulWidget {
  JsonListView100({super.key});

  @override
  State<JsonListView100> createState() => _JsonListView100State();
}

class _JsonListView100State extends State<JsonListView100> {
  List<User> user = <User>[];

  @override
  void initState() {
    super.initState();
    Services.getUserInfo().then((value) => {
          setState(() {
            user = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('json -> class로 변환'),
      ),
      body: ListView.builder(
        itemCount: user.length,
        itemBuilder: ((context, index) {
          return Card(
              child: ListTile(
            leading: const Icon(Icons.people_alt),
            title: Text('${user[index].id} - ${user[index].name}'),
            subtitle: Text('street:${user[index].address.street} - company:${user[index].company.name}'),
          ));
        }),
      ),
    );
  }
}
