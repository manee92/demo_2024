import 'package:flutter/material.dart';

void main() => runApp(const NavigationRailExampleApp());

class NavigationRailExampleApp extends StatelessWidget {
  const NavigationRailExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.green),
      home: const NavRailExample(),
    );
  }
}

class NavRailExample extends StatefulWidget {
  const NavRailExample({super.key});

  @override
  State<NavRailExample> createState() => _NavRailExampleState();
}

class _NavRailExampleState extends State<NavRailExample> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  double groupAlignment = 1.0;
  bool isMobile = true;

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var isMobile = shortestSide < 600;

    if (isMobile) {
      return mobileLayout();
    } else {
      return tabLayout();
    }
  }

  Widget mobileLayout() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.account_circle),
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.image),
            icon: Icon(Icons.image_outlined),
            label: 'Gallery',
          ),
        ],
      ),
      body: <Widget>[
        const HomeScreen(),
        const ProfileScreen(),
        GalleryScreen()
      ][_selectedIndex],
    );
  }

  Widget tabLayout() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation"),
      ),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: _selectedIndex,
              groupAlignment: groupAlignment,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: labelType,
              leading: FloatingActionButton(
                elevation: 0,
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz_rounded),
              ),
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  selectedIcon: Icon(Icons.account_circle),
                  icon: Icon(Icons.account_circle_outlined),
                  label: Text('Profile'),
                ),
                NavigationRailDestination(
                  selectedIcon: Icon(Icons.image),
                  icon: Icon(Icons.image_outlined),
                  label: Text('Gallery'),
                ),
              ],
            ),
            //optional
            // const VerticalDivider(thickness: 1, width: 1),
            // This is the main content.
            Expanded(
                child: <Widget>[
              const HomeScreen(),
              const ProfileScreen(),
              GalleryScreen()
            ][_selectedIndex]),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var isMobile = shortestSide < 600;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            height: isMobile ? 200.0 : 400.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/animals/ani-5.jpg"),
              ),
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: width,
            height: height / 3,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Recommended for you",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: height / 6,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/animals/ani-1.jpg"),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: height / 6,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/animals/ani-3.jpg"),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Icon(Icons.account_circle_outlined));
  }
}

class GalleryScreen extends StatelessWidget {
  GalleryScreen({Key? key}) : super(key: key);
  final List<String> imageList = [
    "assets/animals/ani-1.jpg",
    "assets/animals/ani-2.jpg",
    "assets/animals/ani-3.jpg",
    "assets/animals/ani-4.jpg",
    "assets/animals/ani-5.jpg",
    "assets/animals/ani-6.jpg",
    "assets/animals/ani-7.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 6,
      ),
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return Container(
          width: 100,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              image: DecorationImage(
                  image: AssetImage(imageList[index]), fit: BoxFit.cover)),
        );
      },
    );
  }
}
