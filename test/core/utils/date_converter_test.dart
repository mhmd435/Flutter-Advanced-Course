
import 'package:flutter_advanced_course/core/utils/date_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group('changeDtToDateTime test', () {
    test('should be return ---Aug 10---', (){
      var result = DateConverter.changeDtToDateTime(1660127867);
      expect(result, "Aug 10");
    });

    test('should be return ---Jan 27---', () {
      var result = DateConverter.changeDtToDateTime(16601278673);
      expect(result, "Jan 27");
    });

    test('should be return ---Apr 6---', () {
      var result = DateConverter.changeDtToDateTime(166012786);
      expect(result, "Apr 6");
    });
  });


  group('changeDtToDateTimeHour test', () {

    test('should be return ---10:39 AM---', () {
      var result = DateConverter.changeDtToDateTimeHour(166012786, 0);
      expect(result, "10:39 AM");
    });

    test(' should be return ---11:39 AM--', () {
      var result = DateConverter.changeDtToDateTimeHour(166012786, 3600);
      expect(result, "11:39 AM");
    });

    test(' should be return ---12:16 PM---', () {
      var result = DateConverter.changeDtToDateTimeHour(16601278611, 7200);
      expect(result, "12:16 PM");
    });
  });

}