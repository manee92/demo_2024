import 'package:flutter/material.dart';

void main() => runApp(const NavigationDrawerApp());

class NavigationDrawerApp extends StatelessWidget {
  const NavigationDrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("My Mails"),),
      drawer: NavigationDrawer(
        onDestinationSelected: handleScreenChanged,
        selectedIndex: screenIndex,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 12.0, bottom: 20),
            child: Text("Mail", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
          ),
          NavigationDrawerDestination(icon: Icon(Icons.edit_outlined), label: Text("Add a status")),
          Divider(),
          NavigationDrawerDestination(icon: Icon(Icons.mail_outline), label: Text("All inboxes")),
          NavigationDrawerDestination(icon: Icon(Icons.description_outlined), label: Text("Primary")),
          NavigationDrawerDestination(icon: Icon(Icons.label_outline), label: Text("Promotion")),
          NavigationDrawerDestination(icon: Icon(Icons.people_alt_outlined), label: Text("Social")),
          Divider(),
          NavigationDrawerDestination(icon: Icon(Icons.star_border), label: Text("Starred")),
          NavigationDrawerDestination(icon: Icon(Icons.label_important_outline), label: Text("Important")),
          Divider(),
          NavigationDrawerDestination(icon: Icon(Icons.drafts_outlined), label: Text("Drafts")),
          NavigationDrawerDestination(icon: Icon(Icons.delete_outline_outlined), label: Text("Trash")),
        ],
      ),
      body: const Column(),
    );
  }
}

