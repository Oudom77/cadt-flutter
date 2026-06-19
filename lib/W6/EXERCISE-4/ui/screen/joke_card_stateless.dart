// import 'package:flutter/material.dart';

// class JokeCardStateless extends StatelessWidget{

//   const JokeCardStateless({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         border: Border(
//           bottom: BorderSide(width: .5, color: Colors.grey),
//         ),
//       ),
//       padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
//       height: 200,
//       child: GestureDetector(
//         behavior: HitTestBehavior.opaque,
//         onTap: () {
//           setState(() {
//             isClicked = !isClicked;
//           });
//         },        
//         child: Container(
//           padding: EdgeInsets.all(30),
//           child: Row(
//             mainAxisAlignment: .spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: .start,
//                 mainAxisAlignment: .spaceBetween,
//                 children: [
//                   Text(
//                     jokeData.title,
//                     style: TextStyle(
//                       fontSize: 24
//                     ),
//                   ), 
//                   Text(
//                     isClicked ? "${jokeData.joke}\n${jokeData.punchline}" : jokeData.joke
//                   )
//                 ],
//               ),
//               Column(
//                 mainAxisAlignment: .spaceBetween,
//                 children: [
//                   IconButton(
//                     onPressed: onFavoriteClick,
//                     icon: Icon(
//                       _isFavorite ? Icons.favorite : Icons.favorite_border,
//                       color: _isFavorite ? Colors.red : Colors.grey,
//                     )
//                   ),
//                   IconButton(
//                     onPressed: showDetails,
//                     icon: Icon(Icons.menu_open)
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       )
//     );
//   }

// }