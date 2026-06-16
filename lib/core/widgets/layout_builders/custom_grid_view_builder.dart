import 'package:flutter/material.dart';
import 'package:training_acedamy/core/extensions/extension.dart';

class CustomGridViewBuilder extends StatefulWidget {
  const CustomGridViewBuilder({
    required this.numberOfRows,
    required this.widgets,
    this.horizontalSpacing,
    this.verticalSpacing,
    this.widgetHeight,
  });
  final int numberOfRows;
  final List<Widget> widgets;
  final double? verticalSpacing;
  final double? horizontalSpacing;
  final double? widgetHeight;
  @override
  State<CustomGridViewBuilder> createState() => _CustomGridViewBuilderState();
}

class _CustomGridViewBuilderState extends State<CustomGridViewBuilder> {
  late int numberOfColumns;
  @override
  Widget build(BuildContext context) {
    numberOfColumns =
        ((widget.widgets.length + widget.numberOfRows - 1) /
                widget.numberOfRows)
            .toInt();
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: widget.verticalSpacing ?? 8.sp,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < widget.numberOfRows; i++)
          Row(
            spacing: widget.horizontalSpacing ?? 8.sp,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int j = 0; j < numberOfColumns; j++)
                if (i * numberOfColumns + j < widget.widgets.length)
                  Expanded(
                    child: SizedBox(
                      height: widget.widgetHeight,
                      child: widget.widgets[i * numberOfColumns + j],
                    ),
                  )
                else
                  Expanded(child: Container()),
            ],
          ),
      ],
    );
  }
}
