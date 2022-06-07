import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/views/main_screen.dart';
import '../my_strings.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var bodyMargin = size.width / 20;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: SizedBox(
                    width: double.infinity,
                    height: size.height / 2.5,
                    child: Stack(
                      children: [
                        Positioned(
                          child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(15 / 360),
                            child: Container(
                              width: size.width / 1.5,
                              height: size.height / 2.8,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(32)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://i.pinimg.com/originals/19/91/71/1991717e8ccd2f7944b2997cb0e334f2.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(-10 / 360),
                            child: Container(
                              width: size.width / 1.5,
                              height: size.height / 2.8,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(32)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "http://na.rdcpix.com/1853845998/ab56a5a91431644dc57e031e9b665a54w-c176314xd-w640_h480_q80.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: bodyMargin, top: 32),
                  child: Column(
                    children: [
                      Text(
                        MyStrings.firstScreenHeadLineText,
                        style: textTheme.headline1,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: Text(
                          MyStrings.firstScreenSubtitleText,
                          style: textTheme.subtitle1,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const BottomButton()
          ],
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 20,
        left: 15,
        right: 15,
        child: InkWell(
          splashColor: Colors.greenAccent,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(32)),
            child: Container(
              color: Colors.white,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    MyStrings.getStarted,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
