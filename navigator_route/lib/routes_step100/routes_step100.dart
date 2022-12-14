import 'package:flutter/material.dart';

void main() {
  runApp(RoutesStep100());
}

/*
  @class
*/
class RoutesStep100 extends StatelessWidget {
  static const String _title = 'Routes Templete';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(primarySwatch: Colors.amber),
      darkTheme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
      home: RoutesStep100Home(),
    );
  }
}

//-----------------------------------------------------------------------
// 0. Home page
//-----------------------------------------------------------------------
class RoutesStep100Home extends StatelessWidget {
  const RoutesStep100Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-------------------------------------------------------
      //1. appbar
      //-------------------------------------------------------
      appBar: AppBar(
        title: const Text("Routes Step100 (basis)"),
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
            ListTile(
              tileColor: Colors.white, //?????? ?????? tile?????????
              //selectedTileColor: Color(0xFF52C7B8), //????????? ??? ???????????? ?????????
              //selectedColor: Colors.black, //????????? ??? ???????????? ?????? ???
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstPage()));
              },
              title: const Text('First Page'),
            ),
            const Divider(color: Colors.amber, height: 20),
            const _DrawerMenu(name: 'Second Page', page: SecondPage()),
            const _DrawerMenu(name: 'Third Page', page: ThirdPage()),
            const Divider(height: 5),
          ],
        ),
      ),

      //-------------------------------------------------------
      //5. body
      //-------------------------------------------------------
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: Text("Routes ???????????? \n????????? ?????? ?????????.")),
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
// 1. First Page
//-----------------------------------------------------------------------
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Page')),
      body: const Center(child: Text('??? First Page')),
    );
  }
}

//-----------------------------------------------------------------------
// 2. Second Page
//-----------------------------------------------------------------------
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: const Center(child: Text('??? Second Page')),
    );
  }
}

//-----------------------------------------------------------------------
// 3. Third Page
//-----------------------------------------------------------------------
class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Third Page')),
      body: const Center(child: Text('??? Third Page')),
    );
  }
}

//-----------------------------------------------------------------------
// 11. Drawer menu ?????? Widget
//-----------------------------------------------------------------------
class _DrawerMenu extends StatelessWidget {
  final String name;
  //final dynamic page;
  final Widget page;

  const _DrawerMenu({required this.name, required this.page, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white, //?????? ?????? tile?????????
      selectedTileColor: Color(0xFF52C7B8), //????????? ??? ???????????? ?????????
      selectedColor: Colors.black, //????????? ??? ???????????? ?????? ???
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
      },
      title: Text(name),
    );
  }
}
