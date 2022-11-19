import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateScreen110 extends StatefulWidget {
  const DateScreen110({Key? key}) : super(key: key);

  @override
  State<DateScreen110> createState() => _DateScreen110State();
}

class _DateScreen110State extends State<DateScreen110> {
  //selectedDate
  //   - DatePicker에 선택된 일자
  //   - 보통 만난날은 시.분.초까지 계산하지 않고, 일수로만 계산한다.
  //   - 그래서 DateTime.now()로 하지 않고, 아래처럼 오늘일자에 시분초는 모두 0 이 되도록 한다.
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: Container(
            width: MediaQuery.of(context).size.width,
            //color: Colors.amber,
            child: Column(
              children: [
                _TopPart(
                  selectedDate: selectedDate,
                  onPressed: onHeartPressed,
                ),
                _BottomPart(),
              ],
            )),
      ),
    );
  }

  void onHeartPressed() {
    final DateTime now = DateTime.now();
    //showCupertinoDialog
    //  - barrierDismissible : Dialog 밖을 누르면 닫한다.
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300.0,
            //CupertinoDatePicker
            //  - initialDateTime : 초기 값
            //  - maximumDate : Picker에서 선택가능한 최대 일자
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate,
              maximumDate: DateTime(now.year, now.month, now.day),
              onDateTimeChanged: (DateTime value) {
                setState(() {
                  selectedDate = value;
                });
              },
            ),
          ),
        );
      },
    );
  }
}

// class _TopPart extends StatelessWidget {
//   const _TopPart({Key? key}) : super(key: key);

//   @override
//   State<_TopPart> createState() => _TopPartState();
// }

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  //IconButton의 onPressed 을 보면 typedef VoidCallback 으로 정의되어 있다.
  //  그래서 아래처럼 선언한다.
  final VoidCallback onPressed;
  _TopPart({required this.selectedDate, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'U&I',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'parisienne',
              fontSize: 80,
            ),
          ),
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                '우리 처음 만난날2',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sunflow',
                  fontSize: 30,
                ),
              ),
              Text(
                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'sunflow',
                  fontSize: 20,
                ),
              ),
            ],
          ),
          IconButton(
              iconSize: 60,
              onPressed: onPressed,
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              )),
          Text(
            'D+${DateTime(
                  now.year,
                  now.month,
                  now.day,
                ).difference(selectedDate).inDays + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'sunflow',
              fontSize: 50.0,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('asset/img/middle_image.png'));
  }
}
