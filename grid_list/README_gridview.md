# GridView_template

## GridView
### 1. 

### 2. GridView 5가지 생성 방법
   - GridView
   - GridView.builder
   - GridView.count
   - GridView.extent
   - GridView.custom

   |   | 그리드 뷰 모양(row갯수, 스페이싱등) | 그리드뷰 아이템 |
   |count| 콜백방식, 갯수지정  | 콜백방식
   |extend| 콜백방식, 넓이지정  | 콜백방식
   |build| 클래스방식, 갯수지정, 넓이지정  | 콜백방식
   |custom| 클래스방식, 갯수지정, 넓이지정  | 클래스방식


### 2. main, cross
 - 둘다 Column과 같은 style로 적용된다.
 - scroll 되는 방향이 메인주축이 된다
 - mainAxisSpacing: 10,    //수평 Padding (위라인, 아래라인 간에 간격)
 - crossAxisSpacing: 10,   //수직 Padding (왼쪽item, 오른쪽item 간에 간격)   

### 3. GridView.builder vs GridView.count
   - 차이점을 잘 모르겠음
   - 그져 문법적인 차이로만 느껴짐 (2022.11.07일 기준.  좀더 실력이 늘면 차이점이 느껴 질랑가?? ㅋㅋ)

### 4. GridView.builder 속성 및 특징
            GridView.builder(
                itemCount: 10,                  //item 개수
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,          //1 개의 행에 보여줄 item 개수
                    childAspectRatio: 1 / 2,    //item 의 가로 1, 세로 2 의 비율
                    mainAxisSpacing: 30,        //수평 Padding
                    crossAxisSpacing: 10,       //수직 Padding                    
                ),
                itemBuilder: (BuildContext context, int index) { ... },   //item 의 반목문 항목 형성
            )

### 4. GridView.count 속성 및 특징
            GridView.count(
                crossAxisCount: 1,          //1 개의 행에 보여줄 item 개수
                childAspectRatio: 1 / 2,    //item 의 가로 1, 세로 2 의 비율
                mainAxisSpacing: 30,        //수평 Padding
                crossAxisSpacing: 10,       //수직 Padding                    
                children: List.generate(length, (index) { ... }   //item 의 반목문 항목 형성
            ),

### 4. GridView.extent 속성 및 특징
 - GridView의 생성자, GridView.count와 거의 동일하다.
 - 하지만 가로 혹은 세로를 채울 Widget의 개수를 하나의 Widget의 너비를 통해 동적으로 구한다.
 - maxCrossAxisExtent : item 하나의 height size지정 (최대 사이즈로 레이아웃을 채운다.)

            GridView.extent(
                    maxCrossAxisExtent: 100.0,    //item 하나의 height size지정
                    mainAxisSpacing: 30.0,        //수평 Padding
                    crossAxisSpacing: 10.0,       //수직 Padding       
                    childAspectRatio: 1.0,
                    children: List.generate(length, (index) { ... }   //item 의 반목문 항목 형성
            );

### 4. GridView.extent 속성 및 특징
#### SliverGridDelegate
 - SliverGridDelegateWithFixedCrossAxisCount : 교차 축의 자식 수
 - SliverGridDelegateWithMaxCrossAxisExtent  : 자식에 대한 최대 교차 축 공간 (우리가 사용하는 것과 동일 GridView.extent)
#### SliverChildDelegate
 - SliverChildBuilderDelegate : 자식을 구성하기 위한 빌더 콜백을 제공한다.
 - SliverChildListDelegate    : 자식 목록을 명시적으로 만드는 옵션을 제공한다.

            child: GridView.custom(
                childrenDelegate: SliverChildBuilderDelegate( () {} ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(),
            ),

