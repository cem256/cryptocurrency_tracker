part of '../view/crypto_view.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Markets'),
      actions: [
        IconButton(
          onPressed: () => context.router.push(const SearchRoute()),
          icon: const Icon(Icons.search_outlined),
        ),
      ],
    );
  }
}
