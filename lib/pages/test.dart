import 'package:app_delivery/pages/profail_page.dart';
import 'package:flutter/material.dart';
import 'favorite_page.dart';
import 'home_page.dart';

class Test extends StatefulWidget {
  const Test({super.key});
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
   int _ind=0;
 List selectedPage=const[
  HomePage(),
  FavoritePage(),
  ProfailPage()

  
 ];
  
  void changeItem (int index){
    setState(() {
      _ind=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: selectedPage[_ind]) ,
      bottomNavigationBar: BottomNavigationBar(
        items:const [
         BottomNavigationBarItem(icon:Icon( Icons.home),label: "Home"),
         BottomNavigationBarItem(icon:Icon( Icons.favorite_border_outlined),label: "favorite"),
         BottomNavigationBarItem(icon:Icon( Icons.person),label: "profail"),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _ind,
        onTap: changeItem,
        )
    );
  }
}