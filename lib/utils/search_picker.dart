import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _SearchPicker extends StatefulWidget {
  final List<SearchPickerItem> items;
  const _SearchPicker({Key? key, required this.items}) : super(key: key);

  @override
  State<_SearchPicker> createState() => _SearchPickerState();
}

class _SearchPickerState extends State<_SearchPicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              CupertinoTextField(
                placeholder: "Buscar",
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    final item = widget.items[index];
                    return ListTile(
                      title: Text(item.label),
                      onTap: () {
                        Navigator.pop(context, item.value);
                      },
                    );
                  },
                  itemCount: widget.items.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchPickerItem {
  final String label;
  final dynamic value;

  SearchPickerItem({required this.label, @required this.value});
}

Future<dynamic> showSearchPicker(BuildContext context,
    {required List<SearchPickerItem> items}) async {
  return showDialog(
    context: context,
    builder: (_) => _SearchPicker(items: items),
  );
}
