import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/widgets/custom_appbar_widget.dart';
import 'package:flutter_application_1/view/widgets/custom_card_widget.dart';

class TourismCompaniesScreen extends StatefulWidget {
  const TourismCompaniesScreen({super.key});

  @override
  State<TourismCompaniesScreen> createState() => _TourismCompaniesScreenState();
}

class _TourismCompaniesScreenState extends State<TourismCompaniesScreen> {
  int selectedCardIndex = -1;

  @override
  Widget build(BuildContext context) {
    final List<InfoRowData> clientInfo = [
      InfoRowData(label: 'Name:', value: 'Ali Hassan'),
      InfoRowData(label: 'Email:', value: 'User1@Example.Com'),
      InfoRowData(label: 'Phone Number:', value: '01098765432'),
      InfoRowData(label: 'Phone Responsible:', value: '01098765432'),
      InfoRowData(label: 'Joined Date:', value: '2024-12-05'),
      InfoRowData(label: 'Total Commission:', value: '5000 EGP'),
      InfoRowData(label: 'Total Bookings:', value: '200'),
      InfoRowData(label: 'Wallet:', value: '5000 EGP'),
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Tourism Companies",
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
