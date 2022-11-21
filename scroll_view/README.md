# 1. Scroll View 종류
  - ListView
  - ListWheelScrollView
  - SingleChildScrollView
  - GridView
 
# 2. ListView
### 1. 종류
 - ListView
 - ListView.builder
 - Listview.seperated
 - ListView.custom
 > 모두 같은 소스에서 상속 받았음(scroll_view.dart) [GridView도 동일]
 > 즉, ListView class에 나머지는 method 방식으로 Widget을 생성하는 것이다.
 > ListView class의 생성자는 Required가 없기 때문이 가능한 호출방식이다.

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
 - 참고소스 : listview_100.dart
 - 특징
 > 한번만 수행한다.
 > count관련 속성이 없다.

 - 비교되는 Widget
 > SingleChildScrollView

### 5. ListView.builder
 - 참고소스 : https://github.com/farmerkyh/flutter_widget_template/blob/master/scroll_view/lib/listview/listview_100.dart
 - 반복적으로 비슷한 형태의 Widget들을 보여줘야 하는 경우에 사용한다.
 - (참고, 단순히 for 문이 수행 + 각 index별로 빈 Row/Column행이 추가 된다.)
 - List별 사이에 공간 및 구분자가 필요 없는 경우에 사용
 - itemCount 숫자만큼 itemBuilder의 callback 함수가 수행 된다.

### 6. ListView.seperated
 - 참고소스 : listview_seperated_100.dart
 - ListView.builder Widget성격에 separatorBuilder 속성이 추가된 Widget이다.
 - 한번 반복 수행 시 itemBuilder, separatorBuilder 2개의 callback함수가 수행 된다.
 > * separatorBuilder
 >   - List별 중간에 Line등의 Widget을 주로 넣을 때 사용 된다.

 > * 참고
 >   - Flutter 과거버전 ListView.separated가 없을 때는 ListView.builder를 이용해서 구분라인 추가 했었음
 >    > 방법 : itemCount = List 갯수 * 2만 큼 수행시키고, 홀수는 List값, 짝수는 구분라인을 만들었음
 >    > 참고소스 : listview_builder_110.dart

### 7. 









# ListView 와 GridView

Listview  계층도 
 Listview -> BoxScrollView -> ScrollView -> StatelessWidget-> Widget


## ListView와 GridView 공통점
- 동일한 부모를 상속하고 있다.
        
         class GridView extends BoxScrollView {
            ...
         }

         class ListView extends BoxScrollView {
            ...
         } 


## ListView와 GridView 차이점
   - ListView는 화면기준 한라인에 자료한건이 표시된다.
   - GridView는 화면기준 하란인에 자료를 여러건 표시 할 수 있다.
   - Widget 형태도 기본적으로 Widget 리스트를 스크롤할 수 있게 만드는 형식이고, 
     둘의 차이는 자식 Widget을 어떻게 나타내는지 차이가 있는 것이다.




