import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/view/widgets/custom_appbar_widget.dart';

class ManualBookingScreen extends StatelessWidget {
  const ManualBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Manual booking"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stepper Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStepperColumn(label: "To", isCompleted: true),
                Expanded(child: Divider(color: maincolor, thickness: 1)),
                _buildStepperColumn(label: "From", isCompleted: false),
                Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                _buildStepperColumn(label: "Details", isCompleted: false),
              ],
            ),
            const SizedBox(height: 32),

            // Booking Details Section
            _buildSectionTitle('Booking Details'),
            _buildTextFieldWithIcon('Check In:', Icons.calendar_today),
            const SizedBox(height: 16),
            _buildTextFieldWithIcon('Check Out:', Icons.calendar_today),
            const SizedBox(height: 16),
            _buildTextField('Total (Night):'),
            const SizedBox(height: 32),

            // Hotel Information Section
            _buildSectionTitle('Hotel Information'),
            _buildTextField('Hotel Name:'),
            const SizedBox(height: 16),
            _buildTextField('Room Type:'),
            const SizedBox(height: 16),
            _buildTextField('Room Quantity:'),
            const SizedBox(height: 32),

            // Guests Section
            _buildSectionTitle('Guests'),
            _buildDropdownField('Adults:'),
            const SizedBox(height: 16),
            _buildDropdownField('Children:'),
            const SizedBox(height: 16),
            _buildDropdownField('Total Price:'),
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

  Widget _buildTextFieldWithIcon(String label, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: Icon(icon, color: maincolor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: maincolor),
        ),
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

  Widget _buildStepperColumn({required String label, bool isCompleted = false}) {
    return Column(
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
    );
  }
}
