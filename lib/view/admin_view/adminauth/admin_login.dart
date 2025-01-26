import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  bool isChecked = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textFieldContainer(
                    controller: _emailController,
                    labelText: "Email",
                    validatorText: "Enter Your Email"),
                SizedBox(
                  height: 10,
                ),
               
                _textFieldContainer(
                    controller: _passwordController,
                    labelText: "Password",
                    validatorText: "Enter Correct Password"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: isChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isChecked = newValue ?? false;
                              });
                            }),
                        Text(
                          "Remember me",
                          style: AppTextStyles.titleSmall.copyWith(color: Color.fromRGBO(108, 114, 120, 1),
                        )
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/adminforgotpassword'),
                      child: Text(
                        "Forgot Password? ",
                        style: AppTextStyles.titleSmall
                            .copyWith(color: Colors.blueAccent),
                      ),
                    )
                  ],
                ),
                       SizedBox(height: 20,),
                  
                 Align(
                  alignment: Alignment.center,
                   child: ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 100 ,vertical: 10),
                      backgroundColor: Colors.blue
                    ),
                    onPressed: (){
                     Navigator.pushNamed(context, '/adminhomepage');
                   }, child: Text('Log In', style: AppTextStyles.titlemedium,)),
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }

//  Widget _text({required String text}) {
//     return Text(
//       text,
//       style: AppTextStyles.titlemedium.copyWith(color: Color.fromRGBO(108, 114, 120, 1)
// ),
//     );
//   }
  Widget _textFieldContainer(
      {required TextEditingController controller,
      required String labelText,
      required String validatorText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        decoration: InputDecoration(
            floatingLabelStyle:
                AppTextStyles.bodysmall.copyWith(color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5)
            ),
            labelText: labelText,
            labelStyle:
                AppTextStyles.titleSmall.copyWith(
                  color: Colors.black)),
        validator: (value) => value!.isNotEmpty ? validatorText : null,
        style: AppTextStyles.titleSmall.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}
