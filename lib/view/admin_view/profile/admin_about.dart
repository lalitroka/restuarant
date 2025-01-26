import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminAboutPage extends StatefulWidget {
  const AdminAboutPage({super.key});

  @override
  State<AdminAboutPage> createState() => _AdminAboutPageState();
}

class _AdminAboutPageState extends State<AdminAboutPage> {
   final Map<String, String> _socialMediaLinks = {
    'Facebook': 'https://www.facebook.com/yourrestaurant',
    'Instagram': 'https://www.instagram.com/yourrestaurant',
    'Tiktok': 'https://tiktok.com/yourrestaurant',
  };

 
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                    
                    Text(
                      'Our Mission',
                      style: AppTextStyles.titlelarge
                    ),
                  
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                          'At kathmandu Restuarant, we aim to deliver exceptional culinary experiences '
                          'by combining the freshest ingredients with innovative cooking techniques. '
                          'Our goal is to provide not just meals, but moments of joy and connection.',
                          style: AppTextStyles.titleSmall),
                    ),
                  
                    Text('Our Team', style: AppTextStyles.titlelarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildTeamMember(
                            name: 'John Doe',
                            role: 'Founder',
                            imagePath: 'assets/burger.png'),
                        _buildTeamMember(
                            name: 'Jane Smith',
                            role: 'Chef',
                            imagePath: 'assets/burger.png'),
                        _buildTeamMember(
                            name: 'Emily Brown',
                            role: 'Manager',
                           imagePath: 'assets/burger.png'),
                      ],
                    ),

                    SizedBox(height: 20,),
                     Text(
                      'Our Story ',
                      style: AppTextStyles.titlelarge
                    ),
                  
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(''' Building Kathmandu Restaurat wasn’t easy. We faced countless challenges — from finding the right location to perfecting our recipes and overcoming financial hurdles. There were days when it felt like everything was against us, but our passion for great food and our dedication to serving the community kept us going. Every obstacle stren
                    gthened our resolve, and today, we’re proud to share the fruits of our hard work with you. ''',
                      style: AppTextStyles.titleSmall,
                      ),
                    ),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: _socialMediaLinks.entries.map((entry) {
                         return GestureDetector(
                           onTap: () => _launchURL(entry.value),
                           child: Column(
                             children: [
                               Icon(
                                 _getSocialMediaIcon(entry.key),
                                 size: 40,
                                 color: Colors.deepOrange,
                               ),
                               const SizedBox(height: 8),
                               Text(
                                 entry.key,
                                 style: AppTextStyles.titleSmall
                               ),
                             ],
                           ),
                         );
                       }).toList(),
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

 IconData _getSocialMediaIcon(String platform) {
    switch (platform) {
      case 'Facebook':
        return Icons.facebook;
      case 'Instagram':
        return Icons.photo; 
      case 'Tiktok':
        return Icons.tiktok; 
      default:
        return Icons.link;
    }
  }
  Widget _buildTeamMember(
      {required String name, required String role, required String imagePath}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: AppTextStyles.titleSmall
        ),
        Text(
          role,
          style: AppTextStyles.titleSmall.copyWith(color: Colors.grey) ,
        ),
      ],
    );
  }
}
