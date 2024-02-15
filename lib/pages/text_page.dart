


import '../export_libs/export_libs.dart';


class TextPage extends StatefulWidget {
  static const String id = 'textpage';
  const TextPage(this.title,this.text,this.noteId,{super.key});
  final String title;
  final String text;
  final String noteId;

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  ViewTextPage view = ViewTextPage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    view.text.text = widget.text;
    view.title.text = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: (){
              view.updateNote(context,widget.noteId);
            },
            child: Text('Save changes',style: TextStyle(
              fontSize: MediaQuery.of(context).size.height/40,
              color: Colors.green,fontWeight: FontWeight.bold
            ),),
          )
        ],
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/40,
              left: MediaQuery.of(context).size.width/40,
            ),
            child: TextField(
              controller: view.title,
              maxLines: null,
              inputFormatters: [
                LengthLimitingTextInputFormatter(30)
              ],
              style: TextStyle(fontSize: MediaQuery.of(context).size.height/35,color: Colors.grey,fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: MediaQuery.of(context).size.height/35,color: Colors.grey,fontWeight: FontWeight.bold),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/40,
            left: MediaQuery.of(context).size.width/40,
            ),
            child: TextField(
              controller: view.text,
              maxLines: null,
              style: TextStyle(fontSize: MediaQuery.of(context).size.height/35),
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: MediaQuery.of(context).size.height/35,),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )
              ),
            ),
          ),
        ],
      )
    );
  }
}
