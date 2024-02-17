class Reponse{

   int id, reclamationId, clientId;
  String message, dateMessage, heureMessage;
  int luMessage;
 

  Reponse({required this.id, required this.message, required this.dateMessage, required this.heureMessage, required this.reclamationId, required this.clientId, required this.luMessage});

  factory Reponse.fromJson(Map<String, dynamic> json){
    return Reponse(
      id: json['id'],
      message: json['message'],
      reclamationId: json['reclamation_id'],
      clientId: json["client_id"],
      luMessage:json['lu_message'],
      dateMessage:json['date_message'],
      heureMessage:json['heure_message'],
    );
  }
}