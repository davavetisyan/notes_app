import 'package:flutter/material.dart';
import 'package:notes_app/core/config/theme/app_colors.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {super.key,
      required this.text,
      required this.greenText,
      required this.redText,
      required this.onGreenPressed,
      required this.onRedPressed});
  final String text;
  final String greenText;
  final String redText;
  final void Function()? onGreenPressed;
  final void Function()? onRedPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.mainBgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.info_outline,
              color: Colors.grey,
              size: 40,
            ),
            const SizedBox(height: 20),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  onPressed: () {
                    if (onRedPressed != null) {
                      onRedPressed!();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    redText,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  onPressed: () {
                    if (onGreenPressed != null) {
                      onGreenPressed!();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    greenText,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
