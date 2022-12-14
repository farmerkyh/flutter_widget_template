> . 이 문서는 다른 블로그에서 다루는 내용은 기술하지 않았다.<br>
> . 문서를 만든 목적은 Scroll View의 종류와 개발도중 어떤 Widget을 선택할지에 대한 고민을 줄이고자 하기 위함이다.
# 0. CustomScrollView
  - 여러게 scrollView와 일반 Widget들을 한번에 관리 하여 scroll되게 해준다.
  - 교육 : https://www.inflearn.com/ -> [코드팩토리] [초급] Flutter 3.0 앱 개발 - 10개의 프로젝트로 오늘 초보 탈출! -> 섹션 20. [이론] Scrollable Widgets

# 0. Scrollbar
  - Scrollbar안에 Listview, GridView를 child로 위치시키면
    오른쪽에 ScrollBar가 보여진다.
  - Scroll이 어느 위치에 존재 하는 지 알 수 있는 Widget이다.
  - 교육 : https://www.inflearn.com/ -> [코드팩토리] [초급] Flutter 3.0 앱 개발 - 10개의 프로젝트로 오늘 초보 탈출! -> 섹션 20. [이론] Scrollable Widgets
  
  # 0. RefreshIndicator
   - ScrollView에서 맨위일 일때 위쪽으로 scroll하겠다고 하면 재조회 하는 경우에 처리
   - onRefresh: 속성으로 서버에서 자료를 재 조회 한다.

# 1. Scroll View 종류
  - ListView
  - ListWheelScrollView
  - SingleChildScrollView
  - GridView
  - PageView (미 정리)
  - CustomScrollView (미 정리)
  - 
 
# 2. ListView
### 1. ListView 생성 종류
 - ListView method
 - ListView.builder method
 - Listview.seperated method
 - ListView.custom method
 > . 모두 같은 소스에서 상속 받았음(scroll_view.dart) [GridView도 동일]<br>
 > . 즉, ListView class에 나머지는 method 방식으로 Widget을 생성하는 것이다.<br>
 > . ListView class의 생성자는 Required가 없기 때문이 가능한 호출방식이다.<br>

### 2. 정의
 - ListView자체는 보여주는 Widget은 아니고, 스크롤을 해주는 위젯을 생성한다.
 - 사용자에게 보여주고 싶다면 Text, image등의 Widget을 추가 해야 된다.
 - children에 속한 Widget들이 화면의 영역를 벗어날 경우 scroll이 되도록 해주는 Widget이다.
 - scrollDirection 속성 : 으로 scroll방향 설정 (Axis.horizontal, Axis.vertical)

### 3. ListView Rendering 특징
 - 화면에 보여지는 item만 렌더링을 진행한다.
 - 사용자가 scroll을 하면 그때 추가 렌더링을 진행한다.
 - 살아진 widget들은 메모리에서 삭제 된다. 그런 후 다시 보려고 scroll하면 재렌더링 된다.
 - ListView() widget은 되는지 테스트 못해 봤음.
 - ListView.builder, ListView.separated 에서는 위와 같은 렌더링 특징을 가지고 있다.

### 4. ListView Widget
 - 특징
 > . itemBuilder가 존재하지 않으며, count가 존재 하지 않는다.<br>
 > . children하위의 Widget들로 Grid가 구성 된다.<br>
 > . 한번만 수행한다.<br>
 > . count관련 속성이 없다.<br>

 - 비교되는 Widget
 > SingleChildScrollView
 - ListView 참고소스
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/listview/listview_100.dart

<img src="./README_images/listview_100_1.png" height="500">

### 5. ListView.builder method
 - 특징 1
 > 화면에 보여지는 item만 렌더링을 진행한다.

 - 특징 2
 > . 반복적으로 비슷한 형태의 Widget들을 보여줘야 하는 경우에 사용한다.<br>
 > . (참고, 단순히 for 문이 수행 + 각 index별로 빈 Row/Column행이 추가 된다.)<br>
 > . List별 사이에 공간 및 구분자가 필요 없는 경우에 사용<br>
 > . itemCount 숫자만큼 itemBuilder의 callback 함수가 수행 된다.<br>

 - ListView.builder 참고소스 (기본)
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/listview/listview_100.dart

 - item별 구분라인 추가
 >  Flutter 과거버전 ListView.separated가 없을 때는 ListView.builder를 이용해서 구분라인 추가 했었음<br>
 > 방법 : itemCount = List 갯수 * 2만 큼 수행시키고, 홀수는 List값, 짝수는 구분라인을 만들었음<br>

 - ListView.builder 참고소스 (구분라인추가)
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/listview/listview_110.dart

<img src="./README_images/listview_builder_100_1.png" height="500">

