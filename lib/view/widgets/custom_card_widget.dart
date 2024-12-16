import 'package:flutter/material.dart';

class OperationCard extends StatelessWidget {
  final int index;
  final String operationId;
  final String clientName;
  final String status;
  final Color statusColor;
  final Color statusTextColor;
  final Color? borderColor;
  final int selectedCardIndex;
  final VoidCallback onTap;

  const OperationCard({
    super.key,
    required this.index,
    required this.operationId,
    required this.clientName,
    required this.status,
    required this.statusColor,
    required this.statusTextColor,
    this.borderColor,
    required this.selectedCardIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: selectedCardIndex == index
              ? const Color.fromRGBO(255, 255, 255, 1)
              : const Color.fromRGBO(231, 237, 246, 1),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: selectedCardIndex == index
                ? Theme.of(context).primaryColor
                : (borderColor ?? Colors.transparent),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Operation ID: $operationId',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Client Name: $clientName',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Text(
                  'Status: ',
                  style: TextStyle(fontSize: 16.0),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusTextColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
