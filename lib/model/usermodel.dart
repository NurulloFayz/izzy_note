

class UserModel {
  String? title;
  String? text;
  String? date;

  UserModel([this.title,this.text,this.date]);

  UserModel.fromJson(Map<String,dynamic> json )
      : title = json['title'],
         text = json['text'],
        date = json['date'];

  Map<String,dynamic> toJson() => {
    'title' : title,
    'text' : text,
    'date' : date,
  };
}