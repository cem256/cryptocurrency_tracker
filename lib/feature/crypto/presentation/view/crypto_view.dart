import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/app/router/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CryptoView extends StatelessWidget {
  const CryptoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Markets'),
        actions: [
          IconButton(
            onPressed: () => context.router.push(const SearchRoute()),
            icon: const Icon(Icons.search_outlined),
          ),
        ],
      ),
      body: const Column(),
    );
  }
}
