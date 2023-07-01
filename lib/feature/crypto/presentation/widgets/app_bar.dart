part of '../view/crypto_view.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Markets'),
      leading: IconButton(
        icon: Icon(context.brightness == Brightness.dark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
        onPressed: () => context.read<ThemeCubit>().changeTheme(brightness: context.brightness),
      ),
      actions: [
        IconButton(
          onPressed: () => context.router.push(const SearchRoute()),
          icon: const Icon(Icons.search_outlined),
        ),
      ],
    );
  }
}
