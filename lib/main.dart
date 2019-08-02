import 'package:flutter/material.dart';
//导入拍照和选取照片的插件
import 'package:image_picker/image_picker.dart';
//导入IO文件操作库
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo!',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: '颜值大师'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //用户通过摄像头或图片库选择的照片
  File _image;

//选取照片的函数
void choosePic() async {
  //得到选取的照片
  var image= await ImagePicker.pickImage(source: ImageSource.camera);

  setState(() {
   //把用户选择的照片存储到_image
   _image = image; 
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: renderBody(),
      floatingActionButton:
          renderLloatingActionButton(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

//渲染头部appbar
  Widget renderAppBar() {
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
    );
  }

//渲染页面主体
  Widget renderBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.display1,
          ),
        ],
      ),
    );
  }

  //渲染底部浮动按钮
  Widget renderLloatingActionButton() {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'photo_camera',
          child: Icon(Icons.photo_camera),
        ),
        FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'photo_library',
          child: Icon(Icons.photo_library),
        )
      ],
    );
  }

}
