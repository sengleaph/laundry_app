// import 'package:flutter/material.dart';

// class TimelineItem extends StatelessWidget {
//   final String date;
//   final String time;
//   final String title;
//   final bool isActive;
//   final String icon;

//   const TimelineItem({
//     required this.date,
//     required this.time,
//     required this.title,
//     required this.icon,
//     this.isActive = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(
//           children: [
//             Container(
//               width: 10,
//               height: 10,
//               decoration: BoxDecoration(
//                 color: isActive ? Colors.orange : Colors.grey,
//                 shape: BoxShape.circle,
//               ),
//             ),
//             if (!isActive) VerticalDivider(color: Colors.grey, thickness: 1),
//           ],
//         ),
//         SizedBox(width: 16),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('$date $time', style: TextStyle(fontSize: 12)),
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
