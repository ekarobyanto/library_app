import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class AppDropdown extends StatelessWidget {
  final String label;
  final String? placeholder;
  final String? searchPlaceholder;
  final List<String> items;
  final String? selectedItems;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const AppDropdown({
    Key? key,
    required this.label,
    required this.items,
    required this.selectedItems,
    required this.onChanged,
    required this.validator,
    this.placeholder,
    this.searchPlaceholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: const Color(0xFF000000).withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 8),
        DropdownSearch<String>(
          items: items,
          onChanged: onChanged,
          dropdownBuilder: (context, selectedItems) => selectedItems != null
              ? Text(
                  selectedItems,
                  style: TextStyle(color: Colors.grey[600]),
                )
              : Text(
                  placeholder ?? 'Select Something',
                  style: TextStyle(color: Colors.grey[600]),
                ),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          validator: validator,
          popupProps: PopupPropsMultiSelection.menu(
            showSearchBox: true,
            showSelectedItems: true,
            validationWidgetBuilder: (ctx, selectedItems) {
              return const SizedBox.shrink();
            },
            emptyBuilder: (context, searchEntry) {
              return const SizedBox.shrink();
            },
            listViewProps: const ListViewProps(
              shrinkWrap: true,
            ),
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                filled: true,
                hintText: searchPlaceholder ?? 'Find Something',
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
