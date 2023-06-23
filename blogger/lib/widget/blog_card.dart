import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  const BlogCard(
      {super.key,
      required this.index,
      required this.item,
      required this.navigateEdit,
      required this.deleteById});
  final int index;
  final Map item;
  final Function(Map) navigateEdit;
  final Function(String) deleteById;

  @override
  Widget build(BuildContext context) {
    final id = item['_id'] as String;
    return Card(
      color: const Color.fromARGB(255, 239, 237, 145),
      shadowColor: const Color.fromARGB(255, 60, 230, 41),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 246, 217, 128),
          child: Text(
            '${index + 1}',
            style: const TextStyle(color: Colors.black),
          ),
        ),
        title: Text(
          item['title'],
        ),
        subtitle: Text(
          item['description'],
        ),
        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == 'edit') {
              // open edit page
              navigateEdit(item);
            } else if (value == 'delete') {
              // Delete and remove the item
              deleteById(id);
            }
          },
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: 'edit',
                child: Text('Edit'),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Text('Delete'),
              ),
            ];
          },
        ),
      ),
    );
  }
}
