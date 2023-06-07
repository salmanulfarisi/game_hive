import 'package:flutter/cupertino.dart';

Widget buildLoaderWidget() {
  return const Center(
      child: Column(
    children: [
      CupertinoActivityIndicator(),
    ],
  ));
}
