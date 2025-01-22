import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHistoryPage extends StatefulWidget {
  const AdminHistoryPage({super.key});

  @override
  State<AdminHistoryPage> createState() => _AdminHistoryPageState();
}

class _AdminHistoryPageState extends State<AdminHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SizedBox.expand(
        child: CustomPaint(
          painter: BackgroundPainter(),
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
                      width: 60,
                    ),
                    Text('History', style: AppTextStyles.headlineLarge),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Search By:',
                          style: AppTextStyles.titlemedium
                              .copyWith(color: Colors.greenAccent)),
                      Text('Date', style: AppTextStyles.titleSmall),
                      Text('food', style: AppTextStyles.titleSmall),
                      Text('price', style: AppTextStyles.titleSmall),
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
                              context, '/adminhisotorydetail'),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white70)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Nepali Thali',
                                        style: AppTextStyles.titlemedium),
                                    Text('Rs.100000',
                                        style: AppTextStyles.titlemedium)
                                  ],
                                ),
                                Text('20-04-2025',
                                    style: AppTextStyles.titleSmall
                                        .copyWith(fontWeight: FontWeight.w100))
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
      )),
    );
  }
}
