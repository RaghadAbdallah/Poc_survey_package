import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isSelected;
  const ListTileWidget({
    Key? key,
    required this.text,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: ListTile(
            title: Text(
              text,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: isSelected ? Theme.of(context).primaryColor : null,
              ),
            ),
            trailing: isSelected
                ? Icon(
              Icons.check_outlined,
              size: 32,
              color: isSelected ? Theme.of(context).primaryColor : null,
            )
                : Container(width: 32, height: 32),
            onTap: () => onTap.call(),
          ),
        ),
        const Divider(color: Colors.grey),
      ],
    );
  }
}
