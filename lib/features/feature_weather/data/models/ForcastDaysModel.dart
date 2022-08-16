
import '../../domain/entities/forecase_days_entity.dart';

/// lat : 51.4215
/// lon : 35.6944
/// timezone : "Europe/Moscow"
/// timezone_offset : 10800
/// current : {"dt":1654413279,"sunrise":1654392221,"sunset":1654451279,"temp":20.73,"feels_like":20.58,"pressure":1017,"humidity":66,"dew_point":14.15,"uvi":3.4,"clouds":99,"visibility":10000,"wind_speed":1.84,"wind_deg":31,"wind_gust":2.13,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}]}
/// daily : [{"dt":1654419600,"sunrise":1654392221,"sunset":1654451279,"moonrise":1654410000,"moonset":1654379580,"moon_phase":0.18,"temp":{"day":20.35,"min":11.73,"max":20.73,"night":12.1,"eve":17.87,"morn":15.13},"feels_like":{"day":20.09,"night":11.72,"eve":17.72,"morn":14.76},"pressure":1017,"humidity":63,"dew_point":13.08,"wind_speed":4.41,"wind_deg":2,"wind_gust":5.18,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":99,"pop":0.73,"rain":0.95,"uvi":5.32},{"dt":1654506000,"sunrise":1654478586,"sunset":1654537735,"moonrise":1654500780,"moonset":1654467240,"moon_phase":0.21,"temp":{"day":18.65,"min":9.55,"max":19.81,"night":12.28,"eve":18.85,"morn":10.73},"feels_like":{"day":18.19,"night":11.73,"eve":18.62,"morn":10.23},"pressure":1019,"humidity":62,"dew_point":11.28,"wind_speed":5.31,"wind_deg":4,"wind_gust":6.93,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"clouds":0,"pop":0,"uvi":6.67},{"dt":1654592400,"sunrise":1654564953,"sunset":1654624188,"moonrise":1654591620,"moonset":1654554660,"moon_phase":0.25,"temp":{"day":20.42,"min":11.15,"max":21.1,"night":12.97,"eve":18.82,"morn":12.69},"feels_like":{"day":20.06,"night":12.52,"eve":18.69,"morn":12.23},"pressure":1019,"humidity":59,"dew_point":12.21,"wind_speed":2.95,"wind_deg":352,"wind_gust":3.25,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}],"clouds":76,"pop":0,"uvi":6.28},{"dt":1654678800,"sunrise":1654651324,"sunset":1654710639,"moonrise":1654682460,"moonset":1654641900,"moon_phase":0.27,"temp":{"day":20.58,"min":11.34,"max":21.6,"night":17.1,"eve":20.15,"morn":13.16},"feels_like":{"day":20.23,"night":16.72,"eve":20,"morn":12.75},"pressure":1020,"humidity":59,"dew_point":12.3,"wind_speed":2.22,"wind_deg":90,"wind_gust":2.44,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"clouds":0,"pop":0,"uvi":6.74},{"dt":1654765200,"sunrise":1654737697,"sunset":1654797088,"moonrise":1654773480,"moonset":1654729080,"moon_phase":0.31,"temp":{"day":21.12,"min":13.27,"max":21.57,"night":16.51,"eve":19.97,"morn":13.62},"feels_like":{"day":20.78,"night":16.15,"eve":19.9,"morn":13.13},"pressure":1018,"humidity":57,"dew_point":12.44,"wind_speed":2.43,"wind_deg":162,"wind_gust":2.97,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"clouds":4,"pop":0,"uvi":6.28},{"dt":1654851600,"sunrise":1654824074,"sunset":1654883534,"moonrise":1654864740,"moonset":1654816320,"moon_phase":0.34,"temp":{"day":22.05,"min":15.18,"max":22.11,"night":18.26,"eve":20.73,"morn":16.02},"feels_like":{"day":21.75,"night":17.81,"eve":20.66,"morn":15.71},"pressure":1018,"humidity":55,"dew_point":12.85,"wind_speed":2.09,"wind_deg":126,"wind_gust":1.81,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"clouds":99,"pop":0,"uvi":7},{"dt":1654938000,"sunrise":1654910453,"sunset":1654969977,"moonrise":1654956180,"moonset":1654903620,"moon_phase":0.38,"temp":{"day":23.54,"min":17.4,"max":24.31,"night":18.56,"eve":23.85,"morn":17.4},"feels_like":{"day":23.31,"night":18.53,"eve":24.04,"morn":16.95},"pressure":1018,"humidity":52,"dew_point":13.17,"wind_speed":2.35,"wind_deg":292,"wind_gust":3.12,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"clouds":2,"pop":0.2,"uvi":7},{"dt":1655024400,"sunrise":1654996836,"sunset":1655056418,"moonrise":1655047980,"moonset":1654991100,"moon_phase":0.42,"temp":{"day":23.18,"min":15.56,"max":23.64,"night":16.91,"eve":22.57,"morn":16.44},"feels_like":{"day":23.12,"night":16.67,"eve":22.66,"morn":16.57},"pressure":1016,"humidity":60,"dew_point":15.09,"wind_speed":4.04,"wind_deg":339,"wind_gust":4.82,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"clouds":1,"pop":0.12,"uvi":7}]
/// alerts : [{"sender_name":"","event":"Thunderstorms","start":1654408800,"end":1654452000,"description":"","tags":["Thunderstorm"]},{"sender_name":"","event":"Гроза","start":1654408800,"end":1654452000,"description":"местами гроза","tags":["Thunderstorm"]}]

