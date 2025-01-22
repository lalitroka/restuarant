import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomPaint(
      painter: BackgroundPainter(),
      child: SafeArea(
          child: Column(spacing: 5, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
              height: 120,
              width: 120,
              fit: BoxFit.cover,
              'https://as2.ftcdn.net/v2/jpg/03/64/21/11/1000_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg'),
        ),
        Text("Bablu pandey", style: AppTextStyles.titlelarge),
        Text(
          "Bablupandey23@gmail.com",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 89, 70, 70),
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/personaldetailpage');
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.personal_injury_outlined,
                        size: 30,
                        color: const Color.fromARGB(255, 141, 236, 145),
                      ),
                      title: Text("Personal details",
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
                      Navigator.pushNamed(context, '/orderpaymentpage');
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
                  ListTile(
                    leading: Icon(
                      Icons.lock,
                      size: 30,
                      color: const Color.fromARGB(255, 141, 236, 145),
                    ),
                    title: Text("Change Password",
                        style: AppTextStyles.titlemedium),
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
                        Icons.person_add_alt_rounded,
                        size: 30,
                        color: const Color.fromARGB(255, 141, 236, 145),
                      ),
                      title: Text("Invite Friend",
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
                      Navigator.pushNamed(context, '/historypage');
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.history_edu_rounded,
                        size: 30,
                        color: const Color.fromARGB(255, 141, 236, 145),
                      ),
                      title: Text("History", style: AppTextStyles.titlemedium),
                    ),
                  ),
                  Divider(
                    endIndent: 80,
                    indent: 20,
                    color: Colors.white24,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/helpsupportpage');
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.question_mark_rounded,
                        size: 30,
                        color: const Color.fromARGB(255, 141, 236, 145),
                      ),
                      title: Text(
                        "Help & Support",
                        style: AppTextStyles.titlemedium,
                      ),
                    ),
                  ),
                  ListTile(
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
                ],
              ),
            ),
          ),
        ),
      ])),
    ));
  }
}
