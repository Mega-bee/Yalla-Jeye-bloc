// import 'package:brandsome/abstracts/model/menu_item.dart';
// import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
// import 'package:flutter/material.dart';
//
// import '../../abstracts/model/menu_item.dart';
//
// class CustomMenuDropDown extends StatefulWidget {
//   final List<ItemModel> menuItems;
//   final IconData mainIcon;
//
//   const CustomMenuDropDown({required this.menuItems, required this.mainIcon});
//
//   @override
//   State<CustomMenuDropDown> createState() => _CustomMenuDropDownState();
// }
//
// class _CustomMenuDropDownState extends State<CustomMenuDropDown> {
//   final CustomPopupMenuController _controller = CustomPopupMenuController();
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomPopupMenu(
//       child: Padding(
//         padding: const EdgeInsetsDirectional.only(start: 8, end: 15),
//         child: Icon(widget.mainIcon),
//       ),
//       menuBuilder: () => Padding(
//         padding: const EdgeInsetsDirectional.only(start: 8,end: 10),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: Container(
//             color: Theme.of(context).scaffoldBackgroundColor,
//             child: IntrinsicWidth(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: widget.menuItems
//                     .map(
//                       (item) => InkWell(
//                         onTap: (){
//                           _controller.hideMenu();
//                           setState(() {
//
//                           });
// //                           Navigator.pop(context);
//                           item.onTap();
//
//                         },
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Row(children: [
//                                item.icon,
//                                 const SizedBox(width: 5,),
//                                 Text(
//                                   item.title,
//                                 ),
//                               ],),
//                             ),
//                             const Divider(height: 3,thickness: 2,)
//                           ],
//                         ),
//                       ),
//                     )
//                     .toList(),
//               ),
//             ),
//           ),
//         ),
//       ),
//       pressType: PressType.singleClick,
//       verticalMargin: -18,
//       controller: _controller,
//       barrierColor: Colors.black54,
//       horizontalMargin: 0.0,
//       arrowColor: Theme.of(context).primaryColor,
//       showArrow: true,
//       arrowSize: 20,
//     );
//   }
// }
