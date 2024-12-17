import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/widgets/custom_appbar_widget.dart';

import '../../../constants/colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  Widget buildAlignedRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Widget buildSignUpCard({
    required String userId,
    required String name,
    required String email,
    required String role,
    required String status,
    required Color backgroundColor,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildAlignedRow('User ID:', userId),
                const SizedBox(height: 8.0),
                buildAlignedRow('Name:', name),
                const SizedBox(height: 8.0),
                buildAlignedRow('Email:', email),
                const SizedBox(height: 8.0),
                buildAlignedRow('Role:', role),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: maincolor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            alignment: Alignment.center,
            child: Text(
              status,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'SignUp Approve'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const ListTile(
                leading: Icon(Icons.search, color: Colors.blueAccent),
                title: Text(
                  'Search',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            buildSignUpCard(
              userId: '101',
              name: 'Ahmed Ali',
              email: 'Ahmed@Example.Com',
              role: 'Admin',
              status: 'Pending',
              backgroundColor: secondColor,
            ),
          ],
        ),
      ),
    );
  }
}
