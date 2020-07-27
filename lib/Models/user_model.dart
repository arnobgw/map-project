class User {
  String id;
  String name;
  String email;
  String password;
  int cost;
  int budget;

  User({this.id, this.name, this.email, this.password, this.cost, this.budget});
  User.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'].toString(),
            name: json['name'],
            email: json['email'],
            password: json['password'],
            cost: json['cost'],
            budget: json['budget']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'email': email, 'password': password, 'cost': cost, 'budget': budget};
}
