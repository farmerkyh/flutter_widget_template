import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import 'dart:convert';
void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.amber),
    home: FutureBuilder200(),
  ));
}

class FutureBuilder200 extends StatefulWidget {
  const FutureBuilder200({super.key});

  @override
  State<FutureBuilder200> createState() => _FutureBuilder200State();
}

class _FutureBuilder200State extends State<FutureBuilder200> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('http-json call')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: nameList(),
              builder: (constext, snapshot) {
                if (snapshot.hasError) {
                  return Text('${snapshot.data}');
                }
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Text('id = ${snapshot.data!.id}'),
                      Text('firstName = ${snapshot.data!.firstName}'),
                      Text('lastname = ${snapshot.data!.lastName}'),
                    ],
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<Name> nameList() async {
  var url = Uri.parse('https://my.api.mockaroo.com/nameone.json?key=5be89c30');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    print("response-->$response");
    print(response.body);
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    Name name = Name.fromJson(jsonData);
    return name;
  } else {
    throw Exception('Failed to load post');
  }
}

class Name {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  Name(this.id, this.firstName, this.lastName, this.email);

  Name.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        email = json['email'];

  //아래는 문법만 확인해보려고 작성했었음
  // factory Name.fromJson2(Map<String, dynamic> json) {
  //   return Name(
  //     json['id'],
  //     json['firstName'],
  //     json['lastName'],
  //     json['email'],
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }
}
