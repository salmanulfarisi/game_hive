import 'package:flutter/material.dart';
import 'package:game_hive/app/utils/themes.dart' as themes;

class ReadMoreWidget extends StatefulWidget {
  final String text;
  final int maxLines;

  const ReadMoreWidget({super.key, required this.text, required this.maxLines});

  @override
  _ReadMoreWidgetState createState() => _ReadMoreWidgetState();
}

class _ReadMoreWidgetState extends State<ReadMoreWidget> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    isExpanded = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: isExpanded ? 5 : widget.maxLines,
          overflow: TextOverflow.ellipsis,
          style: themes.TextStyles.searchText,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isExpanded
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_up,
                color: themes.Colors.mainColor,
              ),
              Text(
                isExpanded ? 'Read more' : 'Read less',
                style: const TextStyle(
                  color: themes.Colors.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
