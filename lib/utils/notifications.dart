import 'package:flutter/material.dart';

void showFavoriteSnackBar(BuildContext context, {required bool isNowFavorite}) {
  final message = isNowFavorite ? 'Ditambahkan ke Favorit' : 'Dihapus dari Favorit';
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
}

