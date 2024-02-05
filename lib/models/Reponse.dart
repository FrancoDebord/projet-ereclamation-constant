class Reponse{

   int? id, reclamationId;
  String? message;
  bool? luMessage;
 

  Reponse({this.id, this.message, this.reclamationId, this.luMessage});

  factory Reponse.fromJson(Map<String, dynamic> json){
    return Reponse(
      id: json['id'],
      message: json['message'],
      reclamationId: json['reclamation_id'],
      luMessage:json['lu_message'],
    );
  }
}