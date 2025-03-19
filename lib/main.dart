import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  final String linkedInUrl = "https://www.linkedin.com/in/yourprofile"; // Your LinkedIn profile
  final String telegramUrl = "https://t.me/zzpich"; // Telegram link

  // Function to launch URLs
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10, // Increased height
            horizontal: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // HEADER
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo
                      Row(
                        children: [
                          Image.asset('asset/logo.png', height: 40),
                          SizedBox(width: 10),
                          Text(
                            "AeroVision",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.menu, color: Colors.black),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                // PROFILE IMAGE
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('asset/pic.JPG'),
                ),
                SizedBox(height: 20),

                // INTRO TEXT
                Text(
                  "Welcome to my Portfolio",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 10),

                // NAME & TITLE
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Hi I’m\n",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "Chheang Sreypich\n",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      TextSpan(
                        text: "IT student at ITC",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                // DESCRIPTION
                Text(
                  "Collaborating with highly skilled individuals, our agency delivers top-quality services.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 20),

                // BUTTONS (HIRE ME & DOWNLOAD CV)
                ElevatedButton(
                  onPressed: () => _launchURL(telegramUrl), // Opens Telegram
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  ),
                  child: Text(
                    "Hire Me!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () => _launchURL(linkedInUrl), // Opens LinkedIn
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Download CV",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.download,
                        color: Colors.blue,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40), // Extra space
              ],
            ),
          ),
        ),
      ),
    );
  }
}
