import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  List<int> _numberList = [1,2,3,4,5,6];

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
        itemCount: _numberList.length,
        itemBuilder: (BuildContext context, int index) {

          final image = _numberList[index];

          return FadeInImage(
              image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
              placeholder: AssetImage('assets/jar-loading.gif'));
        }
    );
  }
}
