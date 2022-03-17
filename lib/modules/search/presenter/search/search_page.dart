import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: const Text('Github Search'),
      ),
      body: Column(
        children: [
          const TextField(),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (_, id) {
                return const Center(
                  child: Text('GitHub'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
