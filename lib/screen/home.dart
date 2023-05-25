import 'package:flutter/material.dart';
import 'package:material/screen/components/home.dart';
import 'package:material/screen/components/setting.dart';
import 'package:material/screen/components/tv_show.dart';
import 'package:material/screen/components/watchList.dart';
class MainHomeScreen extends StatefulWidget {
   MainHomeScreen({Key? key,  required this.currentIndex}) : super(key: key);
    int currentIndex =0;
   static const navigation = <NavigationDestination>[
    NavigationDestination(
      selectedIcon: Icon(
        Icons.home,
        color: Colors.green,
      ),
      icon: Icon(
        Icons.home_outlined,
        color: Colors.white,
      ),
      label: 'Home',
    ),
    NavigationDestination(
      selectedIcon: Icon(
        Icons.account_balance_wallet,
        color: Colors.green,
      ),
      icon: Icon(
        Icons.computer,
        color: Colors.white,
      ),
      label: 'Tv Show',
    ),
    NavigationDestination(
      selectedIcon: Icon(
        Icons.warning,
        color: Colors.green,
      ),
      icon: Icon(
        Icons.remove_red_eye,
        color: Colors.white,
      ),
      label: 'WatchList',
    ),
    NavigationDestination(
      selectedIcon: Icon(
        Icons.sports_soccer,
        color: Colors.green,
      ),
      icon: Icon(
        Icons.settings,
        color: Colors.white,
      ),
      label: 'Settings',
    ),
  ];

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {

  int drawerIndex =0;

  final page = [
    const HomeScreen(),
    const TvShowScreen(),
    const WatchListScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(MainHomeScreen.navigation[widget.currentIndex].label),

      ),
      drawer: NavigationDrawer(
        selectedIndex: drawerIndex,
      onDestinationSelected: (int drawerI){

        setState(() {
          drawerIndex = drawerI;
          if(drawerI == 0){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainHomeScreen(currentIndex: 0)),);
          }else if(drawerIndex == 1){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainHomeScreen(currentIndex: 1)),);
          }else if(drawerIndex == 2){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainHomeScreen(currentIndex: 2)),);
          }else if(drawerIndex == 3){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainHomeScreen(currentIndex: 3)),);
          }else{

          }

        });
      },

      backgroundColor: Colors.blueGrey,
        children: const [DrawerHeader(child: CircleAvatar(backgroundColor: Colors.white,)),
        ListTile(
          dense: true,
          title: Text(
            "Switch Screen",
            style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ),

        NavigationDrawerDestination(
          selectedIcon: Icon(
            Icons.home,
            color: Colors.green,
          ),
          icon: Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          label: Text('Home'),
        ),
        NavigationDrawerDestination(
          selectedIcon: Icon(
            Icons.account_balance_wallet,
            color: Colors.green,
          ),
          icon: Icon(
            Icons.computer,
            color: Colors.white,
          ),
          label: Text('Tv Show'),
        ),
        NavigationDrawerDestination(
          selectedIcon: Icon(
            Icons.warning,
            color: Colors.green,
          ),
          icon: Icon(
            Icons.remove_red_eye,
            color: Colors.white,
          ),
          label: Text('WatchList'),
        ),
        NavigationDrawerDestination(
          selectedIcon: Icon(
            Icons.sports_soccer,
            color: Colors.green,
          ),
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          label:Text( 'Settings'),
        ),
      ],),
      body: page[widget.currentIndex],
      bottomNavigationBar:  NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: Colors.white,
          labelTextStyle: MaterialStatePropertyAll(
              TextStyle(color: Colors.white, fontSize: 11)),
        ),
        child: NavigationBar(
          animationDuration: const Duration(seconds: 1),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          selectedIndex: widget.currentIndex,
          height: 60,
          elevation: 0,
          backgroundColor: Colors.blueGrey,
          onDestinationSelected: (int index) {
            setState((){
              widget.currentIndex = index;
            });

            //co.updateIndex(index);
          },
          destinations: MainHomeScreen.navigation,
        ),
      ),
    );
  }
}
