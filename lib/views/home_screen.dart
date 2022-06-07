import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../models/fake_data.dart';
import '../models/model.dart';
import '../my_strings.dart';

int getLastIndex(List list) {
  return list.length - 1;
}

homeScreen(double bodyMargin, TextTheme textTheme, Size size) {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(bodyMargin, 24, 0, 0),
          child: Text(
            MyStrings.inspiration,
            style: textTheme.headline2,
          ),
        ),
        
        const SizedBox(
          height: 16,
        ),

        suggestionList(bodyMargin, textTheme),
        
        const SizedBox(
          height: 32,
        ),
        
        Padding(
          padding: EdgeInsets.only(left: bodyMargin),
          child: Text(
            MyStrings.popularOnPine,
            style: textTheme.headline4,
          ),
        ),
        
        const SizedBox(
          height: 16,
        ),

        popularList(bodyMargin, textTheme),
        
        const SizedBox(
          height: 32,
        ),
        
        Padding(
          padding: EdgeInsets.only(left: bodyMargin),
          child: Text(
            MyStrings.inProgress,
            style: textTheme.headline4,
          ),
        ),
        
        const SizedBox(
          height: 16,
        ),

        inProgressList(bodyMargin, textTheme),
        
        const SizedBox(
          height: 32,
        ),
        
        homeScreenPoster(size, textTheme),
        
        const SizedBox(
          height: 90,
        )
      ],
    ),
  );
}




homeScreenPoster(Size size, TextTheme textTheme) {
  return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: size.width / 1.10,
                    height: size.height / 4,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                            image: NetworkImage(homePagePoster["imageUrl"]),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    left: 15,
                    top: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          homePagePoster["mainText"],
                          style: textTheme.headline5,
                          overflow: TextOverflow.clip,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 120,
                            height: 35,
                            decoration: const BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: Center(
                              child: Text(
                                homePagePoster["btnText"],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          );
}

inProgressList(double bodyMargin, TextTheme textTheme) {
  return SizedBox(
            height: 320,
            child: ListView.builder(
              itemCount: inprogressList.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? bodyMargin : 15,
                      right: index == getLastIndex(inprogressList) ? 15 : 0),
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 0.5,
                                color: Color.fromARGB(255, 187, 187, 187)))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      inprogressList[index].imgUrl),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Iconsax.location,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      inprogressList[index].location,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 24),
                                  child: Text(
                                    inprogressList[index].title,
                                    maxLines: 2,
                                    style: textTheme.headline2,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                    "\$${inprogressList[index].price} . Night"),
                                const SizedBox(
                                  height: 16,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
}

popularList(double bodyMargin, TextTheme textTheme) {
  return SizedBox(
            height: 320,
            child: ListView.builder(
              itemCount: popularsList.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? bodyMargin : 15,
                      right: index == getLastIndex(popularsList) ? 15 : 0),
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 0.5,
                                color: Color.fromARGB(255, 187, 187, 187)))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      popularsList[index].imgUrl),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Iconsax.location,
                                        color: Colors.red,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        popularsList[index].location,
                                        style: const TextStyle(
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 24),
                                    child: Text(
                                      popularsList[index].title,
                                      maxLines: 2,
                                      style: textTheme.headline2,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                      "\$${popularsList[index].price} . Night"),
                                  const SizedBox(
                                    height: 16,
                                  )
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
}

suggestionList(double bodyMargin, TextTheme textTheme) {
  return SizedBox(
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: suggetstionsList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? bodyMargin : 15,
                      right:
                          index == getLastIndex(suggetstionsList) ? 15 : 0),
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    suggetstionsList[index].imgUrl),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              suggetstionsList[index].name,
                              style: textTheme.headline3,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "${suggetstionsList[index].cabins} Cabins",
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
}