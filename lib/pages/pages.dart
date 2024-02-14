


import '../export_libs/export_libs.dart';
import 'home_page.dart';

class MyPages extends StatefulWidget {
  static const String id = 'mypages';
  const MyPages({super.key});

  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          HomePage(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.white,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/40),
        items: [
          SalomonBottomBarItem(
            selectedColor: Colors.grey,
              icon: const Icon(Icons.home_filled,color: Colors.green,), title: Text('Home',style:
              TextStyle(fontSize: MediaQuery.of(context).size.height/45)
          )),
        ],
      )
    );
  }
}
