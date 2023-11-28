// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pdv_teste1/Theme/themes.dart';
import 'package:pdv_teste1/screens/tela_aplicativo.dart';
import 'package:provider/provider.dart';
import 'package:pdv_teste1/controller/estado_dark_light.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(46.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: const CustomAppBarContent(),
    );
  }
}

class CustomAppBarContent extends StatelessWidget {
  const CustomAppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Row(
      children: [
        IconButton(
          icon: themeNotifier.currentTheme == darkTheme ? const Icon(Icons.light_mode) : const Icon(Icons.dark_mode),
          onPressed: () {
            themeNotifier.toggleTheme();
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TelaAplicativo(),
              ),
            );
          },
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Image.asset(
            'assets/images/bistro3.png',
            height: isMobile ? 40 : 40,
            width: isMobile ? 40 : 40,
          ),
        ),
      ],
    );
  }
}
