import 'package:flutter/material.dart';
import 'package:the_p_league_mobileapp/models/p-league-session.dart';
import 'package:the_p_league_mobileapp/screens/gallery-page/gallery-page.dart';
import 'package:the_p_league_mobileapp/screens/schedules-page/p-league-source.dart';
import 'package:the_p_league_mobileapp/screens/schedules-page/schedules-page.dart';
import 'package:the_p_league_mobileapp/services/schedules-service.dart';

class HomePage extends StatefulWidget{
  HomePage({Key key}) : super(key: key);
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _selectedIndex = 0; 
  static PLeagueSource dataSource = PLeagueSource();

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _menuOptions = <Widget>[
    SchedulesPage(dataSource: dataSource),
    Text(
      'Stats',
      style: optionStyle
    ),    
    GalleryPage()
  ];

  void _onMenuSelected(int index){
    setState(() {    
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar: AppBar(
      title: const Text('The P League'),
    ),
    body: Center(
      child: _menuOptions.elementAt(_selectedIndex),
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule),
          title: Text('Schedules'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.satellite),
          title: Text('Stats'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          title: Text('Gallery'),          
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onMenuSelected,
    ),
  );
  }
}
