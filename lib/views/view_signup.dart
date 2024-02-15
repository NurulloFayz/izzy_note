



import '../export_libs/export_libs.dart';

class ViewSignUpPage {
  var email = TextEditingController();
  var password = TextEditingController();

  void signUp(BuildContext context) {
    String emailController = email.text.toString().trim();
    String passwordController = email.text.toString().trim();
    if(emailController.isEmpty || passwordController.isEmpty) {
      return;
    } else {
      Auth.SignUpUser(password: passwordController, email: emailController).then((value) => {
        Navigator.pushReplacementNamed(context, MyPages.id)
      });
    }
  }
  void navigateToSignInPage(BuildContext context) {
    Navigator.pushNamed(context, SignInPage.id);
  }
}