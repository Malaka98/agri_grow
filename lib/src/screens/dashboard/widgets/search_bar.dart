import 'package:agry_go/src/routes/route_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          onTap: () {
            context.push(Routes.yield.path);
          },
          textAlignVertical: TextAlignVertical.bottom,
          controller: _searchController,
          decoration: InputDecoration(
              hintText: 'Search...',
              contentPadding: const EdgeInsets.all(10),
              suffixIcon: const Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
          onChanged: (String value) {},
        ),
      ),
    );
  }
}
