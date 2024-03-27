import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:number_to_words_english/number_to_words_english.dart';

void main() => runApp(const RefreshIndicatorExampleApp());

class RefreshIndicatorExampleApp extends StatelessWidget {
  const RefreshIndicatorExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior()
          .copyWith(dragDevices: PointerDeviceKind.values.toSet()),
      home: const RefreshIndicatorExample(),
    );
  }
}

class RefreshIndicatorExample extends StatelessWidget {
  const RefreshIndicatorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RefreshIndicator'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Replace this delay with the code to be executed during refresh
          // and return asynchronous code
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        // notificationPredicate: (ScrollNotification notification) {
        //   return notification.depth == 1;
        // },
        child: CustomScrollView(
          slivers: <Widget>[
            // SliverToBoxAdapter(
            //   child: Container(
            //     color: Colors.purple[50],
            //     height: 300,
            //     child: ListView.builder(
            //       itemCount: 25,
            //       itemBuilder: (BuildContext context, int index) {
            //         return ListTile(
            //           title: Text('$index'),
            //           subtitle: Text(
            //               NumberToWordsEnglish.convert(index).toUpperCase()),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            SliverList.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return  ListTile(
                    title: Text('$index'),
                    subtitle: Text(NumberToWordsEnglish.convert(index).toUpperCase()),
                  );
                })
          ],
        ),
      ),
    );
  }
}
