import 'package:about_you_code_challenge/Constant/constant.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class view_detail extends StatelessWidget {
  String name;
  view_detail(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(child: Text(this.name)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                SizedBox(width: 20.0),
                Container(
                    width: 80.0,
                    height: 80.0,
                    child: const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                            radius: 35.0,
                            backgroundImage: NetworkImage(imageBackground1)))),
                const SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    const Text("  Mehak Nigar"),
                    const SizedBox(height: 5.0),
                    Row(
                      children: const <Widget>[
                        Icon(
                          Icons.map,
                          size: 12.0,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          "Frankfurt, Germany",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
