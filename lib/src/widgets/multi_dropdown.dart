import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:library_app/src/theme/app_theme.dart';

class AppMultiDropdown extends StatelessWidget {
  final String label;
  final String? placeholder;
  final String? searchPlaceholder;
  final List<String> items;
  final List<String> selectedItems;
  final Function(List<String>)? onChanged;
  final String? Function(List<String>?)? validator;

  const AppMultiDropdown({
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
    return Theme(
      data: Theme.of(context).copyWith(
        buttonTheme: ButtonThemeData(
          alignedDropdown: true,
          buttonColor: color.primaryColor,
          splashColor: color.primaryShade,
        ),
      ),
      child: Column(
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
          DropdownSearch<String>.multiSelection(
            items: items,
            onChanged: (items) {
              onChanged!(items);
            },
            validator: validator,
            selectedItems: selectedItems,
            dropdownBuilder: (context, selectedItems) =>
                selectedItems.isNotEmpty
                    ? Text(
                        selectedItems.join(', '),
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
            popupProps: PopupPropsMultiSelection.menu(
              showSearchBox: true,
              showSelectedItems: true,
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
      ),
    );
  }
}
