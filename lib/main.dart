import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:contacts_app/Database/Database.dart';
import 'package:contacts_app/variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:contacts_app/HomePage.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  db = Database();
  runApp(ContactsApp());
}

//ignore: must_be_immutable
class ContactsApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    initThemes(context);
    return ThemeProvider(
      duration: Duration(milliseconds: 500),
      initTheme: lightTheme,
      child: Builder(builder: (_) {
        return MaterialApp(
          title: "Contacts App",
          theme: ThemeProvider.of(_),
          home: HomePage(),
        );
      }),
    );
  }
  
  initThemes(BuildContext context) {
    darkTheme = ThemeData.dark().copyWith(
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: GoogleFonts.ralewayTextTheme(ThemeData.dark().textTheme.apply(bodyColor: Colors.white)),
      primaryTextTheme: GoogleFonts.ralewayTextTheme(ThemeData.dark().textTheme.apply(bodyColor: Colors.white)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF212121),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
      ),
      appBarTheme: AppBarTheme(color: Color(0xFF303030), iconTheme: IconThemeData(color: Colors.white),),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        splashColor: Colors.black26,
      )
    );
    lightTheme = ThemeData.light().copyWith(
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: GoogleFonts.ralewayTextTheme(ThemeData.light().textTheme.apply(bodyColor: Colors.black)),
      primaryTextTheme: GoogleFonts.ralewayTextTheme(ThemeData.dark().textTheme.apply(bodyColor: Colors.black)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
      ),
      appBarTheme: AppBarTheme(color: Colors.white, iconTheme: IconThemeData(color: Colors.black),),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.black87,
      )
    );
  }
}