import 'package:flutter/material.dart';

class InsectTextBox extends StatelessWidget {
  final String title;
  final List<String> content;

  const InsectTextBox({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            '$title:',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: content.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  '${index + 1}. ${content[index]}', // Numbering content
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.visible,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}