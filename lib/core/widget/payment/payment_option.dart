// import 'package:flutter/material.dart';

// class PaymentOption extends StatelessWidget {
//   final String title;
//   final String description;
//   final Image image;
//   final Color color;

//   const PaymentOption({
//     Key? key,
//     required this.title,
//     required this.description,
//     required this.image,
//     required this.color,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade200,
//             blurRadius: 9,
//             spreadRadius: 0,
//             offset: const Offset(0, 0),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           CircleAvatar(
//             backgroundColor: color,
//             child: Icon(image, color: Colors.white),
//           ),
//           SizedBox(width: 16),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 description,
//                 style: TextStyle(color: Colors.grey.shade600),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }