import 'dart:async';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _numberList = new List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addTen();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
//        _addTen();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas')
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading()
        ]
      )
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

  Future fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration( seconds: 2 );
    return new Timer(duration, _respuestaHttp );
  }

  void _respuestaHttp() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration( milliseconds: 250)
    );

    _addTen();
  }

  Widget _createLoading() {
    if( _isLoading ) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            CircularProgressIndicator()
            ],
          ),
          SizedBox( height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
