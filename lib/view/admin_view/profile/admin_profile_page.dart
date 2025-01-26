import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminProfilePage extends StatefulWidget {
  const AdminProfilePage({super.key});

  @override
  State<AdminProfilePage> createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: CustomPaint(
                painter: BackgroundPainter(),
                child: SafeArea(
            child: Column(spacing: 5, children: [
          Image(
            height: 200,
            width: double.infinity,
            image: AssetImage('assets/food.jpg'),
            fit: BoxFit.cover,
          ),
          Text("Kathmandu Resturant", style: AppTextStyles.titlelarge),
           Text("tinkune, kathmandu", style: AppTextStyles.titleSmall),
          Text(
            "97453454767",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 36, 26, 26),
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/adminaboutus');
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.personal_injury_outlined,
                          size: 30,
                          color: const Color.fromARGB(255, 141, 236, 145),
                        ),
                        title: Text("About Us",
                            style: AppTextStyles.titlemedium),
                      ),
                    ),
                    Divider(
                      endIndent: 80,
                      indent: 20,
                      color: Colors.white24,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/adminorderpayment');
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.card_travel,
                          size: 30,
                          color: const Color.fromARGB(255, 141, 236, 145),
                        ),
                        title: Text("Order & Payment ",
                            style: AppTextStyles.titlemedium),
                      ),
                    ),
                    Divider(
                      endIndent: 80,
                      indent: 20,
                      color: Colors.white24,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/invitepage');
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.photo,
                          size: 30,
                          color: const Color.fromARGB(255, 141, 236, 145),
                        ),
                        title: Text("Photos",
                            style: AppTextStyles.titlemedium),
                      ),
                    ),
                    Divider(
                      endIndent: 80,
                      indent: 20,
                      color: Colors.white24,
                    ),
                   GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/adminsetting');
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.settings,
                          size: 30,
                          color: const Color.fromARGB(255, 141, 236, 145),
                        ),
                        title: Text(
                          "Settings",
                          style: AppTextStyles.titlemedium,
                        ),
                      ),
                    ),
                      Divider(
                      endIndent: 80,
                      indent: 20,
                      color: Colors.white24,
                    ),
                  
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/userhomepage'),
                      child: ListTile(
                        leading: Transform.flip(
                          flipX: true,
                          child: Icon(
                            Icons.logout,
                            size: 30,
                            color: const Color.fromARGB(255, 141, 236, 145),
                          ),
                        ),
                        title: Text("LogOut", style: AppTextStyles.titlemedium),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
                ])),
              ),
        ));
  }
}
