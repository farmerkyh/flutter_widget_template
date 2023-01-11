import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

List<String> weekNm = ['일', '월', '화', '수', '목', '금', '토'];

/*
* @class  오늘 일자 얻기
* @param  format - 일자 format(-, /, .)
*/
String getToday({String format = ''}) {
  format = 'yyyy${format}MM${format}dd';

  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat(format); //'yyyy-MM-dd'
  var today = formatter.format(now);
  return today;
}

/*
* @class  일자에 대한 요일을 넘기기
* @param  ymd  : 요일을 구하고 싶은 문자형일자, null이면 오늘일자
* @param  type : return형(한글형, 숫자형요일)결정 구분자(han:한글형 요일,num:숫자형 요일)
* @return 한글형 또는 숫자형 요일
*/
dynamic getDayNm({String ymd = '', String type = 'han'}) {
  DateTime? now;

  if (ymd == '') {
    now = DateTime.now();
  } else {
    now = DateTime.parse(ymd);
  }

  initializeDateFormatting('ko_KR', null);

  var day = DateFormat('E', 'ko_KR').format(now);
  if (type == 'han') {
    return day;
  } else {
    return getDayNum(day);
  }
}

/*
* @class  문자형 요일을 숫자형 요일로 넘기기
* @return 숫자형 요일
*/
int getDayNum(String yo) {
  Map week = {'일': 0, '월': 1, '화': 2, '수': 3, '목': 4, '금': 5, '토': 6};

  int day = week[yo];
  return day;
}

/*
* @class 입력된 날짜에 OffSet 으로 지정된 만큼의 날짜를 더함
* @param ymd    - 'yyyyMMdd' 형태로 표현된 날짜.
* @param offSet - 날짜로부터 증가 감소값.
* @return 문자형 date
*/
String addDate(String ymd, int offSet) {
  DateTime dateTime1 = DateTime.parse(ymd);
  DateTime dateTime2 = dateTime1.add(Duration(days: offSet));

  DateFormat formatter = DateFormat('yyyyMMdd'); //'yyyy-MM-dd'
  return formatter.format(dateTime2);
}

/*
  * @class 첫날, 말일, 오늘 일자 얻기
  * @param type    - 첫날, 말일, 오늘 구분 (first:첫날, last:말일, today:오늘일자)
  *        ymd     - 'yyyyMMdd' 형태로 표현된 날짜.
  *        offSet  - 당월기준 증감월.
  *        rtnType - ymd, dd 형 return 구분
  * @return 문자형 date
  * @exam   getDay('first')                           -- 당월 1일 구하기
  *         getDay('last', ymd:'20221111',offSet:-1)  --202211월 기준 - 전월 말일
  *         getDay('last', ymd:'20221211',offSet: 1)  --202212월 기준 - 익월 말일
  */
dynamic getDay2(String type, {String ymd = '', int offSet = 0, String rtnType = 'ymd'}) {
  int year, month;

  if (type == 'today') {
    return getToday();
  }

  if (ymd == '') {
    DateTime now = DateTime.now();
    year = now.year;
    month = now.month;
  } else {
    year = int.parse(ymd.substring(0, 4));
    month = int.parse(ymd.substring(4, 6));
  }

  String rtnYmd;
  if (type == 'first') {
    rtnYmd = DateFormat('yyyyMMdd').format(DateTime(year, month + offSet, 1)); //1일
  } else {
    rtnYmd = DateFormat('yyyyMMdd').format(DateTime(year, month + 1 + offSet, 0)); //말일
  }

  if (rtnType == 'ymd') {
    return rtnYmd;
  } else {
    return int.parse(rtnYmd.substring(6, 8));
  }
}
