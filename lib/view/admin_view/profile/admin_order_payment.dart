import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_color.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class AdminOrderPaymentHistoryPage extends StatefulWidget {
  const AdminOrderPaymentHistoryPage({super.key});

  @override
  State<AdminOrderPaymentHistoryPage> createState() => _AdminOrderPaymentHistoryPageState();
}

class _AdminOrderPaymentHistoryPageState extends State<AdminOrderPaymentHistoryPage> {

  String searchByDateFilter= 'Date';
  String? searchByPriceFilter;
  bool isSearchBarExpand = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox.expand(
              child: CustomPaint(
      painter: BackgroundPainter(),
      child: SafeArea(
        child: SizedBox(
          height: screenHeight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 10,
              children: [
                Row(children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Payment & Order History', style: AppTextStyles.headlineLarge),
                ]),
                Row(
          
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isSearchBarExpand = !isSearchBarExpand;
                          });
                        },
                        child: Text('Food', style: AppTextStyles.titlemedium.copyWith(color: Colors.yellow),)),
                     PopupMenuButton(
                       color: AppColor.cardcolor,
                      onSelected: (value) {
                        setState(() {
                          searchByPriceFilter = value;
                        });
                      },
                      popUpAnimationStyle: AnimationStyle(
                        duration: Duration(milliseconds: 300)
                      ),
                      itemBuilder: (context){
                      return [
                            PopupMenuItem(
                              value: "Increase",
                              child: Text('Increase',style: AppTextStyles.titleSmall,)),
                            PopupMenuItem(
                              value: 'Decrease',
                              child: Text('Decrease', style: AppTextStyles.titleSmall,)),
                      ];
                      
                     },
                     child:  Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (searchByPriceFilter != null)
                Row(
                  children: [
                    Text(
                      searchByPriceFilter!,
                      style: AppTextStyles.titlelarge.copyWith(color: Colors.yellow)
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          searchByPriceFilter = null;
                        });
                      },
                    ),
                  ],
                )
              else
                Text(
                  "Price",
                  style:AppTextStyles.titlelarge.copyWith(color: Colors.yellow)
                ),
            ],
          ),
        
                     ),
                     
                    PopupMenuButton(
                      color: AppColor.cardcolor,
                      onSelected: (value) {
                        setState(() {
                          searchByDateFilter = value;
                        });
                      },
                      popUpAnimationStyle: AnimationStyle(
                        duration: Duration(milliseconds: 300)
                      ),
                      itemBuilder: (context){
                      return[
                         PopupMenuItem(
                    value: 'All',
                    child: Text('All', style: AppTextStyles.titleSmall,)),
                  PopupMenuItem(
                    value: 'Today',
                    child: Text('Today', style: AppTextStyles.titleSmall,)),
                  PopupMenuItem
                  (
                    value: 'Meekly',
                    child: Text('Weekly', style: AppTextStyles.titleSmall,)),
                  PopupMenuItem(
                    value: 'Monthly',
                    child: Text('Monthly', style: AppTextStyles.titleSmall,)),
        
                      ];
                      
                    },
                    child:Text(searchByDateFilter, style: AppTextStyles.titlelarge.copyWith(color: Colors.yellow),) ,
                    )
                  ],
                ),

                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context,   '/adminorderpaymentdetail'),
                        child: Container(
                          
                          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all( color: const Color.fromARGB(153, 61, 51, 51)
                              )
                              ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Nepali Thali',
                                      style: AppTextStyles.titlemedium),
                                       Text('20-04-2025',
                                  style: AppTextStyles.titleSmall
                                      .copyWith(fontWeight: FontWeight.w100))
                                 
                                ],
                              ),
                                 
                               Text('Rs.100000',
                                      style: AppTextStyles.titlemedium)
                             
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
              ),
            ),
    );
  }
}

