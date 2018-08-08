import 'package:flutter/material.dart';

class SlideView extends StatefulWidget{

  var data;

  //data表示轮播图中数据
  SlideView(data){
    this.data = data;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SlideViewState(data);
  }

}

class SlideViewState extends State<SlideView> with SingleTickerProviderStateMixin{

  //TabController为TabBarView组件的控制器
  TabController tabController;
  List slideData;

  SlideViewState(data){
    slideData = data;
  }

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: slideData == null ? 0 : slideData.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    if(slideData != null && slideData.length > 0){
      for(var i = 0; i < slideData.length;i++){
        var item = slideData[i];
        var imgUrl = item['imgUrl'];
        var title = item['title'];
        var detailUrl = item['detailUrl'];
        items.add(new GestureDetector(
          onTap: (){
            //点击页面跳转到详情
          },
          child: new Stack(
            children: <Widget>[
              new Image.network(imgUrl),
              new Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0x50000000),
                  // 标题文本加入内边距
                  child: new Padding(
                    padding: const EdgeInsets.all(6.0),
                    // 字体大小为15，颜色为白色
                    child: new Text(title, style: new TextStyle(color: Colors.white, fontSize: 15.0)),
                  )
              )
            ],
          ),
        ));
      }
    }
    return new TabBarView(
      controller: tabController,
      children: items,
    );

  }


}