import 'package:flutter/material.dart';
import 'package:blogger/screens/add_page.dart';
import 'package:blogger/services/blog_service.dart';
import 'package:blogger/widget/blog_card.dart';
import '../utils/snackbar_helper.dart';

class BlogListPageState extends StatefulWidget {
  const BlogListPageState({super.key});

  @override
  State<BlogListPageState> createState() => _BlogListPageStateState();
}

class _BlogListPageStateState extends State<BlogListPageState> {
  List items = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Blog List',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 205, 155, 4),
        foregroundColor: const Color.fromARGB(255, 194, 8, 8),
      ),
      body: Visibility(
        replacement: RefreshIndicator(
          onRefresh: fetchBlogs,
          child: Visibility(
            visible: items.isNotEmpty,
            replacement: Center(
              child: Text(
                'No blog item',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index] as Map;
                // final id = item['_id'] as String;
                return BlogCard(
                    index: index,
                    item: item,
                    navigateEdit: navigateToEditPage,
                    deleteById: deleteById);
              },
            ),
          ),
        ),
        visible: isLoading,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: navigateToAddPage,
          tooltip: "Add blogs",
          backgroundColor: const Color.fromARGB(255, 205, 155, 4),
          foregroundColor: const Color.fromARGB(255, 194, 8, 8),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          )),
    );
  }

  void navigateToEditPage(Map item) async {
    final route = MaterialPageRoute(
      builder: (context) => AddBlogPage(blog: item),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchBlogs();
  }

  Future<void> navigateToAddPage() async {
    final route = MaterialPageRoute(
      builder: (context) => const AddBlogPage(),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchBlogs();
  }

  Future<void> deleteById(String id) async {
    // Delete the item

    final isSuccess = await BlogService.deleteById(id);
    if (isSuccess) {
      // Remove item from the list
      final filtered = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = filtered;
      });
    } else {
      // show error
      showErrorMessage(context, message: "Deletion Failed...");
    }
    // Remove item from the list
  }

  Future<void> fetchBlogs() async {
    final result = await BlogService.fetchTodos();
    if (result != null) {
      setState(
        () {
          items = result;
        },
      );
    } else {
      showErrorMessage(context, message: 'Something went wrong');
    }
    setState(() {
      isLoading = false;
    });
  }
}
