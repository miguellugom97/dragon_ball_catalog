import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final int id;

  const DetailScreen({super.key, required this.id});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final int id;

  @override
  void initState() {
    super.initState();
    id = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Character ID: $id"),
      ),
      body: Center(
        child: Text("Details for character ID: $id"),
      ),
    );
  }
}