class ForecastDaysModel extends ForecastDaysEntity{
  ForecastDaysModel({
      double? lat, 
      double? lon, 
      String? timezone, 
      int? timezoneOffset, 
      Current? current, 
      List<Daily>? daily, 
      List<Alerts>? alerts,}) : super(
    lat: lat,
    lon: lon,
    timezone: timezone,
    timezoneOffset: timezoneOffset,
    current: current,
    daily: daily,
    alerts: alerts
  );

  factory ForecastDaysModel.fromJson(dynamic json) {

    /// convert daily from json
    List<Daily> daily = [];
    if (json['daily'] != null) {
      json['daily'].forEach((v) {
        daily.add(Daily.fromJson(v));
      });
    }

    /// convert alerts from json
    List<Alerts> alerts = [];
    if (json['alerts'] != null) {
      json['alerts'].forEach((v) {
        alerts.add(Alerts.fromJson(v));
      });
    }

    return ForecastDaysModel(
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
      timezone: json['timezone'],
      timezoneOffset: json['timezone_offset'],
      current: json['current'] != null ? Current.fromJson(json['current']) : null,
      daily: daily,
      alerts: alerts
    );


  }

}

/// sender_name : ""
/// event : "Thunderstorms"
/// start : 1654408800
/// end : 1654452000
/// description : ""
/// tags : ["Thunderstorm"]

class Alerts {
  Alerts({
      String? senderName, 
      String? event, 
      int? start, 
      int? end, 
      String? description, 
      List<String>? tags,}){
    _senderName = senderName;
    _event = event;
    _start = start;
    _end = end;
    _description = description;
    _tags = tags;
}

  Alerts.fromJson(dynamic json) {
    _senderName = json['sender_name'];
    _event = json['event'];
    _start = json['start'];
    _end = json['end'];
    _description = json['description'];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
  }
  String? _senderName;
  String? _event;
  int? _start;
  int? _end;
  String? _description;
  List<String>? _tags;

  String? get senderName => _senderName;
  String? get event => _event;
  int? get start => _start;
  int? get end => _end;
  String? get description => _description;
  List<String>? get tags => _tags;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sender_name'] = _senderName;
    map['event'] = _event;
    map['start'] = _start;
    map['end'] = _end;
    map['description'] = _description;
    map['tags'] = _tags;
    return map;
  }

}

/// dt : 1654419600
/// sunrise : 1654392221
/// sunset : 1654451279
/// moonrise : 1654410000
/// moonset : 1654379580
/// moon_phase : 0.18
/// temp : {"day":20.35,"min":11.73,"max":20.73,"night":12.1,"eve":17.87,"morn":15.13}
/// feels_like : {"day":20.09,"night":11.72,"eve":17.72,"morn":14.76}
/// pressure : 1017
/// humidity : 63
/// dew_point : 13.08
/// wind_speed : 4.41
/// wind_deg : 2
/// wind_gust : 5.18
/// weather : [{"id":500,"main":"Rain","description":"light rain","icon":"10d"}]
/// clouds : 99
/// pop : 0.73
/// rain : 0.95
/// uvi : 5.32

