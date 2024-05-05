// import 'package:dosify_app/utils/constants/colors.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:dosify_app/utils/constants/sizes.dart' as sizes;

// class showaddListModal extends StatefulWidget {
//   final TextEditingController controller;
//   const showaddListModal({
//     super.key, 
//     required this.controller,
//   });

//   @override
//   State<showaddListModal> createState() => _showaddListModalState();
// }

// class _showaddListModalState extends State<showaddListModal> {
//   // TextEditingController _controller = TextEditingController();

//   void addNewList(String newListName) {
//     setState(() {
//       data.add(newListName);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(13),
//           topRight: Radius.circular(13),
//         ),
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.9,
//           decoration: BoxDecoration(
//             color: GColors.textPrimary,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(13),
//               topRight: Radius.circular(13),
//             ),
//           ),
//           child: ListView(
//             shrinkWrap: true,
//             children: [
//               AppBar(
//                 backgroundColor: GColors.textPrimary,
//                 title: Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextButton(
//                         onPressed: () {
//                           FocusScope.of(context).unfocus();
//                           if (widget.controller.text.isNotEmpty){
//                             addNewList(widget.controller.text);
//                             Navigator.pop(context);
//                           } else {
//                             Navigator.pop(context);
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text(
//                                   'Nama List Harus Di Isi',
//                                   style: TextStyle(
//                                     color: GColors.primaryBackground,
//                                     fontFamily: 'Poppins',
//                                     fontSize: sizes.GSizes.fontSizeMd,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                                 ),
//                                 backgroundColor: Color(0xFFFFF2D8),
//                                 behavior: SnackBarBehavior.floating,
//                                 action: SnackBarAction(
//                                   label: 'Dismiss',
//                                   disabledTextColor: Colors.white,
//                                   textColor: GColors.primaryBackground,
//                                   onPressed: () {
//                                     //Do whatever you want
//                                   },
//                                 ),
//                               ),
//                             );
//                           }
//                         },
//                         child: Text(
//                           'Done',
//                           style: TextStyle(
//                             fontFamily: 'Poppins',
//                             fontSize: sizes.GSizes.fontSizeLg,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       const Spacer(),
//                       Text(
//                         'Add List',
//                         style: const TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: sizes.GSizes.fontSizeLg,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const Spacer(),
//                       IconButton(
//                         icon: const Icon(
//                           Icons.close,
//                           color: Colors.white,
//                         ),
//                         onPressed: () {
//                           FocusScope.of(context).unfocus();
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 automaticallyImplyLeading: false,
//                 elevation: 0,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 30),
//                 child: TextField(
//                   controller: _controller,
//                   focusNode: _focusNode,
//                   autofocus: true, 
//                   maxLines: null,
//                   decoration: InputDecoration(
//                     hintText: 'Enter your task',
//                     hintStyle: TextStyle(
//                       color: Colors.white,
//                     ),
//                     border: InputBorder.none,
//                   ),
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: sizes.GSizes.fontSizeMd,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );;
//   }
// }