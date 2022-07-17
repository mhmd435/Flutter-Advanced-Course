import 'package:flutter_advanced_course/features/feature_weather/domain/entities/CurrentCityEntity.dart';

/// coord : {"lon":-122.08,"lat":37.39}
/// weather : [{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}]
/// base : "stations"
/// main : {"temp":282.55,"feels_like":281.86,"temp_min":280.37,"temp_max":284.26,"pressure":1023,"humidity":100}
/// visibility : 10000
/// wind : {"speed":1.5,"deg":350}
/// clouds : {"all":1}
/// dt : 1560350645
/// sys : {"type":1,"id":5122,"message":0.0139,"country":"US","sunrise":1560343627,"sunset":1560396563}
/// timezone : -25200
/// id : 420006353
/// name : "Mountain View"
/// cod : 200

class CurrentCityModel extends CurrentCityEntity{
  CurrentCityModel({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,}) : super(
    coord: coord,
    weather: weather,
    base: base,
    main: main,
    visibility: visibility,
    wind: wind,
    clouds: clouds,
    dt: dt,
    sys: sys,
    timezone: timezone,
    id: id,
    name: name,
    cod: cod
  );

  factory CurrentCityModel.fromJson(dynamic json) {
    List<Weather> weather = [];
    if (json['weather'] != null) {
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }

    return CurrentCityModel(
      coord: json['coord'] != null ? Coord.fromJson(json['coord']) : null,
      weather: weather,
      base: json['base'],
      main: json['main'] != null ? Main.fromJson(json['main']) : null,
      visibility: json['visibility'],
      wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
      clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null,
      dt: json['dt'],
      sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null,
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod']
    );
  }

}

/// type : 1
/// id : 5122
/// message : 0.0139
/// country : "US"
/// sunrise : 1560343627
/// sunset : 1560396563

class Sys {
  Sys({
      this.type, 
      this.id, 
      this.message, 
      this.country, 
      this.sunrise, 
      this.sunset,});

  Sys.fromJson(dynamic json) {
    type = json['type'];
    id = json['id'];
    message = json['message'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
  int? type;
  int? id;
  double? message;
  String? country;
  int? sunrise;
  int? sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['id'] = id;
    map['message'] = message;
    map['country'] = country;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }

}

/// all : 1

class Clouds {
  Clouds({
      this.all,});

  Clouds.fromJson(dynamic json) {
    all = json['all'];
  }
  int? all;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = all;
    return map;
  }

}

/// speed : 1.5
/// deg : 350

class Wind {
  Wind({
      this.speed, 
      this.deg,});

  Wind.fromJson(dynamic json) {
    speed = json['speed'];
    deg = json['deg'];
  }
  double? speed;
  int? deg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    return map;
  }

}

/// temp : 282.55
/// feels_like : 281.86
/// temp_min : 280.37
/// temp_max : 284.26
/// pressure : 1023
/// humidity : 100

class Main {
  Main({
      this.temp, 
      this.feelsLike, 
      this.tempMin, 
      this.tempMax, 
      this.pressure, 
      this.humidity,});

  Main.fromJson(dynamic json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    return map;
  }

}

/// id : 800
/// main : "Clear"
/// description : "clear sky"
/// icon : "01d"

class Weather {
  Weather({
      this.id, 
      this.main, 
      this.description, 
      this.icon,});

  Weather.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
  int? id;
  String? main;
  String? description;
  String? icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }

}

/// lon : -122.08
/// lat : 37.39

class Coord {
  Coord({
      this.lon, 
      this.lat,});

  Coord.fromJson(dynamic json) {
    lon = json['lon'];
    lat = json['lat'];
  }
  double? lon;
  double? lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }

}