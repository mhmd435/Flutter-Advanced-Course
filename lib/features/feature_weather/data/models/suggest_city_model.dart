
import '../../domain/entities/suggest_city_entity.dart';

/// data : [{"id":58764,"wikiDataId":"Q605157","type":"CITY","city":"Babol","name":"Babol","country":"Iran","countryCode":"IR","region":"Mazandaran","regionCode":"21","latitude":36.55,"longitude":52.683333333,"population":250217}]
/// metadata : {"currentOffset":0,"totalCount":1}

class SuggestCityModel extends SuggestCityEntity{
  SuggestCityModel({
      List<Data>? data, 
      Metadata? metadata,}) : super(
    data: data,
    metadata: metadata
  );

  factory SuggestCityModel.fromJson(dynamic json) {
    /// parse json to object
    List<Data> data = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }

    return SuggestCityModel(
      data: data,
      metadata: json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null,
    );
  }
}

/// currentOffset : 0
/// totalCount : 1

class Metadata {
  Metadata({
      int? currentOffset, 
      int? totalCount,}){
    _currentOffset = currentOffset;
    _totalCount = totalCount;
}

  Metadata.fromJson(dynamic json) {
    _currentOffset = json['currentOffset'];
    _totalCount = json['totalCount'];
  }
  int? _currentOffset;
  int? _totalCount;

  int? get currentOffset => _currentOffset;
  int? get totalCount => _totalCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentOffset'] = _currentOffset;
    map['totalCount'] = _totalCount;
    return map;
  }

}

/// id : 58764
/// wikiDataId : "Q605157"
/// type : "CITY"
/// city : "Babol"
/// name : "Babol"
/// country : "Iran"
/// countryCode : "IR"
/// region : "Mazandaran"
/// regionCode : "21"
/// latitude : 36.55
/// longitude : 52.683333333
/// population : 250217

class Data {
  Data({
      int? id, 
      String? wikiDataId, 
      String? type, 
      String? city, 
      String? name, 
      String? country, 
      String? countryCode, 
      String? region, 
      String? regionCode, 
      double? latitude, 
      double? longitude, 
      int? population,}){
    _id = id;
    _wikiDataId = wikiDataId;
    _type = type;
    _city = city;
    _name = name;
    _country = country;
    _countryCode = countryCode;
    _region = region;
    _regionCode = regionCode;
    _latitude = latitude;
    _longitude = longitude;
    _population = population;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _wikiDataId = json['wikiDataId'];
    _type = json['type'];
    _city = json['city'];
    _name = json['name'];
    _country = json['country'];
    _countryCode = json['countryCode'];
    _region = json['region'];
    _regionCode = json['regionCode'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _population = json['population'];
  }
  int? _id;
  String? _wikiDataId;
  String? _type;
  String? _city;
  String? _name;
  String? _country;
  String? _countryCode;
  String? _region;
  String? _regionCode;
  double? _latitude;
  double? _longitude;
  int? _population;

  int? get id => _id;
  String? get wikiDataId => _wikiDataId;
  String? get type => _type;
  String? get city => _city;
  String? get name => _name;
  String? get country => _country;
  String? get countryCode => _countryCode;
  String? get region => _region;
  String? get regionCode => _regionCode;
  double? get latitude => _latitude;
  double? get longitude => _longitude;
  int? get population => _population;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['wikiDataId'] = _wikiDataId;
    map['type'] = _type;
    map['city'] = _city;
    map['name'] = _name;
    map['country'] = _country;
    map['countryCode'] = _countryCode;
    map['region'] = _region;
    map['regionCode'] = _regionCode;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['population'] = _population;
    return map;
  }

}