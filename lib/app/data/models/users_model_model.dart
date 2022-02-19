class UsersModel {
  String? uid;
  String? email;
  String? name;
  String? about;
  int? age;
  String? gender;
  int? height;
  String? role;
  String? status;
  String? photoUrl;
  int? rating;
  int? patients;
  int? experience;
  int? weight;
  String? lastSignInTime;
  String? creationTime;
  String? updatedTime;

  UsersModel(
      {this.uid,
      this.email,
      this.name,
      this.about,
      this.age,
      this.gender,
      this.height,
      this.role,
      this.status,
      this.photoUrl,
      this.rating,
      this.patients,
      this.experience,
      this.weight,
      this.lastSignInTime,
      this.creationTime,
      this.updatedTime});

  UsersModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    name = json['name'];
    about = json['about'];
    age = json['age'];
    gender = json['gender'];
    height = json['height'];
    role = json['role'];
    status = json['status'];
    photoUrl = json['photoUrl'];
    rating = json['rating'];
    patients = json['patients'];
    experience = json['experience'];
    weight = json['weight'];
    lastSignInTime = json['lastSignInTime'];
    creationTime = json['creationTime'];
    updatedTime = json['updatedTime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['name'] = name;
    data['about'] = about;
    data['age'] = age;
    data['gender'] = gender;
    data['height'] = height;
    data['role'] = role;
    data['status'] = status;
    data['photoUrl'] = photoUrl;
    data['rating'] = rating;
    data['patients'] = patients;
    data['experience'] = experience;
    data['weight'] = weight;
    data['lastSignInTime'] = lastSignInTime;
    data['creationTime'] = creationTime;
    data['updatedTime'] = updatedTime;
    return data;
  }
}
