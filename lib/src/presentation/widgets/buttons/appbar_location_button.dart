import 'package:flutter/material.dart';
import 'package:oruphones/src/ui/colors.dart';

class AppBarLocationButton extends StatelessWidget {
  const AppBarLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'India',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
          overflow: TextOverflow.ellipsis,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.location_on),
          color: OruColors.appBarIcon,
        )
      ],
    );
  }
}
