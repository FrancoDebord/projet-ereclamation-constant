class Reclamation{

   int id;
   int clientId;
  String objet;
  String description;
  String statutReclam;
  String createdAt;

  Reclamation({required this.id, required this.objet, required this.description, required this.statutReclam, required this.clientId, required this.createdAt});

  factory Reclamation.fromJson(Map<String, dynamic> json){
    return Reclamation(
      id: json['id'],
      objet: json['objet'],
      description: json['description'],
      statutReclam: json['statut_reclam'],
      clientId: json['client_id'],
      createdAt: json['created_at'],
    );
  }
}