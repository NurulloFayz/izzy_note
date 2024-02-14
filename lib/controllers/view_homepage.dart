

import 'package:flutter/cupertino.dart';

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
                  title: Text('${Auth.currentUserEmail()}',style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height/40,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                ListTile(
                  onTap: (){
                    signOutDialog(context);
                  },
                  leading: const Icon(Icons.logout,color: Colors.grey,),
                  title: Text('Log out',style: TextStyle(
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
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => TextPage(notes['title'], notes['text'],
              notes['key']
            )));
          },
          child: Container(
            decoration: BoxDecoration(
              color:Colors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            height: MediaQuery.of(context).size.height/7,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/30,
            left: MediaQuery.of(context).size.width/30,
            ),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/60,),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width/30,),
                    Text(notes['title'],style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height/38,
                      fontWeight: FontWeight.bold
                    ),),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height/40,),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width/30,),
                    Text(notes['date'],style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height/45,
                      color: Colors.green,fontWeight: FontWeight.bold
                    ),),
                    const Spacer(),
                    IconButton(
                      onPressed: (){
                        showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Deleting note',style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height/35,fontWeight: FontWeight.bold
                                ),),
                                content: Text('Are you sure?',style: TextStyle(fontSize: MediaQuery.of(context).size.height/35,
                                ),),
                                actions: [
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text('No',style: TextStyle(fontSize: MediaQuery.of(context).size.height/40),),
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      reference.child(notes['key']).remove();
                                      Navigator.pop(context);
                                    },
                                    child: Text('Yes',style: TextStyle(fontSize: MediaQuery.of(context).size.height/40),),
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
        )
      ],
    );
  }
}