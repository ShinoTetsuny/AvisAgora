import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/app.components/app_bar_all.dart';
import 'package:http/http.dart' as http;

class CommentForm extends StatefulWidget {
  final int productId;

  CommentForm({required this.productId});

  @override
  _CommentFormState createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {
  final TextEditingController _commentController = TextEditingController();
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'Comment',
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButton<int>(
              value: _rating,
              onChanged: (value) {
                setState(() {
                  _rating = value!;
                });
              },
              items: List.generate(6, (index) {
                return DropdownMenuItem<int>(
                  value: index,
                  child: Text('$index'),
                );
              }),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _submitComment();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitComment() async {
    final comment = _commentController.text;
    const url = 'http://192.168.130.237:3000/comments/';
    final Map<String, dynamic> body = {
      'comment': comment,
      'rating': _rating,
      'productId': widget.productId,
    };
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body)
    );

    if (response.statusCode == 201) {
      print('Comment submitted successfully');
      // Do something here, like showing a success message
      Navigator.pop(context);
    } else {
      print('Failed to submit comment');
      // Do something here, like showing an error message
    }
  }
}