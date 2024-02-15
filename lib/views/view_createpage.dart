import '../export_libs/export_libs.dart';

class ViewCreatePage {
  var title = TextEditingController();
  var text = TextEditingController();

  void createNote(BuildContext context) {
    String titleController = title.text.toString().trim();
    String textController = text.text.toString().trim();

    if (titleController.isEmpty || textController.isEmpty) {
      return;
    } else {
      var time = DateTime.now();
      var day = time.day;
      var month = time.month;
      var year = time.year;
      var hour = time.hour;
      var minute = time.minute;

      String createdTime = '$day / $month / $year, $hour:$minute';

      var note = UserModel(titleController, textController, createdTime);
      RealtimeDatabase.addPost(note);
      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyPages()));
    }
  }
}
