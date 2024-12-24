import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/view/screens/manual_booking/from_manual_booking_screen.dart';

class ManualBookingDetailsScreen extends StatelessWidget {
  const ManualBookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Manual Booking'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stepper Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStepperColumn(label: "To", isCompleted: true, onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder:  (context) => const ManualBookingScreen()));
                }),
                const Expanded(
                    child: Divider(color: Colors.grey, thickness: 1)),
                _buildStepperColumn(label: "From", isCompleted: true,onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder:  (context) => const ManualBookingScreen()));
                }),
                const Expanded(
                    child: Divider(color: Colors.grey, thickness: 1)),
                _buildStepperColumn(label: "Details", isCompleted: false,onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder:  (context) => const ManualBookingScreen()));
                }),
              ],
            ),
            const SizedBox(height: 32),

            // Supplier Information Section
            _buildSectionTitle('Supplier Information'),
            _buildDropdownField('Select Supplier:'),
            const SizedBox(height: 16),
            _buildDropdownField('Select Services:'),
            const SizedBox(height: 32),

            // Cost and Currency Section
            _buildSectionTitle('Cost And Currency'),
            _buildDropdownField('Select Your Currency'),
            const SizedBox(height: 16),
            _buildDropdownField('Select Cost:'),
            const SizedBox(height: 16),
            _buildTextField('Price:'),
            const SizedBox(height: 32),

            // Tax Details Section
            _buildSectionTitle('Tax Details'),
            _buildTextField('Tax Type'),
            const SizedBox(height: 16),
            _buildTextField('Taxes'),
            const SizedBox(height: 32),

            // Final Price Section
            _buildSectionTitle('Final Price'),
            _buildTextField('Total Price'),
            const SizedBox(height: 16),

            // Markup Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mark Up:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    _buildMarkupButton('\$'),
                    const SizedBox(width: 8),
                    _buildMarkupButton('%'),
                  ],
                ),
                Switch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: maincolor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: maincolor,
      ),
    );
  }

  Widget _buildDropdownField(String label) {
    return DropdownButtonFormField<String>(
      items: const [],
      onChanged: (value) {},
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: maincolor),
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: maincolor),
        ),
      ),
    );
  }

  Widget _buildMarkupButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: maincolor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(color: maincolor),
      ),
    );
  }


  Widget _buildStepperColumn({
  required String label,
  bool isCompleted = false,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted ? maincolor : Colors.white,
            border: Border.all(color: isCompleted ? maincolor : Colors.grey),
          ),
          child: isCompleted
              ? const Icon(Icons.check, size: 16, color: Colors.white)
              : null,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isCompleted ? maincolor : Colors.grey,
          ),
        ),
      ],
    ),
  );
}

}
