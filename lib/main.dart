import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text('تشابه الصور'),
        backgroundColor: Colors.indigo[800],
      ),
      body: ImagePage(),
    ),
  ));
}

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftBuNum = 1;
  int rightBuNum = 2;
  void changeImage(){
    setState(() {
      leftBuNum = Random().nextInt(8) + 1;
      rightBuNum = Random().nextInt(8) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftBuNum == rightBuNum ? 'مبروك لقد نجحت' : 'حاول مرة اخرى',
          style: TextStyle(
            fontSize: 42,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    changeImage();

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'images/image-$leftBuNum.png',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    changeImage();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'images/image-$rightBuNum.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
