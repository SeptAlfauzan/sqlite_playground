import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sql_playground/modules/playground/presentation/widgets/atoms/zah_custom_path.dart';
import 'package:sql_playground/modules/playground/presentation/widgets/atoms/zah_custom_path_reverse.dart';
import 'package:sql_playground/ui/colors.dart';

class OutputTimeDevider extends StatefulWidget {
  const OutputTimeDevider({super.key});

  @override
  State<OutputTimeDevider> createState() => _OutputTimeDeviderState();
}

class _OutputTimeDeviderState extends State<OutputTimeDevider> {
  String time = '0000-00-00 00:00:00.000';

  void _initializeCurrentTime() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
        oneSec,
        (Timer t) => setState(() {
              time = DateTime.now().toString();
            }));
  }

  @override
  void initState() {
    super.initState();
    _initializeCurrentTime();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipPath(
          clipper: ZahCustomPath(),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(0xFFA89984),
            ),
            width: 100,
            child: const Text(
              "Output",
              style: TextStyle(color: Color(0xFF282828)),
            ),
          ),
        ),
        ClipPath(
          clipper: ZahCustomPathRevese(),
          child: Container(
              padding: const EdgeInsets.fromLTRB(12, 4, 4, 4),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.darkGreen,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.hourglass_top_outlined,
                    size: 14,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    time,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
