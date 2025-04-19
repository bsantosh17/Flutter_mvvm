/// success : true
/// total_photos : 132
/// message : "Successfully fetched 10 of 132 photos"
/// offset : 0
/// limit : 10
/// photos : [{"url":"https://api.slingacademy.com/public/sample-photos/1.jpeg","title":"Defense the travel audience hand","user":28,"description":"Leader structure safe or black late wife newspaper her pick central forget single likely.","id":1},{"url":"https://api.slingacademy.com/public/sample-photos/2.jpeg","title":"Space build policy people model treatment town hard use","user":25,"description":"Much technology how within rather him lay why part actually system increase feel.","id":2},{"url":"https://api.slingacademy.com/public/sample-photos/3.jpeg","title":"Party about different guess bill too owner","user":7,"description":"Street anything piece south yard since well point summer school economy respond people mother.","id":3},{"url":"https://api.slingacademy.com/public/sample-photos/4.jpeg","title":"Table husband","user":22,"description":"Skill drug college contain herself future seat human yes approach how then maybe public summer play commercial anything woman include million body measure government clearly question quickly parent.","id":4},{"url":"https://api.slingacademy.com/public/sample-photos/5.jpeg","title":"Support audience model program three music","user":25,"description":"World early north TV around meet goal across reason responsibility have must build up some language soon.","id":5},{"url":"https://api.slingacademy.com/public/sample-photos/6.jpeg","title":"Apply future response she reduce decide","user":30,"description":"Training beautiful age four skin cultural hundred environmental ability blood go physical relate produce tough open police.","id":6},{"url":"https://api.slingacademy.com/public/sample-photos/7.jpeg","title":"Fire year candidate too like","user":20,"description":"Few address take for special development white career.","id":7},{"url":"https://api.slingacademy.com/public/sample-photos/8.jpeg","title":"Reflect design camera land girl wind behind side","user":13,"description":"Drug if approach out according set home job company wall source trouble act huge easy style physical so month.","id":8},{"url":"https://api.slingacademy.com/public/sample-photos/9.jpeg","title":"Per nature research","user":2,"description":"Nature focus wonder behind magazine pattern degree far without tree consider.","id":9},{"url":"https://api.slingacademy.com/public/sample-photos/10.jpeg","title":"Yard","user":30,"description":"Parent talk collection fill between management purpose fish fight real teacher successful me arrive little.","id":10}]

class SettingPhoto {
  SettingPhoto({
      bool? success, 
      num? totalPhotos, 
      String? message, 
      num? offset, 
      num? limit, 
      List<Photos>? photos,}){
    _success = success;
    _totalPhotos = totalPhotos;
    _message = message;
    _offset = offset;
    _limit = limit;
    _photos = photos;
}

  SettingPhoto.fromJson(dynamic json) {
    _success = json['success'];
    _totalPhotos = json['total_photos'];
    _message = json['message'];
    _offset = json['offset'];
    _limit = json['limit'];
    if (json['photos'] != null) {
      _photos = [];
      json['photos'].forEach((v) {
        _photos?.add(Photos.fromJson(v));
      });
    }
  }
  bool? _success;
  num? _totalPhotos;
  String? _message;
  num? _offset;
  num? _limit;
  List<Photos>? _photos;
SettingPhoto copyWith({  bool? success,
  num? totalPhotos,
  String? message,
  num? offset,
  num? limit,
  List<Photos>? photos,
}) => SettingPhoto(  success: success ?? _success,
  totalPhotos: totalPhotos ?? _totalPhotos,
  message: message ?? _message,
  offset: offset ?? _offset,
  limit: limit ?? _limit,
  photos: photos ?? _photos,
);
  bool? get success => _success;
  num? get totalPhotos => _totalPhotos;
  String? get message => _message;
  num? get offset => _offset;
  num? get limit => _limit;
  List<Photos>? get photos => _photos;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['total_photos'] = _totalPhotos;
    map['message'] = _message;
    map['offset'] = _offset;
    map['limit'] = _limit;
    if (_photos != null) {
      map['photos'] = _photos?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// url : "https://api.slingacademy.com/public/sample-photos/1.jpeg"
/// title : "Defense the travel audience hand"
/// user : 28
/// description : "Leader structure safe or black late wife newspaper her pick central forget single likely."
/// id : 1

class Photos {
  Photos({
      String? url, 
      String? title, 
      num? user, 
      String? description, 
      num? id,}){
    _url = url;
    _title = title;
    _user = user;
    _description = description;
    _id = id;
}

  Photos.fromJson(dynamic json) {
    _url = json['url'];
    _title = json['title'];
    _user = json['user'];
    _description = json['description'];
    _id = json['id'];
  }
  String? _url;
  String? _title;
  num? _user;
  String? _description;
  num? _id;
Photos copyWith({  String? url,
  String? title,
  num? user,
  String? description,
  num? id,
}) => Photos(  url: url ?? _url,
  title: title ?? _title,
  user: user ?? _user,
  description: description ?? _description,
  id: id ?? _id,
);
  String? get url => _url;
  String? get title => _title;
  num? get user => _user;
  String? get description => _description;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['title'] = _title;
    map['user'] = _user;
    map['description'] = _description;
    map['id'] = _id;
    return map;
  }

}