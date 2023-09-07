class ClasseModel {
  String? sId;
  String? nom;
  Responsable? responsable;
  String? createdAt;
  String? updatedAt;

  ClasseModel(
      {this.sId, this.nom, this.responsable, this.createdAt, this.updatedAt});

  ClasseModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nom = json['nom'];
    responsable = json['responsable'] != null
        ? new Responsable.fromJson(json['responsable'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nom'] = this.nom;
    if (this.responsable != null) {
      data['responsable'] = this.responsable!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Responsable {
  ContactInfo? contactInfo;
  String? sId;
  String? nom;
  String? prenom;
  String? adresse;
  String? dateEmbauche;
  String? username;
  String? password;
  String? createdAt;
  String? updatedAt;

  Responsable(
      {this.contactInfo,
      this.sId,
      this.nom,
      this.prenom,
      this.adresse,
      this.dateEmbauche,
      this.username,
      this.password,
      this.createdAt,
      this.updatedAt});

  Responsable.fromJson(Map<String, dynamic> json) {
    contactInfo = json['contact_info'] != null
        ? new ContactInfo.fromJson(json['contact_info'])
        : null;
    sId = json['_id'];
    nom = json['nom'];
    prenom = json['prenom'];
    adresse = json['adresse'];
    dateEmbauche = json['date_embauche'];
    username = json['username'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contactInfo != null) {
      data['contact_info'] = this.contactInfo!.toJson();
    }
    data['_id'] = this.sId;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['adresse'] = this.adresse;
    data['date_embauche'] = this.dateEmbauche;
    data['username'] = this.username;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class ContactInfo {
  List<String>? telephone;
  String? email;

  ContactInfo({this.telephone, this.email});

  ContactInfo.fromJson(Map<String, dynamic> json) {
    telephone = json['telephone'].cast<String>();
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['telephone'] = this.telephone;
    data['email'] = this.email;
    return data;
  }
}
