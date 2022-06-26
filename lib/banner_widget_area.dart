// import 'package:flutter/material.dart';
//
//
// var bannerItems = ["crevette","sandwish","frites"];
// var bannerImage = [
//   "images/bouillon.png",
//   "images/ndole.png",
//   "images/riz.png",
//   "images/poulet.png",
//   "images/okok.png",
//   "images/fufu.png"
// ];
// class BannerWidgetArea extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//     PageController controller = PageController(viewportFraction: 0.8, initialPage: 1);
//     for(int x=0; x<bannerItems.length;x++ ){
//       var bannerView = Padding(padding: EdgeInsets.all(10.0),
//           child: Container(
//         child: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(20.0)),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black54,
//                   offset: Offset(2.0,2.0),
//                   blurRadius: 5.0,
//                   spreadRadius: 1.0
//                 )
//               ]
//             ),
//           ),
//
//           ClipRRect(
//             borderRadius: BorderRadius.all(Radius.circular(20.0)),
//          child: Image.asset(bannerImage[x],fit: BoxFit.cover,)
//           ),
//
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(20.0)),
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [Colors.transparent, Colors.black]
//               ),
//             ),
//           ),
//
//           Padding(
//               padding: EdgeInsets.all(10.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end ,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   bannerItems[x],
//                   style: TextStyle(fontSize: 12.0,color: Colors.white),
//                 ),
//                 Text("merci beaucoup", style: TextStyle(fontSize: 12.0,color: Colors.white),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     ),
//       );
//       banners.add(bannerView);
//     }
//
//     return Container(
//       width: screenWidth,
//       height: screenWidth*9/16,
//       child: PageView(
//         controller: controller,
//         scrollDirection: Axis.horizontal,
//         children: banners,
//       ),
//     );
//   }
// }
//
