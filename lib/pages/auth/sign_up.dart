


import '../../export_libs/export_libs.dart';

class SignUpPage extends StatefulWidget {
  static const String id = 'signuppage';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  ViewSignUpPage view = ViewSignUpPage();
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
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height/35),
                  decoration: InputDecoration(
                    hintText:'email',
                    hintStyle: TextStyle(fontSize: MediaQuery.of(context).size.height/45,color: Colors.grey),
                    border: OutlineInputBorder(

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
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height/35),
                  decoration: InputDecoration(
                      hintText:'password',
                      hintStyle: TextStyle(fontSize: MediaQuery.of(context).size.height/45,color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/20,),
              Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/30,
                  left: MediaQuery.of(context).size.width/30,
                ),
                child: MaterialButton(
                  height: MediaQuery.of(context).size.height/12,
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onPressed: (){
                    view.signUp(context);
                  },
                  child: Text('SIGN UP',style: TextStyle(fontSize: MediaQuery.of(context).size.height/40,
                    color: Colors.white
                  ),),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?',style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height/40,
                    color: Colors.grey,fontWeight: FontWeight.bold
                  ),),
                  TextButton(
                    onPressed: (){
                      view.navigateToSignInPage(context);
                    },
                    child: Text('LOG IN',style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height/40,
                      color: Colors.black
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
