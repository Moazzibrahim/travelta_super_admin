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
            // Client Details Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: OperationCard(
                index: 0,
                operationId: 'Booking: 2024-12-05',
                clientName: 'Ali Hassan',
                status: '5000 EGP',
                statusColor: const Color.fromRGBO(231, 237, 246, 1),
                statusTextColor: Colors.black,
                borderColor: const Color.fromRGBO(231, 237, 246, 1),
                selectedCardIndex: selectedCardIndex,
                onTap: () {
                  setState(() {
                    selectedCardIndex = 0;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(231, 237, 246, 1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _InfoRow(label: 'User Name:', value: 'Ali Hassan'),
                  _InfoRow(label: 'Email:', value: 'User1@Example.Com'),
                  _InfoRow(label: 'Phone Number:', value: '01098765432'),
                  _InfoRow(label: 'Booking:', value: '2024-12-05'),
                  _InfoRow(label: 'Payment:', value: '5000 EGP'),
                  _InfoRow(
                      label: 'Associated Company:', value: 'Travel Company'),
                  _InfoRow(label: 'Destination:', value: 'Paris, France'),
                  _InfoRow(label: 'Emergency Reference:', value: '100'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Info Row Widget
class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
