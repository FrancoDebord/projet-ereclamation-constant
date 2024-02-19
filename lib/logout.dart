class Logout {

  String email;
  String token;
  
 

  Logout({required this.email, required this.token});
  factory Logout.fromJson(Map<String, dynamic> json){
    return Logout(
      email: json['email'],
      token: json['token']);
  }
}