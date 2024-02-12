class Reponse{

   int id, reclamationId;
  String message;
  bool luMessage;
 

  Reponse({required this.id, required this.message, required this.reclamationId, required this.luMessage});

  factory Reponse.fromJson(Map<String, dynamic> json){
    return Reponse(
      id: json['id'],
      message: json['message'],
      reclamationId: json['reclamation_id'],
      luMessage:json['lu_message'],
    );
  }
}