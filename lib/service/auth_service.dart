



// class Auth2 {
//   static final _auth = FirebaseAuth.instance;
//
//   static bool isLoggedin(){
//     final User? fireUser = _auth.currentUser;
//     return fireUser != null;
//   }
//   static Future<User?> SignInUser(String email,String password,)async{
//     await _auth.signInWithEmailAndPassword(email: email, password: password);
//     final User fireUser = _auth.currentUser!;
//     return fireUser;
//   }
//
//
//   static Future<User?> SignUpUser({required String password,required String email})async{
//     try{
//       var result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       var user =result.user;
//       return user;
//     }catch(e){
//       print(e);
//     }
//     return null;
//   }
//
//
//   static void SignOutUser(BuildContext context){
//     _auth.signOut();
//
//   }
//   static  String currentUserId() {
//     final User? fireUser = _auth.currentUser;
//     return fireUser!.uid;
//   }
//   static  String? currentUserEmail() {
//     final User? fireUser = _auth.currentUser;
//     return fireUser!.email;
//   }
//
// }


import '../export_libs/export_libs.dart';

class Auth  {

  ///static late FirebaseAuth auth = FirebaseAuth.instance;
  static final app = Firebase.app();
  static FirebaseAuth auth = FirebaseAuth.instanceFor(app: app,persistence: Persistence.SESSION);

  static bool isLoggedin(){
    User? user = auth.currentUser;
    print(user?.email);
    return user!=null;
  }
  static Future<User?> SignInUser(String email,String password,)async{
    await auth.signInWithEmailAndPassword(email: email, password: password);
    final User fireUser = auth.currentUser!;
    return fireUser;
  }


  static Future<User?> SignUpUser({required String password,required String email})async{
    try{
      var result = await auth.createUserWithEmailAndPassword(email: email, password: password);

      var user =result.user;
      print("sign up user ${user?.email}");
      return user;
    }catch(e){
      print(e);
    }
    return null;
  }

  //Authication sign up
  // static  Future<User?> SignUpUser({required String password,required String email}) async {
  //   try {
  //     UserCredential userCredential = await auth
  //         .createUserWithEmailAndPassword(email: email, password: password);
  //     User? user = userCredential.user;
  //     return user;
  //   } catch (error) {
  //     if (kDebugMode) {
  //       print('Sign UP ***** => $error');
  //     }
  //     return null;
  //   }
  // }


  static void SignOutUser(BuildContext context){
    auth.signOut();

  }
  static  String currentUserId() {
    final User? fireUser = auth.currentUser;
    return fireUser!.uid;
  }
  static  String? currentUserEmail() {
    final User? fireUser = auth.currentUser;
    return fireUser!.email;
  }

}
