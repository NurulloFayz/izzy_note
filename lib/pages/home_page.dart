


import '../export_libs/export_libs.dart';

class HomePage extends StatefulWidget {
  static const String id = 'homepage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ViewHomePage view = ViewHomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            view.bottomSheetProfile(context);
          },
          icon: const Icon(Icons.person_outlined),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: (){
                view.navigateToCreatePage(context);
              },
              icon: Icon(Icons.create_rounded,color: Colors.black,size: MediaQuery.of(context).size.height/35,),
            )
          ],
        ),
      ),
      body: ChangeNotifierProvider(
        create: (ctx) => view,
        child: Consumer<ViewHomePage>(
          builder: (context,view,index) =>
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width/20,),
                      Text('Notes',style: TextStyle(fontSize: MediaQuery.of(context).size.height/14,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      child: StreamBuilder(
                        stream: view.fetchData.onValue,
                        builder: (ctx,snapshot) {
                          if(!snapshot.hasData) {
                            return const Center(child: CircularProgressIndicator(),);
                          }
                          else if(snapshot.data?.snapshot.value == null) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('images/sticky-notes.png',height: MediaQuery.of(context).size.height/7,),
                                  SizedBox(height: MediaQuery.of(context).size.height/30,),
                                  Text('No notes',style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height/40,fontWeight: FontWeight.bold,
                                    color: Colors.grey
                                  ),),
                                ],
                              ),
                            );
                          } else {
                            return FirebaseAnimatedList(
                              query: view.fetchData,
                              itemBuilder: (BuildContext ctx,DataSnapshot snap,Animation<double> anm,int index) {
                                Map notes = snap.value as Map;
                                notes['key'] = snap.key;
                                return view.notesList(context, notes:notes);
                              },
                            );
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
        ),
      )
    );
  }
}
