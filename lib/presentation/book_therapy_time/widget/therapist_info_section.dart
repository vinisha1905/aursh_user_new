import 'package:flutter/material.dart';
class TherapyInfoSection extends StatelessWidget {
  final List<String> items;

  const TherapyInfoSection({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 24,
            vertical: isMobile ? 16 : 20,
          ),
          color: const Color(0xFFF3F3F3),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(items.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: index == items.length - 1 ? 0 : 12,
                    ),
                    child: _CompactBullet(
                      text: items[index],
                    ),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
class _CompactBullet extends StatelessWidget {
  final String text;

  const _CompactBullet({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 6),
          child: Icon(
            Icons.circle,
            size: 5,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              color: Color(0xFF222222),
            ),
          ),
        ),
      ],
    );
  }
}
