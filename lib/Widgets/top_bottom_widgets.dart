// ignore_for_file: deprecated_member_use
import 'package:about_you_code_challenge/Constant/constant.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//This file contains the widget for the top and bottom .{reusable code}
class top_Bottom_Widget extends StatelessWidget {
  const top_Bottom_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Text(
              textExpandButton,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 4),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ExpandChild(
                    expandDirection: Axis.vertical,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.13,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...List.generate(
                              10,
                              (index) => Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: OutlinedButton(
                                  onPressed: () {
                                    Fluttertoast.showToast(
                                        msg: "Have a nice day",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: toastColor,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  },
                                  child: const Text(buttonText),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
