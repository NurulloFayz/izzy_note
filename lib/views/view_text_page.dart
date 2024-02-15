


import '../export_libs/export_libs.dart';

class ViewTextPage extends ChangeNotifier{
  var text = TextEditingController();
  var title = TextEditingController();
  final databaseReference = FirebaseDatabase.instance.ref();

  void updateNote(BuildContext context,  String noteId) {
    String updatedText = text.text;
    String updatedTitle = title.text;

    databaseReference.child(Auth.currentUserId()).child('notes').child(noteId).update({
      'text': updatedText,
      'title' : updatedTitle,
    });
    savedToast(context);
  }
}