// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:blogger/services/blog_service.dart';
import '../utils/snackbar_helper.dart';

class AddBlogPage extends StatefulWidget {
  final Map? blog;
  const AddBlogPage({super.key, this.blog});

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;
  @override
  void initState() {
    super.initState();
    final blog = widget.blog;
    if (blog != null) {
      isEdit = true;
      final title = blog['title'];
      final description = blog['description'];
      titleController.text = title;
      descriptionController.text = description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEdit ? 'Edit Blog' : 'Add Blog',
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 205, 155, 4),
        foregroundColor: const Color.fromARGB(255, 194, 8, 8),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(hintText: 'Description'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: isEdit ? updateData : submitData,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              backgroundColor: const Color.fromARGB(255, 205, 155, 4),
              foregroundColor: const Color.fromARGB(255, 194, 8, 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                isEdit ? 'Update' : 'Submit',
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> updateData() async {
    final todo = widget.blog;
    if (todo == null) {
      return;
    }
    final id = todo['_id'];

    // submit data to the server

    final isSuccess = await BlogService.updateBlog(id, body);

    if (isSuccess) {
      titleController.clear();
      descriptionController.clear();
      showSuccessMessage(context, message: 'Updation successful');
    } else {
      showErrorMessage(context, message: 'Updation failed');
    }
  }

  void submitData() async {
    // get the data from form

    // submit data to the server

    final isSuccess = await BlogService.addBlog(body);
    if (isSuccess) {
      titleController.clear();
      descriptionController.clear();

      showSuccessMessage(context, message: 'creation success');
    } else {
      showErrorMessage(context, message: 'creation failed');
    } // show success or fail message based on status
  }

  Map get body {
    final title = titleController.text;
    final description = descriptionController.text;

    return {
      "title": title,
      "description": description,
    };
  }
}
