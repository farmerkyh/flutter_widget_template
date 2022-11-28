import 'package:flutter/material.dart';

const rainbowColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

//SliverPersistentHeader용
class _SliverFixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  _SliverFixedHeaderDelegate({
    required this.child,
    required this.maxHeight,
    required this.minHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  // 최대 높이
  double get maxExtent => maxHeight;

  @override
  // 최소 높이
  double get minExtent => minHeight;

  @override
  // covariant - 상속된 클래스도 사용가능
  // oldDelegate - build가 실행이 됐을때 이전 Delegate
  // this - 새로운 delegate
  // shouldRebuild
  //   - 새로 build를 해야할지 말지 결정해주는 method
  //   - false - build안함
  //   - true - 빌드 다시함
  //   - 아래 내용은 size및 child가 변경 될때 rebuild해준다.
  // bool shouldRebuild(covariant _SliverFixedHeaderDelegate oldDelegate) {
  bool shouldRebuild(_SliverFixedHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}

class CustomScrollView100 extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  CustomScrollView100({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //CustomScrollView - slivers
      //   - slivers안에 포함된 모든 Widget들은 앞에 slivers가 다 붙는 widget들만 온다.
      //SliverPersistentHeader
      //   -
      body: CustomScrollView(
        slivers: [
          renderSliverAppbar(), //Appbar도 slivers 안에 넣을 수 있다. scroll도 같이 된다.
          renderHeader(), //SliverPersistentHeader : Sliver와 Sliver 사이에  header를 위치 시킴
          renderBox(),

          //renderChildSliverList(), // ListView 기본 생성자와 유사함.
          renderBuilderSliverList(), // ListView.builder 생성자와 유사함.
          renderHeader(),
          renderSliverGridBuilder(), // GridView.builder 와 비슷함
          renderHeader(),
          renderBuilderSliverList(), // ListView.builder 생성자와 유사함.
          renderHeader(),

          //renderChildSliverGrid(), // GridView.count 유사함
          renderSliverGridBuilder(), // GridView.builder 와 비슷함
          renderHeader(),
        ],
      ),
    );
  }

  SliverToBoxAdapter renderBox() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.blue,
        height: 300,
        child: Center(
          child: Text(
            '이건 되지롱',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  //이 header들은 위로 scroll할때 높이가 줄었다 눌었다 한다.
  //  - 높이가 줄었다, 늘었다 하는 size는 minHeight, maxHeight의 값에 의해 결정 난다.
  SliverPersistentHeader renderHeader() {
    return SliverPersistentHeader(
      pinned: true, //header가 위로 scroll할때 맨 상위에 고정된다.
      delegate: _SliverFixedHeaderDelegate(
        child: Container(
          color: Colors.black,
          child: Center(
            child: Text(
              '신기하지~',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        minHeight: 50,
        maxHeight: 200,
      ),
    );
  }

  // AppBar
  SliverAppBar renderSliverAppbar() {
    return SliverAppBar(
      // 스크롤 했을때 리스트의 중간에도 AppBar가 내려오게 할 수 있음.
      floating: true, //true:scroll을 내릴때는 AppBar가 살아졌다가, 위로 scroll할때는 다시 보여짐
      // 완전 고정
      pinned: false,
      // 자석 효과
      // floating true 에만 사용가능
      //snap: false, : 상/하 scroll도중 appbar가 반만 보여지는 경우 존재
      snap: true,
      // 맨 위에서 한계 이상으로 스크롤 했을때
      // 남는 공간을 차지
      //stretch: true, - ios인 경우 : 맨위에서 더이상 scroll할게 없을때도 내린 경우 appbar color가 stretch된다.
      stretch: false,
      expandedHeight: 200, //appbar 최대 height
      collapsedHeight: 150, //
      //Appbar 전체의 공간을 찾이 한다.
      flexibleSpace: FlexibleSpaceBar(
        //custom_scroll_view_screen_image_1
        background: Image.asset(
          'asset/images/image_1.jpeg',
          fit: BoxFit.cover,
        ),
        title: Text('FlexibleSpace'), // title : Appbar 하단 영역
      ),
      title: Text('CustomScrollViewScreen'),
    );
  }

  // ListView 기본 생성자와 유사함.
  SliverList renderChildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
      ),
    );
  }

  // ListView.builder 생성자와 유사함.
  SliverList renderBuilderSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: 15,
      ),
    );
  }

  // GridView.count 유사함
  SliverGrid renderChildSliverGrid() {
    return SliverGrid(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  // GridView.builder 와 비슷함
  SliverGrid renderSliverGridBuilder() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: 30,
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print(index);
    return Container(
      height: height ?? 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
