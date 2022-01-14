// ignore_for_file: deprecated_member_use

import 'package:about_you_code_challenge/Constant/constant.dart';
import 'package:about_you_code_challenge/ContactItems/alpha_group_listview.dart';
import 'package:about_you_code_challenge/Widgets/top_bottom_widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Challenge',
      theme: ThemeData(
        primarySwatch: themeColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: titletext),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //This is the custom local list.This list will be rendored
  List<String> contactnames = [
    'Adi Shamir',
    'Alan Kay',
    'Andrew Yao',
    'Barbara Liskov',
    'Kristen Nygaard',
    'Leonard Adleman',
    'Leslie Lamport',
    'Ole-Johan Dahl',
    'Peter Naur',
    'Robert E. Kahn',
    'Ronald L. Rivest',
    'Vinton G. Cerf',
    'Adi Shamir',
    'Alan Kay',
    'Andrew Yao',
    'Barbara Liskov',
    'Kristen Nygaard',
    'Leonard Adleman',
    'Leslie Lamport',
    'Ole-Johan Dahl',
    'Peter Naur',
    'Robert E. Kahn',
    'Ronald L. Rivest',
    'Vinton G. Cerf',
  ];

  @override
  Widget build(BuildContext context) {
    //bool isLoading = false;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Press the button below to test: ',
            ),
            //Material Button on the first screen of the app
            MaterialButton(
              color: materialButtonColor,
              child: Text(
                materialButtonText,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.white),
              ),
              onPressed: () {
                // setState(() {
                //   isLoading = true;
                // });
                //Here I called the Widget (Navigate to groupList page) .
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlphaGroupedListView(
                      //Here the widget I developed will take 3 arguments (List<String>, topWidget, bottomWidget)
                      contactnames,
                      const top_Bottom_Widget(),
                      const top_Bottom_Widget(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
