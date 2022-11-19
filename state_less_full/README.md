Widget Tree Element tree  Render tree

 - Element tree : Widget 위치정보를 가지고 있음
 - Render tree  : Widget 이 시점에 그린다.

Scaffold.of(context) : context에서 Scaffold의 element tree위치를 찾는다.

key사용시 메모리를 많이 사용됨

Widget : immutable
state : mutable

didUpdatedWidget : 파라미터가 넘겨때 호출됨
                   element에 대한 변경사항만 update하고 widget은 다시 그리지 않는다.  
				   
				   
didChangeDependencies : inherited Widget의 상태가 변경된 경우 호출됨


initState : 이때는 context가 생성이 안되어 있음 
didChangeDependencies : 이때는 context가 생성되어 있음
                        그래서 media Widget을 사용해야 한다면 이곳에서 해야 한다.
					     arg로 넘길때 모두 rebuild된다.
