class ProfileRequest {
  String userName;
  String city;
  String story;
//  String image;
//  String date;
//  String dateAndTime;


  ProfileRequest({this.userName, this.city, this.story});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['userName'] = this.userName;
    data['city'] = this.city;
    data['story'] = this.story;
    data['image'] = 'sss';

    return data;
  }
}
