import 'package:flutter/material.dart';

void main() => runApp(const CheckboxExampleApp());

class CheckboxExampleApp extends StatelessWidget {
  const CheckboxExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: const Color(0xffffdbc9),
        brightness: Brightness.light
      ),
      title: 'Checkbox Sample',
      home: Scaffold(
        appBar: AppBar(title: const Text('Spicy Crispy Chicken Burger')),
        body: const Center(
          child: CheckboxExample(),
        ),
      ),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool? tomatoChecked = false;
  bool? cheeseChecked = false;
  bool? cucumberChecked = false;
  bool? bbqChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Image(image: AssetImage("assets/burger.jpg")),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "LKR 1200.65",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 18),
              const Text(
                  "Made with white meat chicken, breaded and topped with shredded lettuce, creamy mayonnaise and red chilli sauce on a corn dusted bun."),
              const SizedBox(height: 18),
              const Text("Choice of Add ons", style: TextStyle(fontWeight: FontWeight.w500),),
              Row(
                children: [
                  Checkbox(
                    tristate: true,
                    value: tomatoChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        tomatoChecked = value;
                      });
                    },
                  ),
                  const Text("Tomato")
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: cheeseChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        cheeseChecked = value;
                      });
                    },
                  ),
                  const Text("Cheese Slice")
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: cucumberChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        cucumberChecked = value;
                      });
                    },
                  ),
                  const Text("Pickled Cucumber")
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: bbqChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        bbqChecked = value;
                      });
                    },
                  ),
                  const Text("Extra BBQ Sauce")
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Photo by <a href="https://unsplash.com/@robinstickel?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Robin Stickel</a> on <a href="https://unsplash.com/photos/selective-focus-photography-of-burger-patty-mayonnaise-and-french-fries-served-on-platter-tzl1UCXg5Es?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>
