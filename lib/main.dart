import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'body.dart';

void main() {
  runApp(const InstaCloneApp());
}

class InstaCloneApp extends StatelessWidget {
  const InstaCloneApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(   ///materail app이 최상단
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          secondary: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
        )
      ),
      home: const InstaCloneHome(),

    );
  }
}

class InstaCloneHome extends StatefulWidget {
  const InstaCloneHome({super.key});

  @override
  State<InstaCloneHome> createState() => _InstaCloneHomeState();
}

class _InstaCloneHomeState extends State<InstaCloneHome> {
  late int index;   ///late변수를 사용하면 non-nullable변수의 초기화를 나중에 할 수 있다.


  @override
  void initState() {    ///initstate를 통해서 초기값을 받아준다
    super.initState();  ///항상 슈퍼로 초기값을 받아준다.
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  ///material app에서 화면을 구성할 때 가장 기본이 되는 도화지
      appBar: AppBar(
        ///title: Text('Instagram', style:TextStyle(color:Colors.black)),
        title: Text('Instagram', style: GoogleFonts.lobsterTwo(color: Colors.black, fontSize: 32),),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_outline, size: 37),
            onPressed: (){
                print('Tab favorite');
            },
          ),

          IconButton(
            icon: const Icon(CupertinoIcons.paperplane, size:37),
            onPressed: (){
              print('plane');
            }),
        ],
      ),

      body: InstaBody(index: index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (newIndex)=> setState(() => index = newIndex),
        items: const[     ///변동이 없는 위젯이 될것이므로 const를 추가함
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 40), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search, size: 40,), label:'Search')
        ],
      ),

    );
  }
}


