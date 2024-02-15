class User{

   int? id;
  String ? nom;
  String ? prenom;
  String ? email;
  String ? adresse;
  String ? typeUser;
  String ? phone;
  String ? password;
  
 

  User({this.id, this.nom, this.prenom, this.email, this.adresse, this.typeUser, this.phone, this.password});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      typeUser:json['typeUser'],
      adresse: json['adresse'],
      phone: json['phone'],
      password: json["password"]
    );
  }
}