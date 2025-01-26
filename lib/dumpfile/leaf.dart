// Stack _topRowContainer(double screenWidth, BuildContext context) {
//     return Stack(
//       children: [
//         buildDecorativeLeaf(
//             assetPath: 'assets/leaf.png',
//             angle: 300 / 180,
//             alignment: Alignment.topLeft),
//         Positioned(
//           left: screenWidth * 0.64,
//           child: buildDecorativeLeaf(
//               assetPath: 'assets/leave.png',
//               angle: 1 / 180,
//               alignment: Alignment.topRight),
//         ),
//         Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 height: 5,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('Khaja Guff', style: AppTextStyles.displayLarge),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 23),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: AnimatedContainer(
//                         curve: Curves.easeInOut,
//                         duration: const Duration(milliseconds: 300),
//                         width: isExpand
//                             ? (isshowOrderButton > 0
//                                 ? screenWidth * 0.6
//                                 : screenWidth * 0.8)
//                             : 50,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           border: isExpand ? Border.all(width: 1) : null,
//                         ),
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isExpand = !isExpand;
//                               if (!isExpand) {
//                                 _focusNode.unfocus();
//                               } else {
//                                 _focusNode.requestFocus();
//                               }
//                             });
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.all(5),
//                                 child: Icon(
//                                   Icons.search,
//                                   color: Colors.white,
//                                   weight: 10,
//                                 ),
//                               ),
//                               if (isExpand)
//                                 Expanded(
//                                   child: TextField(
//                                     focusNode: _focusNode,
//                                     controller: _searchController,
//                                     style: AppTextStyles.searchFilter,
//                                     cursorColor: Colors.white,
//                                     decoration: InputDecoration(
//                                       contentPadding:
//                                           const EdgeInsets.symmetric(
//                                               vertical: 10, horizontal: 20),
//                                       hintText: 'Search...',
//                                       hintStyle: AppTextStyles.searchFilter,
//                                       border: InputBorder.none,
//                                     ),
//                                     onChanged: (value) {
//                                       log("TextField input: $value");
//                                     },
//                                   ),
//                                 ),
//                               if (isExpand)
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     if (selectedFilter != 'All')
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(right: 8.0),
//                                         child: Row(
//                                           children: [
//                                             Text(selectedFilter,
//                                                 style:
//                                                     AppTextStyles.searchFilter),
//                                             IconButton(
//                                               icon: Icon(Icons.cancel,
//                                                   color: Colors.white),
//                                               onPressed: () {
//                                                 setState(() {
//                                                   selectedFilter = 'All';
//                                                 });
//                                               },
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     if (selectedFilter == "All")
//                                       PopupMenuButton<String>(
//                                         color: Colors.black,
//                                         icon: Icon(
//                                           Icons.filter_list_alt,
//                                           color: Colors.white,
//                                         ),
//                                         onSelected: (filter) {
//                                           setState(() {
//                                             selectedFilter = filter;
//                                           });
//                                         },
//                                         itemBuilder: (BuildContext context) {
//                                           return [
//                                             PopupMenuItem(
//                                               value: 'Veg',
//                                               child: Text('Veg',
//                                                   style: AppTextStyles
//                                                       .searchFilter),
//                                             ),
//                                             PopupMenuItem(
//                                               value: 'Non-Veg',
//                                               child: Text('Non-Veg',
//                                                   style: AppTextStyles
//                                                       .searchFilter),
//                                             ),
//                                           ];
//                                         },
//                                       ),
//                                   ],
//                                 )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     if (isshowOrderButton >= 1)
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pushNamed(context, '/orderpage');
//                         },
//                         child: Container(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Text(
//                             'Order',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }