// ignore_for_file: deprecated_member_use
import 'package:about_you_code_challenge/Constant/constant.dart';
import 'package:about_you_code_challenge/ContactItems/view_details.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AlphaGroupedListView extends StatefulWidget {
// the widget  will take 3 arguments (List<String>, topWidget, bottomWidget)
  final List<String> stringList; //Contacts
  Widget top;
  Widget bottom;
  // ignore: use_key_in_widget_constructors
  AlphaGroupedListView(this.stringList, this.top, this.bottom);

  @override
  _AlphaGroupedListViewState createState() => _AlphaGroupedListViewState();
}

class _AlphaGroupedListViewState extends State<AlphaGroupedListView> {
  //For Searching editing controller
  TextEditingController searchController = TextEditingController();
  late double width;
  late double height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
// Using CustomScrollView  and SliverList
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: HeaderWidget(searchWidget: searchingWidget()),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (_, index) => _groupedListView(context, widget.stringList),
                childCount: 1),
          )
        ],
      ),
    );
  }

// This is the searching widget
  Widget searchingWidget() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          searchTextField(
              width, height, searchController, 'Tap to search contacts', (str) {
            setState(() {});
          }, () {
            setState(() {});
          }),
        ]));
  }

// Here I did the grouping of list in which all data is displayed in one continuous scrolling list
// Only visible items will be rendered
  Widget _groupedListView(BuildContext context, List<String> listData) {
    String currentChar = '/';
    listData.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: SizedBox(
        width: width,
        height: height - 138,
        child: Builder(builder: (context) {
          if (searchController.text.isNotEmpty) {
            listData = listData.where((e) {
              if (e
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase().trim())) {
                return true;
              }
              return false;
            }).toList();
          } else {
            listData = listData;
          }

          return Column(
            children: [
              widget.top,
              Expanded(
                child: ListView(
                  children: [
                    ...listData.map((e) {
                      String startChar = e.substring(0, 1);
                      bool isNew = false;
                      if (currentChar.toLowerCase() !=
                          startChar.toLowerCase()) {
                        isNew = true;
                        currentChar = startChar;
                      }

                      return listItem(e, isNew, currentChar, width, height);
                    }).toList()
                  ],
                ),
              ),
              widget.bottom
            ],
          );
        }),
      ),
    );
  }

  listItem(String name, bool isNew, String currentChar, width, height) {
    return Column(
      children: [
        if (isNew)
          Container(
            width: width,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.25),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('   ${currentChar.toUpperCase()}'),
              ],
            ),
          ),

        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => view_detail(name),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                width * 0.05, height * 0.01, width * 0.05, 0),
            child: Container(
              width: width,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    //Here I am calling the contacts so that they appear in order
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.6,
                          child: Text(
                            name,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //This the divider for contacts so that is visable clearly
        Padding(
          padding: EdgeInsets.fromLTRB(width * 0.05, 0, 0, 0),
          child: const Divider(
            height: 1,
          ),
        ),
      ],
    );
  }

//Here is the Search Text Fields
  Widget searchTextField(
    double width,
    double height,
    TextEditingController controllerValue,
    String text,
    void Function(String) onChangeT,
    void Function() state,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, height * 0.02, 0, 0),
      child: StatefulBuilder(builder: (context, setState1) {
        return Container(
          width: width - 40,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[100],
          ),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: onChangeT,
            onFieldSubmitted: onChangeT,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            controller: controllerValue,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              hintText: text,
              hintStyle: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class HeaderWidget extends SliverPersistentHeaderDelegate {
  final Widget searchWidget;

  HeaderWidget({required this.searchWidget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.network(
          imageBackground1,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 2,
                ),
                //This is the heading on the very top of the Screen
                const Text(
                  "Contacts",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                  ),
                ),
                //Here I am calling the search widget
                searchWidget,
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 137;

  @override
  double get minExtent => 137;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
