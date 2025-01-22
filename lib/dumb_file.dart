//  BlocBuilder<FoodSizeAddBloc,
//                                                         FoodSizeAddState>(
//                                                     builder: (context, state) {
//                                                   if (state
//                                                       is FoodItemSizeAddState) {
//                                                     final sizes =
//                                                         state.foodSizeModel;

//                                                     return ListView.builder(
//                                                         itemCount: sizes.length,
//                                                         shrinkWrap: true,
//                                                         physics:
//                                                             const NeverScrollableScrollPhysics(),
//                                                         itemBuilder:
//                                                             (context, index) {
//                                                           final sizeData =
//                                                               sizes[index];
//                                                           final sizeWidgets =
//                                                               Container(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                     .only(
//                                                                     left: 40,
//                                                                     right: 40),
//                                                             child: Column(
//                                                               children: [
//                                                                 Row(
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .spaceBetween,
//                                                                   children: [
//                                                                     Text(
//                                                                       sizeData
//                                                                           .size,
//                                                                       style: const TextStyle(
//                                                                           color: Colors
//                                                                               .white,
//                                                                           fontSize:
//                                                                               19,
//                                                                           fontWeight:
//                                                                               FontWeight.w500),
//                                                                     ),
//                                                                     Text(
//                                                                       '\$${sizeData.price}',
//                                                                       style:
//                                                                           const TextStyle(
//                                                                         color: Colors
//                                                                             .white,
//                                                                         fontWeight:
//                                                                             FontWeight.w500,
//                                                                         fontSize:
//                                                                             19,
//                                                                       ),
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           );

//                                                           return isFoodItemExpand[
//                                                                   itemIndex]
//                                                               ? sizeWidgets
//                                                               : const SizedBox();
//                                                         });
//                                                   }
//                                                   return SizedBox();
//                                                 }),
