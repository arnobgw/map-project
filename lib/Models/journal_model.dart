class Journal {
  String id;
  String userEmail;
  String title;
  String text;
  String userName;

  Journal({this.id, this.userEmail, this.title, this.text, this.userName});
  Journal.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'].toString(),
            userEmail: json['userEmail'],
            title: json['title'],
            text: json['text'],
            userName: json['userName']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'userEmail': userEmail, 'title': title, 'text': text, 'userName': userName};
}
