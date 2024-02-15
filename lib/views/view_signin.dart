


import '../export_libs/export_libs.dart';

class ViewSignInPage {
  var email = TextEditingController();
  var password = TextEditingController();

  void signIn(BuildContext context) {
    String emailController = email.text.toString().trim();
    String passwordController = email.text.toString().trim();
    if(emailController.isEmpty || passwordController.isEmpty) {
      return;
    } else {
      Auth.SignInUser(emailController, passwordController).then((value) => {
        Navigator.pushReplacementNamed(context, MyPages.id)
      });
    }
  }
  void navigateToSignUpPage(BuildContext context) {
    Navigator.pushReplacementNamed(context,SignUpPage.id);
  }
}