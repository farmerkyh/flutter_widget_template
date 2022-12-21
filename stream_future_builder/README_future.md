# 1. FutureBuilder

## 1. FutureBuilder - 정의
### 1. FutureBuilder.future 정의
1. Future를 Return해주는 어떠한 함수든 다 넣을 수 있다.
    - 이 함수의 상태가 변경 될 때마다 FutureBuilder.builder를 다시 실행하게 하여   
    화면을 다시 그려질 수있도록 한다.
    - 변경이란 : future에 적용된 메서드가    
                Loading중이거나, 끝났거나, 또는 어떤 값이 Return되었거나, error가 났거나   
              이런 상태가 변경 되면 받게 된다.   
    - build()method는 다시 실행하지 않고, builder:의 callback만 다시 실행해준다.
### 2. FutureBuilder.builder 실행 시점
1. 초기 build()시점
2. future: 속성에 적용된 메서드의 return값이 변경 된 경우
3. setState()에 의해서 재 build() 되는 시점   
    - 특이점   
        . 재 build()가 되면 class Member변수의 값을 제외하곤 모두다 초기화가 된다.   
            하지만  setState()에 의해서 재 build()가 될 때   
            FutureBuilder안에 있던 snapshot.data의 값은 유지가 된다. (?)   
            이말인즉슨, future: callback은 재 build될때 수행이 안된다는 뜻 이다.   
    - FutureBuilder Generic   
        . FutureBuilder Generic이 존재 한다.   
        . FutureBuilder`<T>` 과 같은 형식이다.   
        . 이 때 `<T>`와 같으 Generic은 future:속성의 return type이다.   
            즉, 아래에서는 checkPermission() 메서드의 return type이다.   
            snapshot.data의 type이다.   
        . Generic은 생략해도 알아서 인지해서 적용 된다.                
    - FutureBuilder > builder > snapshot   
            이 snapshot 속성으로 변경된 값을 받아서 사용할 수 있다.   
### 3. ConnectionState
```dart
enum ConnectionState {
  // Not currently connected to any asynchronous computation.
  // For example, a [FutureBuilder] whose [FutureBuilder.future] is null.
  none,

  // Connected to an asynchronous computation and awaiting interaction.
  waiting,

  // Connected to an active asynchronous computation.
  // For example, a [Stream] that has returned at least one value, but is not
  // yet done.
  active,

  // Connected to a terminated asynchronous computation.
  done,
}
```

# 2. 기본예제
## 1. 예제 (future_builder_100.dart)
1. 기능
    - FutureBuilder 사용
    - 단순히 숫자 가져오는 함수를 Future로 정의 후 개발
2. 소스
    - [ [개발소스](./lib/future/future_builder_100.dart) ]
    - [ [참고소스](https://github.com/codefactory-co/flutter-lv1-theory-future-and-stream-builder) ]

3. 실행화면
 <image src='./README_images/future_builder_100_1.png'>

    - ConnectionState.waiting : FutureBuilder loading시점
    - ConnectionState.done : FutureBuilder 완료시점

## 2. 예제 (future_builder_200.dart)
1. 기능
    - FutureBuilder 사용
    - http 호출하여 json string 1건 조회
2. 소스
    - [ [개발소스](./lib/future/future_builder_200.dart) ]

3. 실행화면
 <image src='./README_images/future_builder_200_1.png'>
