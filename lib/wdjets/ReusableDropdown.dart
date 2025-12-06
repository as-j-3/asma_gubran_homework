import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/app_sttles.dart';

class ReusableDropdown extends StatelessWidget {
  final String hintText;
  final String? selectedValue;
  final List<String> items;
  final void Function(String?) onChanged;
  final double? width;

  const ReusableDropdown({
    super.key,
    required this.hintText,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    this.width,
  });

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    return items.map((String item) {
      return DropdownMenuItem<String>(
        value: item,
        child: Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              item,
              textAlign: TextAlign.right,
            ),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _buildSelectedItem(BuildContext context) {
    return items.map<Widget>((String item) {
      return Align(
        alignment: Alignment.centerRight,
        child: Text(
          item,
          style: Appstyles.secondaryStyle.copyWith(color: Colors.black),
          textAlign: TextAlign.right,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 300.w, // استخدام العرض الممرر أو الافتراضي
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),

          hint: Align(
            alignment: Alignment.centerRight,
            child: Text(
              hintText,
              style: Appstyles.secondaryStyle,
              textAlign: TextAlign.right,
            ),
          ),

          value: selectedValue,
          onChanged: onChanged,
          selectedItemBuilder: _buildSelectedItem,
          items: _buildDropdownItems(),
        ),
      ),
    );
  }
}