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

# 3. BlockQuote
### 3.1 예문/결과 - >
<pre>
> This is a first blockqute.
>	> This is a second blockqute.
>	>	> This is a third blockqute.
</pre>
> This is a first blockqute.
>	> This is a second blockqute.
>	>	> This is a third blockqute.

### 3.2 예문/결과 - > 순서없는 목록(글머리 기호: *, +, - 지원)
<pre>
* 빨강
  * 녹색
    * 파랑

+ 빨강
  + 녹색
    + 파랑

- 빨강
  - 녹색
    - 파랑
</pre>

* 빨강
  * 녹색
    * 파랑

+ 빨강
  + 녹색
    + 파랑

- 빨강
  - 녹색
    - 파랑


# 10. Table
### 10.1 예문/결과 - 정렬하기
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

### 10.2 예문/결과 - 하나의 cell의 n줄 넣기
- < br > 을 넣어 주거나, 마지막에 공백 3칸을 넣어 준다.
<pre>
| Left columns  | Right columns | Middle columns  |
|:------------- | -------------:|:-------------:  |
| left foo < br > left bar < br > left baz   | right foo < br > right bar < br > right baz  | middle bar < br > middle bar  < br >middle bar  |
</pre>
| Left columns  | Right columns | Middle columns  |
|:------------- | -------------:|:-------------:  |
| left foo <br> left bar <br> left baz   | right foo <br> right bar <br> right baz  | middle bar <br> middle bar  <br>middle bar  |

# 11. Code Block
### 11.1 Code Block - 예문/결과
<pre>
 - <pre><code>{개발 소스 code}</code></pre> 
 - ```dart 
   개발소스코드 [문법강조(Syntax highlighting)]
   ```   
</pre>
 - <pre><code>{개발 소스 code}</code></pre> 
```dart 
   개발소스코드 [문법강조(Syntax highlighting)]
```   


### 11.2 Code Block - 예문/결과
<pre>
 - 회색 배경색 주기 : `배경색 주기`
</pre>
- 회색 배경색 주기 : `배경색 주기`



# 99. 기타 예문/결과 
<pre>
 - 취소선은 : ~~취소문구~~
 - 엔터키   
   줄바꿈 : <br>
            문장 마지막에서 3칸 이상 공백 주면 됨
 - 이탤릭체 : *문구*
 - 볼드체 : **문구**, __문구__
 - 이탤릭체 + 볼드체 : __문구 **문구** __
 - 수평선 : * * *
           ***
           *****
           - - -
           ---------------------------------------
 - 이미지 : <i mg src="/path/to/img.jpg" width="450px" height="300px" title="px(픽셀) 크기 설정" alt="RubberDuck">
</pre>
 - 취소선은 : ~~취소문구~~
 - 엔터키 : <br>
 - 엔터키 두번째   
   공백을 넣어주니까 다음줄에 적용 되네.
 - 이탤릭체 : *문구*
 - 볼드체 : **문구**, __문구__
 - 이탤릭체 + 볼드체 : __문구 **문구** __
 - 수평선 : 첫번째 컬럼부터 기술해야 됨
* * *
***
*****
- - -
---------------------------------------