


import 'package:izzy_note/export_libs/export_libs.dart';

class RealtimeDatabase {
  static final database = FirebaseDatabase.instance.ref();

  //for Posts
  static Future<Stream<DatabaseEvent>?> addPost(UserModel userModel) async {
    database.child(Auth.currentUserId()).child('notes').push().set(userModel.toJson());
    return null;

  }
// static Future<List<ElonModel>?> getPost() async {
//   ElonModel model = ElonModel();
//   List<ElonModel> item = [];
//   Query query = database.ref.child('elon');
//   DatabaseEvent event = await query.once();
//   var snapshot = event.snapshot;
//   for (var child in snapshot.children) {
//     var jsonPost = jsonEncode(child.value);
//     Map<String, dynamic> map = jsonDecode(jsonPost);
//     var contacts = ElonModel(
//       model.jobPosition = map['jobPosition'],
//       model.jobLocation = map['jobLocation'],
//       model.employeerName = map['employeerName'],
//       model.requirements = map['requirements'],
//       model.salary = map['salary'],
//       model.time = map['time'],
//       model.contact = map['contact'],
//     );
//     item.add(contacts);
//   }
//   return item;
// }
// static Future<void> updateElon(String key, PostM updateElon) async {
//   await database
//       .child(Auth.currentUserId())
//       .child('elon')
//       .child(key)
//       .update(updateElon.toJson());
// }
//
// static Future<void> deleteElon(String key) async {
//   await database
//       .child('elon')
//       .child(key)
//       .remove();
// }
}