class Daily {
  Daily({
      int? dt,
      int? sunrise,
      int? sunset,
      int? moonrise, 
      int? moonset, 
      double? moonPhase, 
      Temp? temp, 
      Feels_like? feelsLike, 
      int? pressure, 
      int? humidity, 
      double? dewPoint, 
      double? windSpeed, 
      int? windDeg, 
      double? windGust, 
      List<Weather>? weather, 
      int? clouds, 
      double? pop, 
      double? rain, 
      double? uvi,}){
    _dt = dt;
    _sunrise = sunrise;
    _sunset = sunset;
    _moonrise = moonrise;
    _moonset = moonset;
    _moonPhase = moonPhase;
    _temp = temp;
    _feelsLike = feelsLike;
    _pressure = pressure;
    _humidity = humidity;
    _dewPoint = dewPoint;
    _windSpeed = windSpeed;
    _windDeg = windDeg;
    _windGust = windGust;
    _weather = weather;
    _clouds = clouds;
    _pop = pop;
    _rain = rain;
    _uvi = uvi;
}

  Daily.fromJson(dynamic json) {
    _dt = json['dt'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
    _moonrise = json['moonrise'];
    _moonset = json['moonset'];
    _moonPhase = json['moon_phase'].toDouble();
    _temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    _feelsLike = json['feels_like'] != null ? Feels_like.fromJson(json['feels_like']) : null;

    _pressure = json['pressure'];

    _humidity = json['humidity'];
    _dewPoint = json['dew_point'].toDouble();

    _windSpeed = json['wind_speed'].toDouble();
    _windDeg = json['wind_deg'];
    _windGust = json['wind_gust'].toDouble();
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
    _clouds = json['clouds'];
    // _pop = json['pop'].toDouble();
    // _rain = json['rain'].toDouble();
    // _uvi = json['uvi'].toDouble();
  }
  int? _dt;
  int? _sunrise;
  int? _sunset;
  int? _moonrise;
  int? _moonset;
  double? _moonPhase;
  Temp? _temp;
  Feels_like? _feelsLike;
  int? _pressure;
  int? _humidity;
  double? _dewPoint;
  double? _windSpeed;
  int? _windDeg;
  double? _windGust;
  List<Weather>? _weather;
  int? _clouds;
  double? _pop;
  double? _rain;
  double? _uvi;

  int? get dt => _dt;
  int? get sunrise => _sunrise;
  int? get sunset => _sunset;
  int? get moonrise => _moonrise;
  int? get moonset => _moonset;
  double? get moonPhase => _moonPhase;
  Temp? get temp => _temp;
  Feels_like? get feelsLike => _feelsLike;
  int? get pressure => _pressure;
  int? get humidity => _humidity;
  double? get dewPoint => _dewPoint;
  double? get windSpeed => _windSpeed;
  int? get windDeg => _windDeg;
  double? get windGust => _windGust;
  List<Weather>? get weather => _weather;
  int? get clouds => _clouds;
  double? get pop => _pop;
  double? get rain => _rain;
  double? get uvi => _uvi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = _dt;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    map['moonrise'] = _moonrise;
    map['moonset'] = _moonset;
    map['moon_phase'] = _moonPhase;
    if (_temp != null) {
      map['temp'] = _temp?.toJson();
    }
    if (_feelsLike != null) {
      map['feels_like'] = _feelsLike?.toJson();
    }
    map['pressure'] = _pressure;
    map['humidity'] = _humidity;
    // map['dew_point'] = _dewPoint;
    map['wind_speed'] = _windSpeed;
    map['wind_deg'] = _windDeg;
    map['wind_gust'] = _windGust;
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    map['clouds'] = _clouds;
    map['pop'] = _pop;
    map['rain'] = _rain;
    map['uvi'] = _uvi;
    return map;
  }

}

/// id : 500
/// main : "Rain"
/// description : "light rain"
/// icon : "10d"

class Weather {
  Weather({
      int? id, 
      String? main, 
      String? description, 
      String? icon,}){
    _id = id;
    _main = main;
    _description = description;
    _icon = icon;
}

  Weather.fromJson(dynamic json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }
  int? _id;
  String? _main;
  String? _description;
  String? _icon;

  int? get id => _id;
  String? get main => _main;
  String? get description => _description;
  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['main'] = _main;
    map['description'] = _description;
    map['icon'] = _icon;
    return map;
  }

}

/// day : 20.09
/// night : 11.72
/// eve : 17.72
/// morn : 14.76

class Feels_like {
  Feels_like({
      double? day, 
      double? night, 
      double? eve, 
      double? morn,}){
    _day = day;
    _night = night;
    _eve = eve;
    _morn = morn;
}

  Feels_like.fromJson(dynamic json) {
    _day = json['day'].toDouble();
    _night = json['night'].toDouble();
    _eve = json['eve'].toDouble();
    _morn = json['morn'].toDouble();
  }
  double? _day;
  double? _night;
  double? _eve;
  double? _morn;

