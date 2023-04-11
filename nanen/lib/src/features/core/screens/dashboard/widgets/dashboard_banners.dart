// import 'package:flutter/material.dart';

// import '../../../../../constants/colors.dart';
// import '../../../../../constants/sizes.dart';
// import '../../../../../constants/text_strings.dart';

// class DashboardBanners extends StatelessWidget {
//   const DashboardBanners({super.key, required TextTheme txtTheme});

//   final bool isDark;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         //1st banner
//         Expanded(
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               //For Dark Color
//               color: isDark ? tSeconddaryColor : tCardBgColor,
//             ),
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     Flexible(child: Image(image: AssetImage(tBookmarkIcon))),
//                     Flexible(child: Image(image: AssetImage(tBannerImage1))),
//                   ],
//                 ),
//                 const SizedBox(height: 25),
//                 Text(tDashboardBannerTitle1,
//                     style: txtTheme.headline4,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis),
//                 Text(tDashboardBannerSubTitle,
//                     style: txtTheme.bodyText2,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(width: tDashboardCardPadding),
//         //2nd Banner
//         Expanded(
//           child: Column(
//             children: [
//               //Card
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   //For Dark Color
//                   color: isDark ? tSeconddaryColor : tCardBgColor,
//                 ),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: const [
//                         Flexible(
//                             child: Image(image: AssetImage(tBookmarkIcon))),
//                         Flexible(
//                             child: Image(image: AssetImage(tBannerImage2))),
//                       ],
//                     ),
//                     Text(tDashboardBannerTitle2,
//                         style: txtTheme.headline4,
//                         overflow: TextOverflow.ellipsis),
//                     Text(tDashboardBannerSubTitle,
//                         style: txtTheme.bodyText2,
//                         overflow: TextOverflow.ellipsis),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 5),
//               SizedBox(
//                 width: double.infinity,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: OutlinedButton(
//                       onPressed: () {}, child: const Text(tDashboardButton)),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
