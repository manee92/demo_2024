import 'package:flutter/material.dart';

void main() {
  runApp(const CardExamplesApp());
}

class CardExamplesApp extends StatelessWidget {
  const CardExamplesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: const Color(0xffaac5f0)),
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Cards')),
        // body: const Center(child: SampleCardList()),
        body: const Center(child: DataCardList()),
        // body:
        //     const SingleChildScrollView(child: Center(child: _ImageCardList())),
      ),
    );
  }
}

class SampleCardList extends StatelessWidget {
  const SampleCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(child: _SampleCard(cardName: 'Elevated Card')),
        Card.filled(child: _SampleCard(cardName: 'Filled Card')),
        Card.outlined(child: _SampleCard(cardName: 'Outlined Card')),
      ],
    );
  }
}

class _SampleCard extends StatelessWidget {
  const _SampleCard({required this.cardName});
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 100,
      child: Center(child: Text(cardName)),
    );
  }
}

class DataCardList extends StatelessWidget {
  const DataCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
              child: _DataCard(
            title: 'Get 50% off',
            subTitle: "Other regulated items may not eligible",
            button: FilledButton(
                onPressed: () {}, child: const Text('Get started')),
          )),
          Card.filled(
              child: _DataCard(
            title: 'Get 50% off',
            subTitle: "Other regulated items may not eligible",
            button: OutlinedButton(
                onPressed: () {}, child: const Text('Get started')),
          )),
          Card.outlined(
              child: _DataCard(
            title: 'Get 50% off',
            subTitle: "Other regulated items may not eligible",
            button: FilledButton.tonal(
                onPressed: () {}, child: const Text('Get started')),
          )),
        ],
      ),
    );
  }
}

class _DataCard extends StatelessWidget {
  const _DataCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.button})
      : super(key: key);
  final String title;
  final String subTitle;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(subTitle),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [button],
          )
        ],
      ),
    );
  }
}

class _ImageCardList extends StatelessWidget {
  const _ImageCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: _ImageCard(
                title: 'Travel with us',
                image: "travel1.webp",
                subTitle: "Other regulated items may not eligible",
                button: FilledButton(
                    onPressed: () {}, child: const Text('Get started')),
              )),
          const SizedBox(height: 10),
          Card.filled(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: _ImageCard(
                title: 'Get 50% off',
                image: "travel2.webp",
                subTitle: "Other regulated items may not eligible",
                button: OutlinedButton(
                    onPressed: () {}, child: const Text('Get started')),
              )),
          const SizedBox(height: 10),
          Card.outlined(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: _ImageCard(
                title: 'Join your friends',
                image: "travel3.webp",
                subTitle: "Other regulated items may not eligible",
                button: FilledButton.tonal(
                    onPressed: () {}, child: const Text('Get started')),
              )),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  const _ImageCard(
      {Key? key,
      required this.title,
      required this.image,
      required this.subTitle,
      required this.button})
      : super(key: key);
  final String title;
  final String image;
  final String subTitle;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 120,
          width: w,
          child: Image.asset(
            "assets/$image",
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(subTitle),
              const SizedBox(height: 10),
              Row(
                children: [button],
              )
            ],
          ),
        )
      ],
    );
  }
}
