# 1. Overflow
### Widget overflow 및 size 특징으로 인한 Widget종류
 > 첫번째, child Widget들의 size가 커지면 scroll이 되거나, 안보이는 Widget들이 있다. overflow발생안함.
 > 두번째, child Widget들의 size가 화면보다 커지면 같이 커지는 Widget들이 있다. overflow발생.
 > 세번째, 위 두가지는 Widget본인의 성격에 의해 정해진 특징이다.
 >        하지만 본인 성격도 중요하지만 Parent Widget성격에 따라가는 경우도 있다.
 >        즉, parent가 overflow발생할 수 있는 Widget이면 child가 scroll기능이 있어도 overflow가 발생한다.
 
 - 첫번째 종류 : Scaffold(?), Text, Container
 - 두번째 종류 : Column, Expanded,
 - 세번째 종류 : [Column + ListView]

# 2. Scaffold + Text
 - Scaffold child에는 어떤 Widget이 와도 overflow가 발생하지 않는다.
 - scroll 되는  Widget은 아니다.

 - Scaffold + Text
 > Scaffold 안에 Text를 overflow가 발생하도록 넣어 본다. 하지만 발생하지 않는다.
 > Scaffold는 자체적으로 scroll기능은 없지만, child Widget의 최대 size보다 커지지는 않는다.

<img src="./README_images/association_100_1.png" height="500">




scaffold_text_100_1.png

# 1. ListView association
### 1. Column + ListView 포함시키기 예문
##### 예문 1 (Column + ListView)
```dart
    child: Column(
      children: [
        ListView.builder(
        itemCount: 40,
        itemBuilder: (BuildContext context, int index) {
            return const Text('ListView List');
        },
        ),
      ],
    ),
```
 - 실행결과
 > The following assertion was thrown during performResize.
 > Vertical viewport was given unbounded height.
 > (세로 뷰포트에 제한 없는 높이가 지정되었습니다.)
 
 - 이유
 > Column 특징 : Column문서 확인
 > 기본적으로 ListView.builder는 독립적으로 사용 시 자동 scroll 되어 overflow 오류가 나지 않는다. 
 > 하지만 Column children으로 ListView가 포함 될 경우에는 Column Widget의 특징에 종속 된다.

##### 예문 2 (Container + ListView)
 - 정상작동
 - 이유 : Container특성 때문
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/area_widget/README.md

##### 예문 3 (SizedBox + ListView)
 - 정상작동
 - 이유 : SizedBox특성 때문
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/area_widget/README.md

##### 예문 4 (Expanded + ListView)
 - 오류
 - 이유 : Expanded특성 때문
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/area_widget/README.md