### 6. ListView.seperated method
 - 특징 1
 > . 화면에 보여지는 item만 렌더링을 진행한다.

 - 특징 2
 > . ListView.builder Widget성격에 separatorBuilder 속성이 추가된 Widget이다.<br>
 > . 한번 반복 수행 시 itemBuilder, separatorBuilder 2개의 callback함수가 각각 수행 된다.<br>

 - separatorBuilder
 > List별 중간에 Line등의 Widget을 주로 넣을 때 사용 된다.

 - ListView.seperated 참고소스
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/listview/listview_seperated_100.dart

<img src="./README_images/listview_seperated_100_1.png" height="500">

### 7. ListView.custom method
 - 아직 미 분석

 - custom() 생성자를 사용하면 목록의 자식이 빌드되는 방식에 대한 사용자 지정 기능을 사용하여 ListView를 빌드 할 수 있다.
 - 이를 위해 필요한 주요 매개 변수는 항목을 빌드하는 SliverChildDelegate이다.
 - SliverChildDelegates의 유형
 > . SliverChildListDelegate, SliverChildBuilderDelegate 2가지가 있다.<br>
 > . 자신의 델리게이트를 구축하기 위해이를 사용하거나 하위 클래스화할 수 있다.<br>
 > . ListView.builder는 기본적으로 SliverChildBuilderDelegate가있는 ListView.custom이다.<br>
 > . ListView 기본 생성자는 SliverChildListDelegate가있는 ListView.custom처럼 동작한다.<br>

 - ListView.custom 참고소스
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/listview/listview_custom_100.dart

<img src="./README_images/listview_custom_100_1.png" height="500">

# 3. GridView
### 1. GridView 생성 종류
 - GridView Widget
 - GridView.builder method
 - GridView.count method
 - GridView.custom method
 - GridView.extend method
 > . 모두 같은 소스에서 상속 받았음(scroll_view.dart) [ListView도 동일]<br>
 > . 즉, GridView class에 나머지는 method 방식으로 Widget을 생성하는 것이다.<br>
 > . GridView class의 생성자는 Required가 없기 때문이 가능한 호출방식이다.<br>

### 2. 정의
 - 격자형태로 Widget을 정렬하는 Widget이다.
 - scrollDirection 속성에 따라서 좌,우로 화면의 영역를 벗어날 경우 scroll이 되도록 해주는 Widget이다.
 - children속성에 기술된 Widget을 기준으로 격자형태로 정렬해준다.
 - gridDelegate
 > . 격자형태에 대한 구분값들을 속성으로 갖고 있다.<br>
 > . children내부에 width, height값들은 gridDelegate-> childAspectRatio 속성값의 범위를 넘어설 수 없다.<br>
 > . width, height에 대한 size는 모두 childAspectRatio 속성값에 의해 정해진다.<br>

### 3. 특징 (ListView와 동일 특징)
 - 화면에 보여지는 item만 렌더링을 진행한다.
 - 사용자가 scroll을 하면 그때 추가 렌더링을 진행한다.
 - 살아진 widget들은 메모리에서 삭제 된다. 그런 후 다시 보려고 scroll하면 재렌더링 된다.
 - GridView() widget은 되는지 테스트 못해 봤음
 - GridView.builder 에서는 위와 같은 렌더링 특징을 가지고 있음.
 > GridView.counter, GridView.extent는 모든 Widget이 한번에 렌더링됨 (144개 까지 테스트)

### 4. GridView Widget
 - count와 같은 속성은 존재 하지 않는다.
 - gridDelegate : 속성에 정의된 기준대로 Grid 격자 갯수와 Size기준으로 만들어진다.
 - children : Widget갯수에 속성의 갯수에 따라 격자형태로 Widget을 정렬하는 Widget이다.
 - scrollDirection 속성에 따라서 좌,우로 화면의 영역를 벗어날 경우 scroll이 되도록 해주는 Widget이다.
 - children속성에 기술된 Widget들 순서 기준으로 격자형태로 정렬해서 보여준다.
 - GridView 참고소스
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/gridview/gridview_100.dart

<img src="./README_images/gridview_100_1.png" height="500">

### 5. GridView.builder method
 - 특징 1
 > 화면에 보여지는 item만 렌더링을 진행한다.

 - 특징 2
 > gridDelegate, itemBuilder, itemCount : 속성이 존재 한다.<br>
 > itemCount : 속성은 Required가 아님. 넘기지 않으면 무한으로 수로 적용된다.<br>

 - GridView.builder 참고소스
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/gridview/gridview_builder_100.dart

<img src="./README_images/gridview_builder_100_1.png" height="500">

### 6. GridView.count method
 - GridView() Widget 과 GridView.count metho의 차이점을 모르겠음. 거의 동일
 - children하위의 Widget들로 Grid가 구성 된다.

 - GridView.count 참고소스
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/gridview/gridview_count_100.dart

