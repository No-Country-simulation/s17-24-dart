import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_nocountry/home/pages/haciendo_page.dart';
import 'package:to_do_list_nocountry/home/pages/por_hacer_page.dart';
import 'package:to_do_list_nocountry/home/pages/terminado_page.dart';
import 'package:to_do_list_nocountry/home/structures/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.put(HomeController());
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final widgetOptions = <Widget>[
    PorHacerPage(),
    HaciendoPage(),
    TerminadoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      body: widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Por hacer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: 'Haciendo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Terminado',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
