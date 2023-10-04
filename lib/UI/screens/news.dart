import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
            onPressed: () {
              context.go("/");
            },
            child: Text(
              "Home",
              style: Theme.of(context).textTheme.bodyLarge,
            )),
      ),
    );
  }
}
