



import '../export_libs/export_libs.dart';

class ViewCreatePage {

  var title = TextEditingController();
  var text = TextEditingController();
  static var time = DateTime.now();
  static var day = time.day;
  static var month = time.month;
  static var year = time.year;
  static var hour = time.hour;
  static var minute = time.minute;
  String createdTime = '$day / $month / $year, $hour:$minute';

  void createNote(BuildContext context) {
    String titleController = title.text.toString().trim();
    String textController = text.text.toString().trim();
    if(titleController.isEmpty || textController.isEmpty) {
      return;
    } else {
      var note = UserModel(titleController,textController,createdTime);
      RealtimeDatabase.addPost(note);
      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyPages()));
    }
  }
}