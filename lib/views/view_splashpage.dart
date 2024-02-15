
import 'package:izzy_note/export_libs/export_libs.dart';


class ViewSplashPage {
  checkAuth(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      if(!Auth.isLoggedin()) {
        Navigator.pushReplacementNamed(context, SignUpPage.id);
      } else {
        Navigator.pushReplacementNamed(context, MyPages.id);
      }
    });
  }
}