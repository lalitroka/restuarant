import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_color.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: AppColor.backgroundColor,
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 60),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(7),
                  
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                                   border: Border.all(color: const Color.fromARGB(31, 65, 65, 65)),
                  
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Profile',
                        style: AppTextStyles.titlemedium
                            .copyWith(color: Colors.black),
                      ),
                      Container(
                         padding: EdgeInsets.all(5),
                  
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                                   border: Border.all(color: const Color.fromARGB(31, 65, 65, 65)),
                  
                          ),
                        child: Icon(Icons.settings)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 120,
          left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                decoration: BoxDecoration(
                  color: AppColor.bodyColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 120),
                  Text(
                    "Bablu Pandey",
                    style:
                        AppTextStyles.titlemedium.copyWith(color: Colors.black),
                  ),
                  Text(
                    "Bablupandey23@gmail.com",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/userpersonaldetailpage');
                    },
                    child: _textContainerList(Icons.edit_outlined, "Edit profile"),
                  ),
                   GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, '/userorderpaymenthistorypage');
                    },
                    child: _textContainerList(Icons.favorite_border, "Favorite"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, '/userorderpaymenthistorypage');
                    },
                    child: _textContainerList(Icons.history, "History"),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/userinvitefriendpage');
                    },
                    child: _textContainerList(
                        Icons.abc, "About"),
                  ),
                  
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/userhelpsupportpage');
                    },
                    child: _textContainerList(
                        Icons.lock_outline_rounded, "Change password"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/defaultpage');
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromARGB(31, 65, 65, 65)),
                      ),
                      child: ListTile(
                        leading: Transform.flip(
                          flipX: true,
                          child: Icon(
                            Icons.logout,
                            size: 27,
                                      color: Colors.black  
                          ),
                        ),
                        title: Text("LogOut",
                            style: AppTextStyles.titleSmall
                                .copyWith(color: Colors.black)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 100,
            left: 100,
            top: 100,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 60,
                  foregroundImage: NetworkImage(
                    'https://as2.ftcdn.net/v2/jpg/03/64/21/11/1000_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textContainerList(IconData icon, String text,) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(31, 65, 65, 65)),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          size: 27,
          color: Colors.black      ),
        title: Text(
          text,
          style: AppTextStyles.titleSmall.copyWith(color: Colors.black),
        ),
        trailing:Transform.flip(
          flipX: true,
          child: Icon(Icons.arrow_back_ios_new_outlined,
          size: 19,
          weight: 10,
  
          )) ,
      ),
    );
  }
}
