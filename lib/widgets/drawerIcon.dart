import 'package:flutter/material.dart';

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Scaffold.of(context).openEndDrawer();
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.5),
                  color: Colors.black),
              height: 3,
              width: 18,
            ),
            const SizedBox(height: 7.5),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.5),
                  color: Colors.black),
              height: 3,
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}
