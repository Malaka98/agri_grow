import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackButtonLeading extends StatelessWidget {
  const BackButtonLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 8, 36, 8),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
          )
        ],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white70,
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed: () {
          context.pop(true);
        },
      ),
    );
  }
}
