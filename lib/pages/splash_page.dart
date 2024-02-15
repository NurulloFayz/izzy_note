

import '../export_libs/export_libs.dart';

class SplashPage extends StatefulWidget {
  static const String id = 'splashpage';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  ViewSplashPage view = ViewSplashPage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    view.checkAuth(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png',height: MediaQuery.of(context).size.height/5.5,)
          ],
        ),
      ),
    );
  }
}
