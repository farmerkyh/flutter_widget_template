코나인님 route 참조 url : https://gist.github.com/HowToMakeHappy/8fa13d572257065f1d82194d8207a8ed

** 소스코드 오류
   - 8-2 (todo_list프로젝트)
   - subDetail.dart 

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

1. 값 return하기
   Navigator.of(context).pop(controller.value.text);
   return한값 받기
   void _addNavigation(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed('/second');
  }


1. 값 전달하기
   Navigator.of(context).pushNamed('/third', arguments: todoList[index]);
   전달한값 받기
   final String args = ModalRoute.of(context)!.settings.arguments as String;
   -  as String : 전달받은 자료의 형을 알 수 없으므로 형 변환을 해 준다.