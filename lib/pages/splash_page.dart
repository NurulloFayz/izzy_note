

import '../export_libs/export_libs.dart';

class SplashPage extends StatefulWidget {
  static const String id = 'splashpage';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  checkAuth() {
    Timer(const Duration(seconds: 4), () {
      if(!Auth.isLoggedin()) {
        Navigator.pushReplacementNamed(context, SignUpPage.id);
      } else {
        Navigator.pushReplacementNamed(context, MyPages.id);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAuth();
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
