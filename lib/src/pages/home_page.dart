import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {

    // print(menuProvider.options);
    // menuProvider.loadData()

    return FutureBuilder(
      future: menuProvider.loadData(),
      // initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ) {

         return ListView(
           children: _listItems( snapshot.data ),
         );

      },
    );
  }

  List<Widget> _listItems( List<dynamic> data ) {

    final List<Widget> options = [];

    data.forEach( (opt) {

      final widgetTemp = ListTile(
        title: Text( opt['texto'] ),
        leading: Icon(Icons.verified_user, color: Colors.blue,),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {},
      );

      options..add(widgetTemp)
             ..add(Divider());
    });

    return options;

  }

}