import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class PostDropDownForm extends StatefulWidget {
  const PostDropDownForm({
    super.key,
    required this.label,
    required this.controller,
    required this.options,
  });

  final TextEditingController controller;
  final String label;
  final List<String> options;
  @override
  State<PostDropDownForm> createState() => _PostDropDownFormState();
}

class _PostDropDownFormState extends State<PostDropDownForm> {
  TextEditingController searchController = TextEditingController();
  String? selectedValue;
  @override
  void initState() {
    super.initState();
    selectedValue = widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        items: widget.options
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
            widget.controller.text = value!;
          });
        },
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 200,
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: searchController,
          searchInnerWidgetHeight: 50,
          searchInnerWidget: Container(
            height: 50,
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 4,
              right: 8,
              left: 8,
            ),
            child: TextFormField(
              expands: true,
              maxLines: null,
              controller: searchController,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                hintText: 'Search for an item...',
                hintStyle: const TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            return item.value
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase());
          },
        ),
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            searchController.clear();
          }
        },
      ),
    );
  }
}
