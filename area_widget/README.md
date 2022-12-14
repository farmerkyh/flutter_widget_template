# 1. Container
### 1. Container 특징
 - child가 없을 때는 전체 화면 영역을 차지한다.
 - child가 있을 때는, child의 크기만큼의 영역만을 차지한다.
 - 하나의 child만 포함할 수 있다.

### 2. Container Overflow 특이점
 - `Container속성에 height를 10,000을 줘도 overflow가 발생하지 않는다.`
 - `Container는 남은 공간에 최대한 영역을 찾이 하면서 child Widget이 영역을 넘어가도 overflow가 발생하지 않는다.`
 > Container widget의 child에 있는 Widget은 overflow가 절대로 발생하지 않는다. <br>
 > (child -> child -> child 하위들은 아님) <br>

 - Column + Container(height:10,000) 을 했을 경우에는 overflow가 발생한다.
 > 이유는 Column Widget은 children Widget들의 최대 크기에 따라간다.

### 3. Container 사용이유


# 2. SizedBox
### 1. SizedBox 특징
 - Container 특징과 동일

### 2. SizedBox 사용이유
 - 주로 Widget간에 간격을 주려고 할때 사용 된다.
 - Container보다 아주아주 조금 가볍다.
 - googling 해보면 크게 아래 2가지 의견들이 있다.
```dart
   . Dart는 Wrapping용 언어라 Container와 같은 성격 Widget을 Wrapping해서 Padding을 적용하는게 좋다.
   . Wrapping을 많이 할 수록 복잡도가 높아 지기때문에 SizedBox를 사용하는게 좋다.
   . 가독성이 좋다. SizedBox Widget을 script상에서 보면 '아 Wiedget간 여백을 주려고 하는구나' 
     라고 생각 될 수 있다. (농부생각)
     (단, Wrapping을 하지 않고 단순히 "SizedBox(height: 100)"과 같이 기술할때의 이야기 기다.)
 ```

# 3. Expanded
### 1. expanded 특징
 - 부모의 남은 범위를 flex의 비율에 맞춰서 "모두" 가져간다. 
 - expanded를 적용하지 않은 Widget이 우선적으로 필요한 Size를 적용시키고, expanded가 남은 것들을 가져간다고 생각하면 쉽다.
 - child Widget의 size가 화면을 넘어가도 화면범위 안에서만 보여진다. (overflow발생 안함)

### 2. expanded 용도
 - Row나 Column등에서 핸드폰 화면에 맞게 균일하게 배치하기 위해서 사용함.
 - pixel기준으로 할 경우, 핸드폰 규격에 맞추기 어렵지만, expanded를 사용할 경우 핸드폰 규격에 맞추기 쉽다.

### 3. 사용가능 Widget
 - Flexible Widget or Expanded Widget들은 반드시 Column, Row, Flex(?) Widget안에만 사용해야 된다.
 > Expanded는 Flexible Widget에서 상속받았다.
 - Scffold, Container, SizedBox  등에 child로 사용 시 오류 발생
 > 오류 내용 
```dart
The following assertion was thrown while looking for parent data.:
Incorrect use of ParentDataWidget.

The following ParentDataWidgets are providing parent data to the same RenderObject:
- Expanded(flex: 1) (typically placed directly inside a Flex widget)
- LayoutId-[<_ScaffoldSlot.body>](id: _ScaffoldSlot.body) (typically placed directly inside a CustomMultiChildLayout widget)
However, a RenderObject can only receive parent data from at most one ParentDataWidget.

Usually, this indicates that at least one of the offending ParentDataWidgets listed above is not placed directly inside a compatible ancestor widget.
```

# 4. Column
### 1. Column 특징
 - 주측에서 찾이 할 수 있는 공간은 모두 찾이 한다. (default : MainAxisSize.max)
 - 반대측은 Widget 크기에 따라서 최소한의 크기만 찾이 한다.
 - `중요 : 내부 Widget들의 size가 화면보다 커질 경우 overflow 오류 발생 (★★)`
 > Error : A RenderFlex overflowed by 4526 pixels on the bottom.    
 > 4526는 화면을 벗어난 pixel 수이다.    
 - 즉, Column의 children Widget들이 화면보다 작으면 화면만큼(남은만큼) 최대한 커지고, 
 -     내부  Widget들이 화면보다 커지면 내부 Widget들의 Size만큼 Column Widget도 커진다.

# 5. Row
### 1. Row 특징
 - Column특징이 동일하면서, 몇몇 사항은 반대의 개념으로 동작한다.

# 6. Stack & Positioned
### 1. Stack 특징
 - Widget이 왼쪽 상단 모서리를 기준으로 중첩되어 렌더링 된다.
 - Row, Expanded와 같은 Widget하위에 child로 되어 있을 경우에는 Parent의 좌표를 기준으로 중첩되어 렌더링 된다.

### 2. Positioned 특징
 - Positioned Widget은 Stack child로만 배치가 가능하다.
 - Stack이 렌더링 되는 좌표꼭지점에서 x,y 좌표만큼 떨어진 절대좌표에   
   Positioned의 child Widget이 렌더링 된다.

