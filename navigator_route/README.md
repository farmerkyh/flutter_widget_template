

### 소스코드 오류
   - 8-2 (todo_list프로젝트)
   - subDetail.dart 

# 1. Navigator 기본 문법
 - Stack, Queue 구조
<img src="./README_images/stack_queue_1.png">

1. Navigator는 스택(stack)을 이용해 페이지를 관리할 때 사용하는 클래스 이다.   
2. of(context) 함수는 현재 페이지를 나타낸다.   
3. push() 함수는 스택에 페이지를 쌓는 역할을 한다.   
4. push()함수에 전달한 MaterialPageRoute()함수는 머터리얼 스타일로 페이지를 이동하게 해준다.   
   - 페이지 이동시 animation효과   
   - 다음페이지 appbar에 뒤로가기 버튼 생성하기   
5. pop() 함수는 스택 메모리에서 맨 위에 있는 페이지를 제거한다.   

1. Route(라우터)는 통신에서 이동 경로를 의미하는 용어이다.   
   네트워크 프로그래밍에서는 요서청 URL을 해석해 정해진 경로로 이동하는 기능을 라우트라고 한다.   
   이러한 라우트 기능을 이용하면 페이지 이동 기능을 좀 더 편리하게 구현할 수 있다.   

1. pushReplacementNamed() : 스택메모리에있는 화면을 교체한다.   



# 1. Navigator Step 100
 - Navigator : push, pop 기본 [ [소스](./lib/navigator_step100/navigator_step100.dart) ]
<img src="./README_images/navigator_step100_1.png">

# 2. Navigator Step 110
 - Navigator : Routes, pushNamed, pop 기본  [소스](./lib/navigator_step100/navigator_step110_routes.dart)
<img src="./README_images/navigator_step110_routes_1.png">

```dart
 - 특징
   . routes기능사용은 MaterialApp Widget내부에서만 정의 되어야 한다.
   . home 속성 대신 initialRoute 속성을 기술한다.
   . initialRoute : MateriaApp Widget생성 시 default로 보여줄 page를 기술한다. (home:속성 이라고 봐도 된다.)
   . home속성과 initialRoute 속성 2개 동시에 사용시 error발생
```
# 3. Navigator Step 200
 - Navigator : Arguments 전달, Arguments 받기, Return값 넘기기, Return값 받기    
 - [소스](./lib/navigator_step100/navigator_step200_arguments.dart)
### 1. Arguments 전달 - 방법 1
```dart
   onTap: () async {
      Map<String, String> todoOne = {'subject':'Fltter 공부하기', 'flag':'NO'};
      var rtnValue = await Navigator.of(context).pushNamed('/todoPage', arguments: todoOne);
      subject = rtnValue.toString();
   },
```
### 2. Arguments 받기
```dart
   class _NavigatorStep200Todo extends State<NavigatorStep200Todo> {
      @override
      Widget build(BuildContext context) {
         final Map<String, String> todo = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      }
   }
```

### 3. Return값 넘기기
```dart
   Navigator.of(context).pop('YES');
```

### 3. Return값 받기
   onTap: () async {
      Map<String, String> todoOne = {'subject':'Fltter 공부하기', 'flag':'NO'};
      var rtnValue = await Navigator.of(context).pushNamed('/todoPage', arguments: todoOne);
      
      //뒤로가기버튼 클릭으로   null및 공백이 return될 수 있기 때문에 필수 확인 필요
      if (rtnValue != null && todoList[index]["flag"] != rtnValue) {
         setState(() {
            subject = rtnValue.toString();
         })      
   },
```
