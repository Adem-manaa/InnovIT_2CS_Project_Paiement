import 'package:flutter/material.dart';
class SimpleAppBar extends StatelessWidget with PreferredSizeWidget{
  final String title;
  const SimpleAppBar({
    Key? key,
    required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: Colors.black
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
            Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
