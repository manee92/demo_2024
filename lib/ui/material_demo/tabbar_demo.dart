import 'package:flutter/material.dart';

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Travel App'),
          bottom: const TabBar(
            dividerColor: Color(0xfff0f4fa),
            tabs: <Widget>[
              Tab(
                text: 'Stays',
                icon: Icon(Icons.hotel_rounded),
              ),
              Tab(
                text: 'Car rental',
                icon: Icon(Icons.car_rental),
              ),
              Tab(
                text: 'Attractions',
                icon: Icon(Icons.pin_drop_rounded),
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: <Widget>[
            ScreenOne(),
            ScreenTwo(),
            ScreenThree(),
          ],
        ),
      ),
    );
  }
}

class ScreenOne extends StatelessWidget {
   ScreenOne({Key? key}) : super(key: key);

  final List<ItemModel> hotelList = [
    const ItemModel(image: "assets/travel-images/hotel1.jpg", title: "Hotel 1", subTitle: "Lorem ipsum"),
    const ItemModel(image: "assets/travel-images/hotel2.jpg", title: "Hotel 2", subTitle: "Lorem ipsum"),
    const ItemModel(image: "assets/travel-images/hotel3.jpg", title: "Hotel 3", subTitle: "Lorem ipsum"),
    const ItemModel(image: "assets/travel-images/hotel4.jpg", title: "Hotel 4", subTitle: "Lorem ipsum"),
  ];

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(16),
        child:  GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .72,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: hotelList.map((ItemModel item) {
          return ItemCard(image: item.image, title: item.title, subTitle: item.subTitle);
        }).toList()));
  }
}

class ScreenTwo extends StatelessWidget {
   ScreenTwo({Key? key}) : super(key: key);

  final List<ItemModel> carRentalList = [
    const ItemModel(image: "assets/travel-images/car1.jpg", title: "Car rental 1", subTitle: "Lorem ipsum"),
    const ItemModel(image: "assets/travel-images/car2.jpg", title: "Car rental 2", subTitle: "Lorem ipsum"),
    const ItemModel(image: "assets/travel-images/car3.jpg", title: "Car rental 3", subTitle: "Lorem ipsum"),
    const ItemModel(image: "assets/travel-images/car4.jpg", title: "Car rental 4", subTitle: "Lorem ipsum"),
  ];

   @override
   Widget build(BuildContext context) {
     return  Padding(
         padding: const EdgeInsets.all(16),
         child:  GridView.count(
             crossAxisCount: 2,
             childAspectRatio: .72,
             padding: const EdgeInsets.all(4.0),
             mainAxisSpacing: 4.0,
             crossAxisSpacing: 4.0,
             children: carRentalList.map((ItemModel item) {
               return ItemCard(image: item.image, title: item.title, subTitle: item.subTitle);
             }).toList()));
   }
}

class ScreenThree extends StatelessWidget {
   ScreenThree({Key? key}) : super(key: key);
  final List<ItemModel> placeList = [
    const ItemModel(image: "assets/travel-images/place1.jpg", title: "Attraction 1", subTitle: "Lorem ipsum"),
    const ItemModel(image: "assets/travel-images/place2.jpg", title: "Attraction 2", subTitle: "Lorem ipsum"),
    const ItemModel(image: "assets/travel-images/place3.jpg", title: "Attraction 3", subTitle: "Lorem ipsum"),
  ];

   @override
   Widget build(BuildContext context) {
     return  Padding(
         padding: const EdgeInsets.all(16),
         child:  GridView.count(
             crossAxisCount: 2,
             childAspectRatio: .72,
             padding: const EdgeInsets.all(4.0),
             mainAxisSpacing: 4.0,
             crossAxisSpacing: 4.0,
             children: placeList.map((ItemModel item) {
               return ItemCard(image: item.image, title: item.title, subTitle: item.subTitle);
             }).toList()));
   }
}

class ItemModel{
  final String image;
  final String title;
  final String subTitle;

  const ItemModel(
      {
        required this.image,
        required this.title,
        required this.subTitle});

}

class ItemCard extends StatelessWidget {
  const ItemCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.subTitle})
      : super(key: key);
  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
              )
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 2),
            child: Text(subTitle),
          ),
        ],
      ),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Primary and secondary TabBar'),
          bottom: const TabBar(
            dividerColor: Colors.transparent,
            tabs: <Widget>[
              Tab(
                text: 'Flights',
                icon: Icon(Icons.flight),
              ),
              Tab(
                text: 'Trips',
                icon: Icon(Icons.luggage),
              ),
              Tab(
                text: 'Explore',
                icon: Icon(Icons.explore),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            NestedTabBar('Flights'),
            NestedTabBar('Trips'),
            NestedTabBar('Explore'),
          ],
        ),
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar.secondary(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(text: 'Overview'),
            Tab(text: 'Specifications'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(child: Text('${widget.outerTab}: Overview tab')),
              ),
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(
                    child: Text('${widget.outerTab}: Specifications tab')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
