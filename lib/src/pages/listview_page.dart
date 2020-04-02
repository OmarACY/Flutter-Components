import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _numberList = new List();
  int _lastItem = 0;

  @override
  void initState() {
    super.initState();
    _addTen();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _addTen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas')
      ),
      body: _createList(),
    );
  }

  Widget _createList() {
    return ListView.builder(
        controller: _scrollController,
        itemCount: _numberList.length,
        itemBuilder: (BuildContext context, int index) {

          final image = _numberList[index];

          return FadeInImage(
              image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
              placeholder: AssetImage('assets/jar-loading.gif'));
        }
    );
  }

  void _addTen(){
    for (var i = 1; i < 10; i++){
      _lastItem++;
      _numberList.add(_lastItem);
    }

    setState(() {});
  }

}
