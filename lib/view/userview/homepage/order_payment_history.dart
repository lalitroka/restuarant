import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_color.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';

class UserOrderPaymentHistoryPage extends StatefulWidget {
  const UserOrderPaymentHistoryPage({super.key});

  @override
  State<UserOrderPaymentHistoryPage> createState() =>
      _UserOrderPaymentHistoryPageState();
}

class _UserOrderPaymentHistoryPageState
    extends State<UserOrderPaymentHistoryPage> {
  List<Map<String, dynamic>> foodOrders = [
    {
      'image': [
      
        'https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg'
            'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg',
        'https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg',
        'https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg'
      ],
      'foodname': 'Burger',
      'quantity': '2',
      'price': '5.99',
      'time': '12 Mon 12:00 PM',
      'deliverstaus': 'preparing',
      'final status': "cancel",
    },
    {
      'image': [
        'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg',
        'https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg'
      ],
      'foodname': 'Pizza',
      'quantity': '1',
      'price': '8.49',
      'time': '13 Tue 1:30 PM',
      'deliverstaus': 'preparing',
      'final status': "cancel",
    },
    {
      'image': [
        'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg',
        'https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg',
        'https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg'
      ],
      'foodname': 'Pasta',
      'quantity': '3',
      'price': '7.25',
      'time': '14 Wed 6:00 PM',
      'deliverstaus': 'delivered',
      'final status': "Reorder",
    },
    {
      'image': [
        'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg',
        'https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg',
        'https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg',
        'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg',
        'https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg',
        'https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg'
      ],
      'foodname': 'Salad',
      'quantity': '1',
      'price': '4.75',
      'time': '15 Thu 2:15 PM',
      'deliverstaus': 'preparing',
      'final status': "cancel",
    },
    {
      'image': [
        'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg',
        'https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg'
      ],
      'foodname': 'Steak',
      'quantity': '2',
      'price': '12.99',
      'time': '16 Fri 8:00 PM',
      'deliverstaus': 'preparing',
      'final status': "cancel",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bodyColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: _iconContainer(Icons.arrow_back_ios_new),
                  ),
                  Text("Order History",
                      style: AppTextStyles.titlemedium
                          .copyWith(color: Colors.black)),
                  _iconContainer(Icons.headset_mic)
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: foodOrders.length,
                itemBuilder: (context, index) {
                  final image = foodOrders[index].values.elementAt(0);
                  final name = foodOrders[index].values.elementAt(1);
                  final quantity = foodOrders[index].values.elementAt(2);
                  final price = foodOrders[index].values.elementAt(3);
                  final time = foodOrders[index].values.elementAt(4);
                  final orderstatus = foodOrders[index].values.elementAt(5);
                  final finalstatus = foodOrders[index].values.elementAt(6);

                  return Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColor.backgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: List.generate(image.length, (index) {
                                double maxRadius = 40;
                                double minRadius = 40;
                                double spacingFactor = 10.0;

                                double radius = image.length > 3
                                    ? minRadius +
                                        (maxRadius - minRadius) *
                                            (3 / image.length)
                                    : maxRadius;

                                double spacing =
                                    (80 - (radius * 2)) / (image.length - 1);

                                return Positioned(
                                  left: index *
                                      (image.length > 3
                                          ? spacing
                                          : spacingFactor),
                                  child: CircleAvatar(
                                    radius: radius + 2,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: radius,
                                      backgroundImage:
                                          NetworkImage(image[index]),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: AppTextStyles.titlemedium.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17),
                              ),
                              Text(
                                quantity,
                                style: AppTextStyles.bodysmall
                                    .copyWith(color: Colors.black),
                              ),
                              Row(
                                spacing: 3,
                                children: [
                                  Text(
                                    'Rs$price',
                                    style: AppTextStyles.bodymedium
                                        .copyWith(color: Colors.black),
                                  ),
                                  Text(
                                    orderstatus[0].toUpperCase() +
                                        orderstatus.substring(1),
                                    style: AppTextStyles.bodysmall
                                        .copyWith(color: Colors.red),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            spacing: 15,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                time,
                                style: AppTextStyles.bodysmall
                                    .copyWith(color: Colors.black),
                              ),
                              finalstatus == 'cancel'
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6,
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.red, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        finalstatus[0].toUpperCase() +
                                            finalstatus.substring(1),
                                        style: AppTextStyles.titleSmall
                                            .copyWith(color: Colors.black),
                                      ))
                                  : Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 3),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        finalstatus,
                                        style: AppTextStyles.titleSmall,
                                      ))
                            ],
                          )
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconContainer(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26), shape: BoxShape.circle),
      child: Icon(
        icon,
        size: 20,
      ),
    );
  }
}
