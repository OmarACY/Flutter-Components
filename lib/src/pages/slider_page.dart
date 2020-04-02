import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            Expanded(child: _createImage())
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
        label: 'Tamano de la imagen',
        value: _sliderValue,
        min: 10.0,
        max: 400.0,
        onChanged: ( value ) {
          setState(() {
            _sliderValue = value;
          });
        });
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('https://pngimage.net/wp-content/uploads/2018/05/batman-png.png'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }
}
