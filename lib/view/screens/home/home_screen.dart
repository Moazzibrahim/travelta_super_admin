import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/view/screens/Subscriptions/Subscriptions_screen.dart';
import 'package:flutter_application_1/view/screens/client/client_screen.dart';
import 'package:flutter_application_1/view/screens/payment/pending_payment_screen.dart';
import 'package:flutter_application_1/view/screens/signup/sign_up_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Hello Admin',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: maincolor,
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(16.0),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ClientScreen(),
                        ),
                      );
                    },
                    child: const GridItem(
                      imagePath:
                          'assets/images/4243325_users_people_icon 1.png',
                      label: 'Client',
                    ),
                  ),
                  const GridItem(
                    imagePath: 'assets/images/Icon Container.png',
                    label: 'Tourism Companies',
                  ),
                  const GridItem(
                    imagePath: 'assets/images/Menu Icon.png',
                    label: 'Hotels',
                  ),
                  const GridItem(
                    imagePath: 'assets/images/Menu Icon (1).png',
                    label: 'Booking',
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentCardScreen(),
                        ),
                      );
                    },
                    child: const GridItem(
                      imagePath: 'assets/images/Menu Icon Container.png',
                      label: 'Pending Payment',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SubscriptionsScreen(),
                        ),
                      );
                    },
                    child: const GridItem(
                      imagePath: 'assets/images/Menu Icon Container (1).png',
                      label: 'Subscriptions',
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 130,
                        child: SignupApproveItem(
                          imagePath:
                              'assets/images/true-check-accept-approve.png',
                          label: 'Signup Approve',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const GridItem({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: maincolor.withOpacity(0.2), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: maincolor,
            ),
          ),
          const SizedBox(height: 8),
          Image.asset(
            imagePath,
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class SignupApproveItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const SignupApproveItem({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: maincolor.withOpacity(0.2), width: 1),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, // Centers content horizontally
        children: [
          Image.asset(
            imagePath,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12), // Space between image and text
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: maincolor,
            ),
          ),
        ],
      ),
    );
  }
}
