

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../export_libs/export_libs.dart';



class ViewHomePage extends ChangeNotifier{
  void bottomSheetProfile(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40)
              )
            ),
            height: MediaQuery.of(context).size.height/3.5,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/20,),
                ListTile(
                  leading: const Icon(Icons.mail,color: Colors.grey,),
                  title: Text('${Auth.currentUserEmail()}',style: GoogleFonts.openSans(
                      fontSize: MediaQuery.of(context).size.height/40,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                ListTile(
                  onTap: (){
                    signOutDialog(context);
                  },
                  leading: const Icon(Icons.logout,color: Colors.grey,),
                  title: Text('Log out',style:  GoogleFonts.openSans(
                      fontSize: MediaQuery.of(context).size.height/40,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ],
            ),
          );
        }
    );
  }

  void navigateToCreatePage(BuildContext context) {
    Navigator.pushNamed(context,CreatePage.id);
  }

  Query fetchData = FirebaseDatabase.instance.ref().child(Auth.currentUserId()).child('notes');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child(Auth.currentUserId()).child('notes');
  Widget notesList(BuildContext context,{required Map notes }){
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height/40,),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TextPage(notes['title'], notes['text'], notes['key'])));
          },
          child: Container(
            height: MediaQuery.of(context).size.height/9,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/40,
            left: MediaQuery.of(context).size.width/40,
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10,),color: Colors.grey.withOpacity(0.3)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width/40,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notes['title'],style: GoogleFonts.openSans(fontSize: MediaQuery.of(context).size.height/40,
                        color: Colors.black,fontWeight: FontWeight.bold
                        ),),
                        Text(notes['date'],style: GoogleFonts.openSans(fontSize: MediaQuery.of(context).size.height/55,
                            color: Colors.grey,fontWeight: FontWeight.w700
                        ),)
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: (){
                        showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Deleting note',style: GoogleFonts.openSans(
                                    fontSize: MediaQuery.of(context).size.height/35,fontWeight: FontWeight.bold
                                ),),
                                content: Text('Are you sure?',style: GoogleFonts.openSans(fontSize: MediaQuery.of(context).size.height/35,
                                ),),
                                actions: [
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text('No',style: GoogleFonts.openSans(fontSize: MediaQuery.of(context).size.height/40),),
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      reference.child(notes['key']).remove();
                                      Navigator.pop(context);
                                    },
                                    child: Text('Yes',style: GoogleFonts.openSans(fontSize: MediaQuery.of(context).size.height/40),),
                                  )
                                ],
                              );
                            }
                        );
                      },
                      icon: const Icon(Icons.delete),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}