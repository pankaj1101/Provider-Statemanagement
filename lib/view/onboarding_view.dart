import 'package:flutter/material.dart';
import 'package:sample/utils/constants.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(Constants.onboarding3, fit: BoxFit.fitHeight),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Text(
                    'Meet Doctors Online',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Color(0xff1C2A3A),
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 48),
                    ),
                    onPressed: () {},
                    child: Text('Next'),
                  ),
                  SizedBox(height: 20),

                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Color(0xff1C2A3A),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff1C2A3A),
                        ),
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff1C2A3A),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  TextButton(onPressed: () {}, child: Text('Skip')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
