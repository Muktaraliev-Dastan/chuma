import 'dart:developer';

import 'package:chum2/src/features/authentication/model/user_entity.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:dio/dio.dart';
import 'package:l/l.dart';

import 'package:chum2/src/features/authentication/data/authentication_data_provider.dart';

class ItemOfDeliveryCard extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback function;

  const ItemOfDeliveryCard(
      {Key? key, required this.iconPath, required this.label, required this.function })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Expanded(
      child: GestureDetector(
        onTap: function,
        child: Column(
          children: [
            SvgPicture.asset(iconPath),
            const SizedBox(
              height: 4,
            ),
            Text(
              label,
              style: _theme.textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }
}
