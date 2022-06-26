import 'dart:convert';
import 'dart:developer';
import 'connexion.dart';

import 'package:flutter/material.dart';

var bannerItems = ["bouillon", "ndole", "riz", "poulet", "okok", "fufu"];
var bannerImage = [
  "images/bouillon.png",
  "images/ndole.png",
  "images/riz.png",
  "images/poulet.png",
  "images/okok.png",
  "images/fufu.png"
];

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Future<List<Widget>> createList() async {
      List<Widget> items = <Widget>[];
      String dataString =
          await DefaultAssetBundle.of(context).loadString("assets/data.json");
      List<dynamic> dataJSON = jsonDecode(dataString);
      log("Data form json file");
      log(dataString);

      dataJSON.forEach((object) {
        String finalString = "";
        List<dynamic> dataList = object["placeItems"];
        dataList.forEach((item) {
          finalString = finalString + item + " | ";
        });

        items.add(Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2.0,
                      blurRadius: 5.0),
                ]),
            margin: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  child: Image.asset(
                    object["placeImage"],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(object["placeName"]),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                          child: Text(
                            finalString,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.black54,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        Text(
                          "Min. Commandes: ${object["minOrder"]}",
                          style:
                              const TextStyle(fontSize: 12.0, color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
      });

      return items;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("DORA FOOD"),
        ),
        body: Container(
          height: screenHeight,
          width: screenWidth,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                            icon: const Icon(Icons.menu), onPressed: () {}),
                        const Text(
                          "DORA FOODS",
                          style: TextStyle(fontSize: 25),
                        ),
                        IconButton(
                          icon: const Icon(Icons.person),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return Connexion();
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  BannerWidgetArea(),
                  Container(
                      child: FutureBuilder(
                          initialData: const <Widget>[Text("")],
                          future: createList(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView(
                                  primary: false,
                                  shrinkWrap: true,
                                  children: snapshot.data as List<Widget>,
                                ),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          })),
                ],
              ),
            ),
          ),
        ));
  }
}

class BannerWidgetArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 1);
    List<Widget> banners = <Widget>[];
    for (int x = 0; x < bannerItems.length; x++) {
      var bannerView = Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                          spreadRadius: 1.0)
                    ]),
              ),
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  child: Image.asset(
                    bannerImage[x],
                    fit: BoxFit.cover,
                  )),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bannerItems[x],
                      style:
                          const TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                    const Text(
                      "merci beaucoup",
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }

    return Container(
      width: screenWidth,
      height: screenWidth * 9 / 16,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}
