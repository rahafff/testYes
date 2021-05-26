class RegisterRequest {
  String userID;
  String password;
  String email;
  String userName;


  RegisterRequest({this.userID, this.password,this.email , this.userName});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    password = json['password'];
    email = json['email'];
    userName = json['userName'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['password'] = this.password;
    data['email'] = this.email;
    data['userName'] = this.userName;

    return data;
  }
}
