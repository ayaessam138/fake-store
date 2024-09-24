import 'package:flutter/material.dart';
import 'package:uitraning/Core/AppStyles.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.search, color: Color(0xffBBBBBB)),
            ),

            Text(
              'Search any Product',
              style: AppStyles.styleRegular14(context)
                  .copyWith(color: const Color(0xffBBBBBB)),
            ),
            const Spacer(),
            const Icon(Icons.mic, color: Color(0xffBBBBBB))
          ],
        ),
      ),
    );
  }
}