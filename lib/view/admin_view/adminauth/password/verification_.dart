import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';

class  AdminPasswordVerificationPage extends StatefulWidget {
  const  AdminPasswordVerificationPage({super.key});

  @override
  State< AdminPasswordVerificationPage> createState() =>
      _AdminPasswordVerificationPageState();
}

class _AdminPasswordVerificationPageState extends State< AdminPasswordVerificationPage> {
  List<TextEditingController> codecontrollers =
      List.generate(4, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
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
                    
                  )),
              Center(
                child: Text(
                  'Verification',
                  style: AppTextStyles.displaymedium.copyWith(color: Colors.black),
                ),
              ),
              Center(
                child: Text(
                  'we have to sent a code to your email',
                  style: AppTextStyles.titleSmall.copyWith(color: Colors.grey),
                ),
              ),
              Center(
                child: Text(
                  'Harsadhmehta@gmai.com',
                  style: AppTextStyles.titleSmall.copyWith(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "CODE",
                  style: AppTextStyles.titlemedium.copyWith(
                      color: Color.fromRGBO(108, 114, 120, 1)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                    
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      expands: true,
                      maxLines: null,
                      controller: codecontrollers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13)),
                        counterText: '',
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 0) {
                          FocusScope.of(context)
                              .requestFocus(focusNodes[index + 1]);
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(context)
                              .requestFocus(focusNodes[index - 1]);
                        }
                      },
                    ),
                  );
                }),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/adminnewpassword');
                },
                child: Center(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:
                            const Color.fromARGB(255, 82, 224, 43)),
                    child: Center(
                        child: Text(
                      'VERIFY',
                      style: AppTextStyles.titlemedium,
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