<img src="./README_images/gridview_count_100_1.png" height="500">

### 7. GridView.custom method
 - 아직 미 분석

 - GridView.custom 참고소스
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/gridview/gridview_custom_100.dart

<img src="./README_images/gridview_custom_100_1.png" height="500">

### 8. GridView.extend method
 - GridView()의 생성자, GridView.count()와 거의 동일하다.
 - 가로 혹은 세로를 채울 Widget의 개수를 하나의 Widget의 너비를 통해 동적으로 구한다.
 - children하위의 Widget들로 Grid가 구성 된다.
 - maxCrossAxisExtent (필수)
 > . 한개의 그리드 아이템의 최대넓이(최소?) 값으로 로우 혹은 컬럼의 갯수 자동계산 되어 적용 된다.<br>
 > . crossAxisCount 와 같은 속성이 없다.<br>

 - GridView.extend 참고소스
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/gridview/gridview_extent_100.dart

<img src="./README_images/gridview_extent_100_1.png" height="500">

# 4. ListView, GridView 통합
 -  상속도
 > . ListView -> BoxScrollView -> ScrollView -> StatelessWidget-> Widget<br>
 > . GridView -> BoxScrollView -> ScrollView -> StatelessWidget-> Widget<br>
 > . 모두 같은 소스에서 상속 받았음(scroll_view.dart)<br>

# 5. ListWheelScrollView, ClickableListWheelScrollView
### 1. ListWheelScrollView 특징
 - 돋보기,톱니바뀌 같은 형태로 3D 효과를 나타내면서 보여주는 Widget이다.
 - count 속성이 없는걸로 봐서 for(반복)형식이 아닌 children 속성에 Widget으로 View를 하는 Widget이다.
 - 정 중앙에 위치된 Row가 선택한 자료가 된다.
 - onEvent 가 존재 하지 않는다.

 - ListWheelScrollView 참고소스
> https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/listwheelscrollview/list_whell_scroll_view_100.dart

<img src="./README_images/list_whell_scroll_view_100_1.png" height="500">

### 2. onTab 기능 부여 하기
 - ListWheelScrollView 내부 child Widget을 GestureDetector()로 감싸기
 > 작동안됨 : GestureDetector()로 감하고 수행하면 오류는 안나지만 onTab event가 작동 안됨
 - ListWheelScrollView - onTab 참고소스
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/listwheelscrollview/list_whell_scroll_view_105.dart

 - ListWheelScrollView외부에서 GestureDetector()로 감싸기 (즉, GestureDetector() 내부 child로 ListWheelScrollView 를 정의한다.)
 > 완벽하지는 않지만 onTab 기능은 작동함<br>
 > 이때 onTab은 각 Item에 디한 onTab이 아니고, ListWheelScrollView Widget에 대한 onTab 이다.<br>

 - ListWheelScrollView - onTab 참고소스
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/listwheelscrollview/list_whell_scroll_view_106.dart

<img src="./README_images/list_whell_scroll_view_105_1.png" height="500">

### 3. button 이용하기
 - 버튼을 클릭 해서 현재 선택되어 있는 item을 원하는 곳을 넘겨준다.

 - ListWheelScrollView - button 참고소스
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/listwheelscrollview/list_whell_scroll_view_110.dart

<img src="./README_images/list_whell_scroll_view_110_1.png" height="500">

### 4. ClickableListWheelScrollView 특징
 - 이 Widget은 ScrollView를 하는 Widget이 아니다.
 - ListWheelScrollView Widget에서 각 item에 click 가능하도록 도와주는 Widget이다.
 - click event가 존재 않지 않는 ListWheelScrollView Widget을 child로 두고 onItemTapCallback 에서 click event를 받을 수 있도록 도와 주는 Widget이다.

 - GridView.extend 참고소스
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/listwheelscrollview/clickable_list_wheel_scroll_view_100.dart

<img src="./README_images/clickable_list_wheel_scroll_view_100_1.png" height="500">

# 6. SingleChildScrollView 특징
 - ListView() Widget과 기능이 거의 유사하다.
 - SingleChildScrollView 안에 있는 위젯들은 모두 랜더링된다.
 - 즉, Widget이 100개 만들겠다고 하면 build시점에 바로 100개 만들어 진다.

 - GridView.extend 참고소스 (한 화면에 SingleChildScrollView 1개))
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/singlechildscrollview/single_child_scroll_view_100.dart

 - GridView.extend 참고소스 (한 화면에 SingleChildScrollView 2개))
 > https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/singlechildscrollview/single_child_scroll_view_110.dart

<img src="./README_images/single_child_scroll_view_100_1.png" height="500">

# 7. PageView (미 정리)
 - 좌/우 Page scrolling 처리

# 8. CustomScrollView (미 정리)