import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/gen/assets.gen.dart';
import 'package:flutter_practice_ui/models/fake_data.dart';
import 'package:flutter_practice_ui/models/model.dart';
import 'package:flutter_practice_ui/my_strings.dart';
import 'package:iconsax/iconsax.dart';
import 'home_screen.dart';

// ignore: todo
//TODO: to get the last index in the listview just write: myList.length - 1
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int getLastIndex(List list) {
    return list.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    // finding max price in populars list
    var popularsWithMostPrice = popularsList
        .reduce((item1, item2) => item1.price < item2.price ? item2 : item1);

    List allTypesList = ["Cabin", "Cottage"];
    List allLocationsList = ["San Diego", "United States", "Nashville"];

    List newList = [];
    if (newList.isEmpty) {
      newList = popularsList;
      newList.addAll(inprogressList);
    }

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 20;
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 241, 241, 241),
            appBar: AppBar(
              elevation: 0.5,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              actions: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: bodyMargin),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: ImageIcon(
                              AssetImage(Assets.icons.kebabmenu.path),
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                children: const [
                                  Text(
                                    "Scan to Shop",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Iconsax.scanner,
                                    color: Colors.black,
                                    size: 27,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                )
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(size.height / 9),
                child: Padding(
                  padding: EdgeInsets.only(left: bodyMargin, bottom: 16),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 270,
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 5),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    CupertinoIcons.search,
                                    size: 30,
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      MyStrings.whereTo,
                                      style: textTheme.headline2,
                                    ),
                                    const Text(
                                      MyStrings.appBarSubtitle,
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: InkWell(
                          onTap: () {
                            filterBottomSheet(context, size, textTheme,
                                bodyMargin, allTypesList, allLocationsList);
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 5)
                                ],
                                image: DecorationImage(
                                  image: AssetImage(Assets.icons.filter.path),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: Stack(
              children: [
                homeScreen(bodyMargin, textTheme, size),
                BottomNav(size: size)
              ],
            )));
  }

  filterBottomSheet(
      BuildContext context,
      Size size,
      TextTheme textTheme,
      double bodyMargin,
      List<dynamic> allTypesList,
      List<dynamic> allLocationsList) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: ((context) {
          return Container(
            height: size.height / 1.7,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Filter",
                        style: textTheme.headline4,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: const [
                    Divider(
                      height: 2,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: bodyMargin, top: 16),
                  child: Text(
                    "type:",
                    style: textTheme.headline6,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(left: bodyMargin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              color: Colors.black),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(allTypesList[0],
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 17)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: Colors.black),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              allTypesList[1],
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: const [
                    Divider(
                      height: 2,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: bodyMargin, top: 16),
                  child: Text(
                    "location:",
                    style: textTheme.headline6,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(left: bodyMargin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        height: 50,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: Colors.black),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(allLocationsList[0],
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 15)),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: Colors.black),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              allLocationsList[1],
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: Colors.black),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              allTypesList[1],
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width / 3,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Start Filtering",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }));
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: size.height / 12,
          decoration: const BoxDecoration(
              color: Colors.white,
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: .2))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.heart,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.shopping_cart)),
              IconButton(onPressed: () {}, icon: const Icon(Iconsax.home_24)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Iconsax.search_normal)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Iconsax.document_filter)),
            ],
          ),
        ));
  }
}
