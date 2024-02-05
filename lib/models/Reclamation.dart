class Reclamation{

   int? id, clientId;
  String? objet, description;
  bool? statutReclam;

  Reclamation({this.id, this.objet, this.description, this.statutReclam, this.clientId});

  factory Reclamation.fromJson(Map<String, dynamic> json){
    return Reclamation(
      id: json['id'],
      objet: json['objet'],
      description: json['description'],
      statutReclam: json['statut_reclam'],
      clientId: json['client_id'],
    );
  }
}