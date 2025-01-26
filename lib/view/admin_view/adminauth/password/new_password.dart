import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';

class  AdminNewPasswordPage extends StatefulWidget {
  const  AdminNewPasswordPage({super.key});

  @override
  State< AdminNewPasswordPage> createState() => _AdminNewPasswordPageState();
}

class _AdminNewPasswordPageState extends State< AdminNewPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.black,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    'Set the new password',
                    style: AppTextStyles.displaymedium
                        .copyWith(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                _textFieldContainer(
                    controller: _passwordController,
                    labelText: 'New Password',
                    validatorText: "Enter your password!"),
                SizedBox(
                  height: 10,
                ),
                _textFieldContainer(
                    controller: _confirmpasswordController,
                    labelText: 'Confirm Password',
                    validatorText: "Enter your confirm password!"),
                GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 82, 224, 43)),
                      child: Center(
                          child: Text(
                        'Confirm ',
                        style: AppTextStyles.titlemedium,
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldContainer(
      {required TextEditingController controller,
      required String labelText,
      required String validatorText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: SizedBox(
          height: 65,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            expands: true,
            maxLines: null,
            controller: controller,
            decoration: InputDecoration(
                floatingLabelStyle:
                    AppTextStyles.bodysmall.copyWith(color: Colors.black),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                labelText: labelText,
                labelStyle:
                    AppTextStyles.titleSmall.copyWith(color: Colors.black)),
            validator: (value) => value!.isNotEmpty ? validatorText : null,
            style: AppTextStyles.titleSmall
                .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
          )),
    );
  }
}
