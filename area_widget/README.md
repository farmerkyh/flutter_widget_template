# 1. Container
# 2. SizedBox
# 3. Expanded

# 4. Column
### 1. Column 특징
 - 주측에서 찾이 할 수 있는 공간은 모두 찾이 한다. (default : MainAxisSize.max)
 - 반대측은 Widget 크기에 따라서 최소한의 크기만 찾이 한다.
 - `내부 Widget들의 size가 화면보다 커질 경우 overflow 오류 발생 (★★)`
 > Error : A RenderFlex overflowed by 4526 pixels on the bottom.
 > 4526는 화면을 벗어난 pixel 수

### 2. Column + ListView 포함시키기
 - Column ()


# 5. Row

# 6. Stack & Positioned