

import 'package:google_fonts/google_fonts.dart';

import '../../export_libs/export_libs.dart';

class SignInPage extends StatefulWidget {
  static const String id = 'signinpage';
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  ViewSignInPage view = ViewSignInPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/logo.png',height: MediaQuery.of(context).size.height/5.5,),
              SizedBox(height: MediaQuery.of(context).size.height/25,),
              Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/30,
                  left: MediaQuery.of(context).size.width/30,
                ),
                child: TextField(
                  controller: view.email,
                  style: GoogleFonts.openSans(fontSize: MediaQuery.of(context).size.height/45),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(MediaQuery.of(context).size.height/40),
                      hintText:'email',
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      hintStyle: GoogleFonts.openSans(fontSize: MediaQuery.of(context).size.height/45,color: Colors.grey),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/40,),
              Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/30,
                  left: MediaQuery.of(context).size.width/30,
                ),
                child: TextField(
                  controller: view.password,
                  style: GoogleFonts.openSans(fontSize: MediaQuery.of(context).size.height/45),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(MediaQuery.of(context).size.height/40),
                      hintText:'password',
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      hintStyle: GoogleFonts.openSans(fontSize: MediaQuery.of(context).size.height/45,color: Colors.grey),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/15,),
              GestureDetector(
                onTap: () {
                  view.signIn(context);
                },
                child: Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/30,
                    left: MediaQuery.of(context).size.width/30,
                  ),
                  height: MediaQuery.of(context).size.height/12,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green
                  ),
                  child: Center(
                    child: Text('LOG IN',style:  GoogleFonts.openSans(fontSize: MediaQuery.of(context).size.height/40,
                        color: Colors.white
                    ),),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",style: GoogleFonts.openSans(
                      fontSize: MediaQuery.of(context).size.height/45,
                      color: Colors.grey,fontWeight: FontWeight.bold
                  ),),
                  TextButton(
                    onPressed: (){
                      view.navigateToSignUpPage(context);
                    },
                    child: Text('SIGN UP',style:  GoogleFonts.openSans(
                        fontSize: MediaQuery.of(context).size.height/45,
                        color: Colors.black,fontWeight: FontWeight.w500
                    ),),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
