import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wavekeeper/views/home.dart';
import 'package:wavekeeper/views/search.dart';
import 'package:wavekeeper/views/profile.dart';
import 'package:wavekeeper/views/library.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedTab ,
      onTap: (index){
        setState(() {
          this._selectedTab = index;
        });
      },

      items: [
        //NOME DOS BOTOES DA GRIP PRINCIPAL
        BottomNavigationBarItem(
          icon: Icon(Icons.home), 
          label: "Home",
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined), 
          label: "Search",
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_music), 
          label: " Your Library",
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person), 
          label: "Profile",
          ),
        
      ],
    ),
      body: Stack(
        children: [
          renderView(
            0,
             HomeView(),
             ),
          renderView(
            1,
             SearchView(),
             ),
          renderView(
            2, 
            LibraryView(),
            ),
          renderView(
            3,
             ProfileView(),
             ),
        ],
      ),
    );
  }
  Widget renderView(int tabIndex, Widget view) {
    
    return IgnorePointer(
          ignoring: _selectedTab !=tabIndex,
          child:Opacity(
            opacity: _selectedTab == tabIndex? 1 : 0, 
            child:view,
            ),
         );
        
  }
}