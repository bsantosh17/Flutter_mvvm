import 'package:flutter/material.dart';
import 'package:flutter_new/screen/auth/login.dart';
import 'package:flutter_new/screen/dashboard/home_screen.dart';
import 'package:flutter_new/screen/dashboard/profile_screen.dart';
import 'package:flutter_new/screen/dashboard/setting_screen.dart';
import 'package:flutter_new/widgets/custom_app_bar.dart';

import '../../data/sharepreference/AuthHelper.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  String? username = '';
  int _selectedIndex = 0;

  final List<Widget> _Screen = [
    MyHomeScreen(),
    MyProfileScreen(),
    MySettingScreen()
  ];

  final List<String> _title = ['Home', 'Profile', 'Setting'];

  void _onSelectDrawerItem(int index){
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context);
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthHelper.getUsername().then((value) => setState(() => username = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _title[_selectedIndex],
        action: [
          IconButton(
              onPressed: () {
                print("Search...");
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                print("Notification....");
              },
              icon: Icon(Icons.notifications)),
          PopupMenuButton(
              onSelected: (String value) async{
                print(value);
                if(value == 'Setting'){
                  print("value is Setting");
                }else if(value == 'Logout'){

                  final bool? confirmed = await showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirm Logout'),
                        content: const Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('Logout'),
                          ),
                        ],
                      );
                    },
                  );

                  if (confirmed == true) {
                    // Perform logout logic here
                    await AuthHelper.logout();
                    Navigator.pushAndRemoveUntil(
                        context,
                    MaterialPageRoute(builder: (context) =>MyLogin()),
                        (route) => false);
                  }

                }
              },
              itemBuilder: (BuildContext context) {
            return ['Setting', 'Logout'].map((String choice) {
              return PopupMenuItem<String>(
                child: Text(choice),
                value: choice,
              );
            }).toList();
          })
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Align(
                  alignment: Alignment.bottomLeft,
                    child: Text('Welcome!', style: TextStyle(color: Colors.white, fontSize: 24))
                )
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              selected: _selectedIndex == 0,
              selectedTileColor: Colors.blue.shade100,
              onTap: () => _onSelectDrawerItem(0),
            ),
            ListTile(
              leading: const Icon(Icons.account_box),
              title: const Text("Profile"),
              selected: _selectedIndex == 1,
              selectedTileColor: Colors.blue.shade100,
              onTap: () => _onSelectDrawerItem(1),

            ),
            Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Setting"),
              selected: _selectedIndex == 2,
              selectedTileColor: Colors.blue.shade100,
              onTap: () => _onSelectDrawerItem(2),
            )
          ],
        ),
      ),
      body: _Screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onSelectDrawerItem,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      )
    );
  }
}
