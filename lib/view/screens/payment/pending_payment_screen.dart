import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/view/widgets/custom_appbar_widget.dart';

class PaymentCardScreen extends StatefulWidget {
  const PaymentCardScreen({super.key});

  @override
  _PaymentCardScreenState createState() => _PaymentCardScreenState();
}

class _PaymentCardScreenState extends State<PaymentCardScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, String>> paymentData = [
    {
      'companyName': 'XYZ Company',
      'paymentMethod': 'Credit Card (Visa)',
      'amountPaid': '500 EGP',
      'plan': 'Gold',
    },
    {
      'companyName': 'ABC Company',
      'paymentMethod': 'Bank Transfer',
      'amountPaid': '300 EGP',
      'plan': 'Silver',
    },
    {
      'companyName': 'LMN Company',
      'paymentMethod': 'Cash',
      'amountPaid': '150 EGP',
      'plan': 'Bronze',
    },
  ];

  List<Map<String, String>> get filteredData {
    if (_searchQuery.isEmpty) {
      return paymentData;
    }
    return paymentData.where((payment) {
      return payment['companyName']!
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
    }).toList();
  }

  Widget buildAlignedRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget buildPaymentCard({
    required String companyName,
    required String paymentMethod,
    required String amountPaid,
    required String plan,
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
                buildAlignedRow('From Company:', companyName),
                const SizedBox(height: 8.0),
                buildAlignedRow('Payment Method:', paymentMethod),
                const SizedBox(height: 8.0),
                buildAlignedRow('Amount Paid:', amountPaid),
                const SizedBox(height: 8.0),
                buildAlignedRow('Plan:', plan),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: maincolor, width: 1),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: maincolor),
                  label: Text(
                    'Reject',
                    style: TextStyle(fontSize: 16, color: maincolor),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: maincolor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12.0),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.verified, color: Colors.white),
                  label: const Text(
                    'Confirm',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Pending Payments'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by company name',
                hintStyle: TextStyle(color: maincolor),
                prefixIcon: Icon(
                  Icons.search,
                  color: maincolor,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color:
                        maincolor, 
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: maincolor,
                    width: 2.0,
                  ),
                ),
              ),
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: filteredData.length,
                itemBuilder: (context, index) {
                  final payment = filteredData[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: buildPaymentCard(
                      companyName: payment['companyName']!,
                      paymentMethod: payment['paymentMethod']!,
                      amountPaid: payment['amountPaid']!,
                      plan: payment['plan']!,
                      backgroundColor: const Color.fromRGBO(231, 237, 246, 1),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
