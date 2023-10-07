import 'package:flutter/material.dart';
// import 'package:juridentt/authentication/category/category.dart';
import 'package:juridentt/bookmarks/bookmarkspage.dart';
import 'package:juridentt/files/myfile.dart';
import 'package:juridentt/files/myfiles3.dart';
import 'package:juridentt/notifications.dart';
import 'package:juridentt/authentication/general/login.dart';
import 'package:juridentt/resources/auth.dart';
import 'addcase/provider.dart';
import 'package:provider/provider.dart';

import 'hamburgerMenu/hamburgerIcon.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: themeProvider.hamtext),
          centerTitle: true,
          backgroundColor: const Color(0xff050125),
          title: Text(
            "Edit Profile",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: themeProvider.hamtext,
            ),
          ),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Profile()));
                },
                child: Container(
                    // width: 35,
                    decoration: BoxDecoration(
                      // color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.notifications_outlined,
                      color: themeProvider.hamtext,
                    )),
              ),
            ),
          ],
        ),
        drawer: const HamburgerIcon(),
        body: Container(
          decoration:
              BoxDecoration(gradient: themeProvider.scaffoldGradientscrol),
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addcase');
                  },
                  child: const Text('Add new case'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/viewcase');
                  },
                  child: const Text('view case'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Auth().signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(), //Category(),
                      ),
                    );
                  },
                  child: const Text('Logout'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sharedcases');
                  },
                  child: const Text('shared'),
                ),
                IconButton(
                  icon: Icon(
                    themeProvider.isDarkModeEnabled
                        ? Icons.light_mode
                        : Icons.dark_mode,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    themeProvider.toggleTheme();
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookmarksPage(),
                      ),
                    );
                  },
                  child: const Text('Bookmarks'),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const BookmarksPage2(),
                //       ),
                //     );
                //   },
                //   child: const Text('Bookmarks2'),
                // ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Myfiles(),
                      ),
                    );
                  },
                  child: const Text('My Files'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const newCases(),
                      ),
                    );
                  },
                  child: const Text('notification creator'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Myfiles3(),
                      ),
                    );
                  },
                  child: const Text('My Files(NEW)'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