  double? get day => _day;
  double? get night => _night;
  double? get eve => _eve;
  double? get morn => _morn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = _day;
    map['night'] = _night;
    map['eve'] = _eve;
    map['morn'] = _morn;
    return map;
  }

}

/// day : 20.35
/// min : 11.73
/// max : 20.73
/// night : 12.1
/// eve : 17.87
/// morn : 15.13

class Temp {
  Temp({
      double? day, 
      double? min, 
      double? max, 
      double? night, 
      double? eve, 
      double? morn,}){
    _day = day;
    _min = min;
    _max = max;
    _night = night;
    _eve = eve;
    _morn = morn;
}

  Temp.fromJson(dynamic json) {
    _day = json['day'].toDouble();
    _min = json['min'].toDouble();
    _max = json['max'].toDouble();
    _night = json['night'].toDouble();
    _eve = json['eve'].toDouble();
    _morn = json['morn'].toDouble();
  }
  double? _day;
  double? _min;
  double? _max;
  double? _night;
  double? _eve;
  double? _morn;

  double? get day => _day;
  double? get min => _min;
  double? get max => _max;
  double? get night => _night;
  double? get eve => _eve;
  double? get morn => _morn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = _day;
    map['min'] = _min;
    map['max'] = _max;
    map['night'] = _night;
    map['eve'] = _eve;
    map['morn'] = _morn;
    return map;
  }

}

/// dt : 1654413279
/// sunrise : 1654392221
/// sunset : 1654451279
/// temp : 20.73
/// feels_like : 20.58
/// pressure : 1017
/// humidity : 66
/// dew_point : 14.15
/// uvi : 3.4
/// clouds : 99
/// visibility : 10000
/// wind_speed : 1.84
/// wind_deg : 31
/// wind_gust : 2.13
/// weather : [{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}]

class Current {
  Current({
      int? dt,
      int? sunrise,
      int? sunset,
      double? temp, 
      double? feelsLike, 
      int? pressure, 
      int? humidity, 
      double? dewPoint, 
      double? uvi, 
      int? clouds, 
      int? visibility, 
      double? windSpeed, 
      int? windDeg, 
      double? windGust, 
      List<Weather>? weather,}){
    _dt = dt;
    _sunrise = sunrise;
    _sunset = sunset;
    _temp = temp;
    _feelsLike = feelsLike;
    _pressure = pressure;
    _humidity = humidity;
    _dewPoint = dewPoint;
    _uvi = uvi;
    _clouds = clouds;
    _visibility = visibility;
    _windSpeed = windSpeed;
    _windDeg = windDeg;
    _windGust = windGust;
    _weather = weather;
}

  Current.fromJson(dynamic json) {
    _dt = json['dt'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
    _temp = json['temp'].toDouble();
    _feelsLike = json['feels_like'].toDouble();

    _pressure = json['pressure'];
    _humidity = json['humidity'];
    _dewPoint = json['dew_point'].toDouble();
    _uvi = json['uvi'].toDouble();
    _clouds = json['clouds'];
    _visibility = json['visibility'];

    _windSpeed = json['wind_speed'].toDouble();
    _windDeg = json['wind_deg'];
    // _windGust = json['wind_gust'].toDouble() ?? 0;

    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }

  }
  int? _dt;
  int? _sunrise;
  int? _sunset;
  double? _temp;
  double? _feelsLike;
  int? _pressure;
  int? _humidity;
  double? _dewPoint;
  double? _uvi;
  int? _clouds;
  int? _visibility;
  double? _windSpeed;
  int? _windDeg;
  double? _windGust;
  List<Weather>? _weather;

  int? get dt => _dt;
  int? get sunrise => _sunrise;
  int? get sunset => _sunset;
  double? get temp => _temp;
  double? get feelsLike => _feelsLike;
  int? get pressure => _pressure;
  int? get humidity => _humidity;
  double? get dewPoint => _dewPoint;
  double? get uvi => _uvi;
  int? get clouds => _clouds;
  int? get visibility => _visibility;
  double? get windSpeed => _windSpeed;
  int? get windDeg => _windDeg;
  double? get windGust => _windGust;
  List<Weather>? get weather => _weather;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = _dt;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    map['temp'] = _temp;
    map['feels_like'] = _feelsLike;
    map['pressure'] = _pressure;
    map['humidity'] = _humidity;
    // map['dew_point'] = _dewPoint;
    map['uvi'] = _uvi;
    map['clouds'] = _clouds;
    map['visibility'] = _visibility;
    map['wind_speed'] = _windSpeed;
    map['wind_deg'] = _windDeg;
    map['wind_gust'] = _windGust;
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}