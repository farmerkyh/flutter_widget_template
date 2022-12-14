import 'package:flutter/material.dart';
import 'package:navigation/routes_step100/routes_step110_model.dart';

void main() {
  runApp(RoutesStep110());
}

/*
  @class
*/
class RoutesStep110 extends StatelessWidget {
  static const String _title = 'Routes Templete';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(primarySwatch: Colors.amber),
      darkTheme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
      home: RoutesStep110Home(),
    );
  }
}

//-----------------------------------------------------------------------
// 0. Home page
//-----------------------------------------------------------------------
class RoutesStep110Home extends StatelessWidget {
  const RoutesStep110Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-------------------------------------------------------
      //1. appbar
      //-------------------------------------------------------
      appBar: AppBar(
        title: const Text("Routes Step110 (model)"),
        centerTitle: true,
        //elevation: 0.0,

        actions: [
          IconButton(
              onPressed: () {
                debugPrint("click");
              },
              icon: const Icon(Icons.shopping_cart)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),

      //-------------------------------------------------------
      //2. Drawer menu
      //-------------------------------------------------------
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            //-------------------------------------------------------
            //3. Drawer - Logo
            //-------------------------------------------------------
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/farmer_loop.png'),
                backgroundColor: Colors.white,
              ),
              accountEmail: Text("farmerkyh@naver.com"),
              accountName: Text("farmer"),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 176, 211, 240),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40.0), bottomRight: Radius.circular(40.0))),
            ),

            //-------------------------------------------------------
            //4. Drawer - Menu
            //-------------------------------------------------------
            ...routesStep100Screens.map((screen) => _DrawerMenu(name: screen.name, builder: screen.builder)),
          ],
        ),
      ),

      //-------------------------------------------------------
      //5. body
      //-------------------------------------------------------
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: Text("Routes ???????????? + Menu????????? ClassModel ?????? Template \n????????? ?????? ?????????.")),
          _BackButton(
            name: '?????? Home?????? ??????',
          )
        ],
      ),
    );
  }
}

//-----------------------------------------------------------------------
// 10. ???????????? ??????
//-----------------------------------------------------------------------
class _BackButton extends StatelessWidget {
  final String name;
  const _BackButton({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop(); // ?????? route??? ???????????? ?????????
      },
      child: Text(name),
    );
  }
}

//-----------------------------------------------------------------------
// 11. Drawer menu ?????? Widget
//-----------------------------------------------------------------------
class _DrawerMenu extends StatelessWidget {
  final String name;
  final WidgetBuilder builder;

  const _DrawerMenu({required this.name, required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white, //?????? ?????? tile?????????
      //selectedTileColor: Color(0xFF52C7B8), //????????? ??? ???????????? ?????????
      //selectedColor: Colors.black, //????????? ??? ???????????? ?????? ???
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: builder));
      },
      title: Text(name),
    );
  }
}
