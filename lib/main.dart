import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'utils/consts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget _buildItem(String index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(children: [
        Container(
          // color: [
          //   Colors.blue,
          //   Colors.red,
          //   Colors.green,
          //   Colors.yellow,
          //   Colors.purple
          // ][Random().nextInt(5)],
          clipBehavior: Clip.hardEdge,
          decoration:
              BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
          height: 70,
          width: 70,
          child: Image.asset(
            Images.girl,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Quang Anh'), Text('What are you doing?')],
          ),
        )
      ]),
    );
  }


  final list = [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Messenger')),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Story'),
        ]),
      body: Column(children: [
        Container(
          height:58,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CupertinoSearchTextField(
          ))
        ,
        // Padding(
        //   padding: const EdgeInsets.only(top: 8),
        // ),
        Container(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            itemBuilder: (context, index) {
              return _buildActiveItem();
            },
            separatorBuilder: ((context, index) {
              return SizedBox(
                width: 10,
              );
            }),
          ),
        ),
        Expanded(
          child: ListView.separated(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return _buildItem(index.toString());
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 5,
                );
              }),
        )
      ]),
    );
    //  Container(
    //   height: 200,
    //   color: Colors.purple,

    // )
    //   ],
    // ),
    // );
  }

  Widget _buildActiveItem() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent, 
            border: Border.all(),
            shape: BoxShape.circle,),
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.only(bottom: 3),
          child: Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(Images.girl),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ),
        Text('Baby')
      ],
    );
  }
}
