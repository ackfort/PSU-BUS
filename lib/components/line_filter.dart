import 'package:flutter/material.dart';

class LineFilter extends StatelessWidget {
  final List<String> availableLines;
  final String? selectedLine;
  final ValueChanged<String?> onChanged;

  const LineFilter({
    Key? key,
    required this.availableLines,
    required this.selectedLine,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Icon(
              Icons.filter_alt_outlined,
              color: Colors.indigo,
              size: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DropdownButton<String>(
                value: selectedLine ?? "ทั้งหมด",
                isExpanded: true,
                underline: const SizedBox(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.indigo,
                  fontWeight: FontWeight.w500,
                ),
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(12),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.indigo),
                items: availableLines.map((String line) {
                  return DropdownMenuItem<String>(
                    value: line,
                    child: Text(
                      line == "ทั้งหมด" ? "แสดงทั้งหมด" : "สาย $line",
                    ),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}