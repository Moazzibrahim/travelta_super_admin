// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/widgets/custom_appbar_widget.dart';
import 'package:flutter_application_1/view/widgets/custom_card_widget.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  int selectedCardIndex = -1;

  @override
  Widget build(BuildContext context) {
    final List<InfoRowData> clientInfo = [
      InfoRowData(label: 'User Name:', value: 'Ali Hassan'),
      InfoRowData(label: 'Email:', value: 'User1@Example.Com'),
      InfoRowData(label: 'Phone Number:', value: '01098765432'),
      InfoRowData(label: 'Booking:', value: '2024-12-05'),
      InfoRowData(label: 'Payment:', value: '5000 EGP'),
      InfoRowData(label: 'Associated Company:', value: 'Travel Company'),
      InfoRowData(label: 'Destination:', value: 'Paris, France'),
      InfoRowData(label: 'Emergency Reference:', value: '100'),
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Client",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Reusable Custom Info Card
            CustomInfoCard(infoRows: clientInfo),
          ],
        ),
      ),
    );
  }
}
