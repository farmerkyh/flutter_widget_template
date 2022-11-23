- 참고URL
- https://www.markdownguide.org/basic-syntax/

# 1. Title
- 6단계 : #, ##,... ######

# 2. Ordered
### 2.1 예문/결과 - type 1 (type1과 type2는 동일 결과)
<pre>
 * Item 1
 * Item 2
</pre>
 * Item 1
 * Item 2

### 2.2 예문/결과 - type 2 (type1과 type2는 동일 결과)
<pre>
 - Item 1
 - Item 2
</pre>
 - Item 1
 - Item 2

### 2.3 예문/결과 - type 3
<pre>
  1. Item 1
  2. Item 2
  3. Item 3
</pre>
  1. Item 1
  2. Item 2
  3. Item 3

# 3. Table
### 3.1 예문/결과 - 정렬하기
<pre>
| Left columns  | Right columns | Middle columns  |
|:------------- | -------------:|:-------------:  |
| left foo      | right foo     | middle bar      |
| left bar      | right bar     | middle bar      |
| left baz      | right baz     | middle bar      |
</pre>
| Left columns  | Right columns | Middle columns  |
|:------------- | -------------:|:-------------:  |
| left foo      | right foo     | middle bar      |
| left bar      | right bar     | middle bar      |
| left baz      | right baz     | middle bar      |

### 3.2 예문/결과 - 하나의 cell의 n줄 넣기
<pre>
| Left columns  | Right columns | Middle columns  |
|:------------- | -------------:|:-------------:  |
| left foo <br> left bar <br> left baz   | right foo <br> right bar <br> right baz  | middle bar <br> middle bar  <br?middle bar  |
</pre>
| Left columns  | Right columns | Middle columns  |
|:------------- | -------------:|:-------------:  |
| left foo <br> left bar <br> left baz   | right foo <br> right bar <br> right baz  | middle bar <br> middle bar  <br?middle bar  |


# 2. 기타 예문/결과 
<pre>
 - 취소선은 : ~~취소문구~~
 - 엔터키 : <br>
 - 이탤릭체 : *문구*
 - 볼드체 : **문구**, __문구__
 - 이탤릭체 + 볼드체 : __문구 **문구** __
</pre>
 - 취소선은 : ~~취소문구~~
 - 엔터키 : <br>
 - 이탤릭체 : *문구*
 - 볼드체 : **문구**, __문구__
 - 이탤릭체 + 볼드체 : __문구 **문구** __