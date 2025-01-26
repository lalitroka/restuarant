import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';

class AdminRegisterPage extends StatefulWidget {
  const AdminRegisterPage({super.key});

  @override
  State<AdminRegisterPage> createState() => _AdminRegisterPageState();
}

class _AdminRegisterPageState extends State<AdminRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  // final TextEditingController _newpasswordController = TextEditingController();
  // final TextEditingController _confirmPasswordController =
  //     TextEditingController();
  final TextEditingController _restaurantNameController =
      TextEditingController();
  final TextEditingController _restaurantAddressController =
      TextEditingController();

  final TextEditingController _businessRegNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromRGBO(255, 255, 255, 1),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing:10,
                  children: [

                    
                     SizedBox(height: 5,),
                    
                    _textFieldContainer(
                        controller: _restaurantNameController,
                        labelText: "Name",
                        validatorText: "Enter restuarnat name!"),
                    
                    
                   
                    _textFieldContainer(
                        controller: _emailController,
                        labelText: " Email",
                        validatorText: "Enter your email!"),
                    
                    
                    _textFieldContainer(
                        controller: _phoneNumberController,
                        labelText: " Phone Number",
                        validatorText: "Enter your phone number!"),
                   
                    _textFieldContainer(
                        controller: _restaurantAddressController,
                        labelText: "Address",
                        validatorText: "Enter your address!"),
                 
                    _textFieldContainer(
                        controller: _businessRegNumberController,
                        labelText: " Registration Numebr",
                        validatorText: "Enter Your Registration Number!"),
                    SizedBox(
                      height: 10,
                    ),
                
                  
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 10),
                              backgroundColor: Colors.blue),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/adminregistersuccesspage');
                          },
                          child: Text(
                            'Register',
                            style: AppTextStyles.titlemedium.copyWith(color: Colors.white),
                          )),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }



  Widget _textFieldContainer(
      {required TextEditingController controller,
      required String labelText,
      required String validatorText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
          height: 60,
          child: TextFormField(
            expands: true,
            maxLines: null,
            controller: controller,
            decoration: InputDecoration(
                floatingLabelStyle:
                    AppTextStyles.bodysmall.copyWith(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                labelText: labelText,
                labelStyle:
                    AppTextStyles.titleSmall.copyWith(color: Colors.black)),
            validator: (value) => value!.isNotEmpty ? validatorText : null,
            style: AppTextStyles.titleSmall.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
          )),
    );
  }
}
