


import '../export_libs/export_libs.dart';

class CreatePage extends StatefulWidget {
  static const String id = 'createpage';
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  ViewCreatePage view = ViewCreatePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: (){
              view.createNote(context);
            },
            child: Text('Save',style: TextStyle(
              fontSize: MediaQuery.of(context).size.height/40,
              color: Colors.black
            ),),
          ),

        ],
        title: Text('New note',style: TextStyle(
          fontSize: MediaQuery.of(context).size.height/40,
          color: Colors.grey,fontWeight: FontWeight.bold
        ),),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/30,),
          Container(
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/45,
              left: MediaQuery.of(context).size.width/45,
            ),
            child: TextField(
              maxLines: null,
              controller: view.title,
              inputFormatters: [
                LengthLimitingTextInputFormatter(30)
              ],
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height/35,
                fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(fontSize: MediaQuery.of(context).size.height/40),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/40,),
          Container(
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/45,
              left: MediaQuery.of(context).size.width/45,
            ),
            child: TextField(
              controller: view.text,
              maxLines: null,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height/35,),
              decoration: InputDecoration(
                hintText: 'Text',
                hintStyle: TextStyle(fontSize: MediaQuery.of(context).size.height/40),
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none),
              ),
            ),
          )
        ],
      ),
    );
  }
}
