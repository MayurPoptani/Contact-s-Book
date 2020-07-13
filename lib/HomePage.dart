import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:contacts_app/Database/Database.dart';
import 'package:contacts_app/HomePage-Pages/ContactsPage.dart';
import 'package:contacts_app/HomePage-Pages/GroupsPage.dart';
import 'package:contacts_app/HomePage-Pages/functions/dialogs.dart';
import 'package:contacts_app/variables.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int _pageIndex = 0;
  PageController _pageController;
  
  @override
  void initState() {
    _pageController = PageController(initialPage: _pageIndex, keepPage: true);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: appBar(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  ContactsPage(key: PageStorageKey("ContactsPage-Key"),),
                  GroupsPage(key: PageStorageKey("GroupsPage-Key"),),
                ],
                allowImplicitScrolling: false,
                pageSnapping: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                "Made with ".text.make(),
                Icon(Icons.favorite, color: Colors.red[isDark?800:600]),
                " In Flutter".text.make(),
              ],
            ),
            // "By Mayur Poptani".text.color(Color(0xFF3F3D56)).makeCentered(),
            HeightBox(32),
          ],
        ),
        bottomNavigationBar: bottomNavBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          label: Row(children: [
            Icon(Icons.add,),
            WidthBox(8),
            "Add".text.make()
          ],),
          onPressed: () async {
            if(_pageIndex == 0) {
              Contact newContact = await addNewContactItemDialog(context);
              print("Insert ID = "+(await db.addNewOrUpdateContact(newContact)).toString());
            } else {
              MapEntry<Group,List<int>> groupNameAndContactIds = await addNewGroupItemDialog(context);
              if(groupNameAndContactIds!=null) print((await db.addNewOrUpdateGroup(groupNameAndContactIds.key, groupNameAndContactIds.value)).toString());
            }
          },
        ), 
      ),
    );
  }
  
  Widget appBar() {
    return AppBar(
      elevation: 8,
      title: Text("Contact's Book", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800,)),
      centerTitle: true,
      actions: [
        ThemeSwitcher(
          clipper: ThemeSwitcherCircleClipper(),
          builder: (_) {
            return IconButton(icon: Icon(Icons.lightbulb_outline), onPressed: () {
              isDark = !isDark;
              ThemeSwitcher.of(_).changeTheme(theme: !isDark?lightTheme:darkTheme);
            });
          },
        ),
      ],
    );
  }
  
  Widget bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _pageIndex,
      items: [
        getBottomNavItem(Icons.contacts, "Contacts"),
        getBottomNavItem(Icons.group, "Groups"),
      ],
      iconSize: 28,
      onTap: (index) async {
        _pageIndex = index;
        if(mounted) _pageController.animateToPage(_pageIndex, duration: Duration(milliseconds: 150), curve: Curves.ease).then((value) {
          if(mounted) setState(() {});
        });  
      },
    );
  }
  
  BottomNavigationBarItem getBottomNavItem(IconData iconData, String label) {
    return BottomNavigationBarItem(
      // title: label.text.size(12).medium.make(),
      title: Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
      icon: Icon(iconData),
      activeIcon: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Icon(iconData),
          ),
          Positioned(
            top: 0, right: 0,
            child: Container(
              height: 10, width: 10, 
              decoration: BoxDecoration(
                color: isDark?Color(0xFF00AEEF):Colors.blue[500],
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}