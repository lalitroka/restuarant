import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class AdminOrderPaymentHistoryDetailPage extends StatefulWidget {
  const AdminOrderPaymentHistoryDetailPage({super.key});

  @override
  State<AdminOrderPaymentHistoryDetailPage> createState() => _AdminOrderPaymentHistoryDetailPageState();
}

class _AdminOrderPaymentHistoryDetailPageState extends State<AdminOrderPaymentHistoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
              child: CustomPaint(
      painter: BackgroundPainter(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              spacing: 10,
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      'GO BACK',
                      style: AppTextStyles.titlelarge
                    )),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '#32343 ',
                    style: AppTextStyles.titlelarge.copyWith(color: Colors.lightGreenAccent)
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Name:  ',
                      style: AppTextStyles.titlemedium,
                    ),
                  
                    Expanded(
                      child: Text(
                        'Sonam Pandey ',
                        style: AppTextStyles.titlemedium.copyWith(color: Colors.white70)
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Contact NO.:  ',
                     style: AppTextStyles.titlemedium,
                    ),
                    Text(
                      '987343245',
                      style: AppTextStyles.titlemedium.copyWith(color: Colors.white70)
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Food Name:  ',
                      style: AppTextStyles.titlemedium,
                    ),
                    Text(
                      'Nepali Thali',
                    style: AppTextStyles.titlemedium.copyWith(color: Colors.white70)
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Total Price:  ',
                        style: AppTextStyles.titlemedium,
                    ),
                    Flexible(
                      child: Text(
                        '1000000000000',
                         style: AppTextStyles.titlemedium.copyWith(color: Colors.white70)
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Address:  ',
                      style: AppTextStyles.titlemedium,
                    ),
                    Flexible(
                      child: Text(
                        '1234 New Baneshwor Road, Apartment 5B, Kathmandu, Bagmati 44600, Nepal',
                        style: AppTextStyles.titlemedium.copyWith(color: Colors.white70)
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Payment With:  ',
                       style: AppTextStyles.titlemedium,
                    ),
                    Flexible(
                      child: Text(
                        ' Esewa ',
                         style: AppTextStyles.titlemedium.copyWith(color: Colors.white70)
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Date:  ',
                      style: AppTextStyles.titlemedium,
                    ),
                    Flexible(
                      child: Text(
                        '20-02-2025',
                        style: AppTextStyles.titlemedium.copyWith(color: Colors.white70)
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Time:  ',
                     style: AppTextStyles.titlemedium,
                    ),
                    Flexible(
                      child: Text(
                        '10:00 AM',
                         style: AppTextStyles.titlemedium.copyWith(color: Colors.white70)
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Feedback by user:  ',
                      style: AppTextStyles.titlemedium,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < 3 ? Icons.star : Icons.star_border,
                        color: Colors.orangeAccent,
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ''' I had a great experience dining at your restaurant. The food was absolutely delicious, and the staff was very friendly. The ambiance was warm and inviting, which made it a pleasant dining experience.''',
                    style: AppTextStyles.titlemedium.copyWith(color: Colors.white70)),
                ),
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