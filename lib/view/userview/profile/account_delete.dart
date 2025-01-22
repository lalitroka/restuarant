import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountDelete extends StatefulWidget {
  const AccountDelete({super.key});

  @override
  State<AccountDelete> createState() => _AccountDeleteState();
}

class _AccountDeleteState extends State<AccountDelete> {
  String selection = 'option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox.expand(
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Account onwership and control',
                    style: AppTextStyles.displaymedium,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            "Deactivate account ",
                            style: GoogleFonts.lato(
                              color: Colors.white70,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: RichText(
                            text: TextSpan(
                                text:
                                    " Deactivateing your account is temporary. ",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        ' Your acccount and main profile will be deactivate and your name and other your content will be removed form the Khaja Guff',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white70,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ]),
                          ),
                          trailing: Radio<String>(
                            value: 'Option 1',
                            groupValue: selection,
                            activeColor: Colors.blue,
                            fillColor: WidgetStateColor.resolveWith((states) {
                              if (states.contains(WidgetState.selected)) {
                                return Colors.blue;
                              }
                              return Colors.white;
                            }),
                            onChanged: (value) {
                              setState(() {
                                selection = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Text(
                            "Delete account ",
                            style: GoogleFonts.lato(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: RichText(
                              text: TextSpan(
                                  text: "Deleting your account is permanent.",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  children: [
                                TextSpan(
                                  text:
                                      " When you delete your Khaja Guff account , you won't be able to retrive the content or information. Your main profile and other your activity will also be deleted. ",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white70,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ])),
                          trailing: Radio<String>(
                            value: 'Option 2',
                            groupValue: selection,
                            fillColor: WidgetStateColor.resolveWith((states) {
                              if (states.contains(WidgetState.selected)) {
                                return Colors.blue;
                              }
                              return Colors.white;
                            }),
                            onChanged: (value) {
                              setState(() {
                                selection = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
