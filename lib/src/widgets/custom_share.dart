import 'package:flutter/material.dart';
import 'package:share/share.dart';

share(BuildContext context) {
  String text = 'Texto que se muestra para invitar a compartir';
  String description = 'Texto o Url Cualquiera  ';
  final RenderBox box = context.findRenderObject() as RenderBox;
  Share.share(text,
      subject: description,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}
