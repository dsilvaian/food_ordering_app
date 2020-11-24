import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/details/details-screen.dart';
import 'package:search_widget/search_widget.dart';

import 'search-items.dart';

class SearchBox extends StatefulWidget {
  final List<FoodItems> data;
  const SearchBox(this.data);

  @override
  _SearchBoxState createState() => _SearchBoxState(data);
}

class _SearchBoxState extends State<SearchBox> {
  _SearchBoxState(this.data);
  final List<FoodItems> data;

  @override
  Widget build(BuildContext context) {
    return SearchWidget<FoodItems>(
      dataList: data,
      hideSearchBoxWhenItemSelected: false,
      listContainerHeight: MediaQuery.of(context).size.height / 4,
      queryBuilder: (query, list) {
        return list
            .where((item) =>
                item.item["Item"].toLowerCase().contains(query.toLowerCase()))
            .toList();
      },
      popupListItemBuilder: (item) {
        return PopupListItemWidget(item);
      },
      selectedItemBuilder: (selectedItem, deleteSelectedItem) {
        return SelectedItemWidget(selectedItem, deleteSelectedItem);
      },
      // widget customization
      noItemsFoundWidget: NoItemsFound(),
      textFieldBuilder: (controller, focusNode) {
        return MyTextField(controller, focusNode);
      },
      onItemSelected: (item) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailsScreen(item: item.item);
            },
          ),
        );
      },
    );
  }
}

class SelectedItemWidget extends StatelessWidget {
  const SelectedItemWidget(this.selectedItem, this.deleteSelectedItem);

  final FoodItems selectedItem;
  final VoidCallback deleteSelectedItem;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField(this.controller, this.focusNode);

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x4437474F),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none,
          hintText: "Search here...",
          contentPadding: const EdgeInsets.only(
            left: 16,
            right: 20,
            top: 14,
            bottom: 14,
          ),
        ),
      ),
    );
  }
}

class NoItemsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.folder_open,
          size: 24,
          color: Colors.grey[900].withOpacity(0.7),
        ),
        const SizedBox(width: 10),
        Text(
          "No Items Found",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[900].withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}

class PopupListItemWidget extends StatelessWidget {
  const PopupListItemWidget(this.item);

  final FoodItems item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        item.item["Item"],
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
