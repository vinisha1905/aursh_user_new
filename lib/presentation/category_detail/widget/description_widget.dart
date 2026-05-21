import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final List<String> descriptions;

  DescriptionWidget(this.descriptions);

  @override
  Widget build(BuildContext context) {
    if (descriptions.isEmpty) {
      return Container();
    }
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(top: 2, left: 16, right: 16),
      child: Padding(
        padding: EdgeInsets.only(top: 6, left: 16, right: 16, bottom: 18),
        child: Column(
          children: descriptions
              .map((description) => Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(description,
                        style:
                            TextStyle(color: AppColors.darkGray, height: 1.4)),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
