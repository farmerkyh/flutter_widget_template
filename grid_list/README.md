# ListView 와 GridView

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