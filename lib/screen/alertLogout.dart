import 'package:dosify_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class alertLogout extends StatelessWidget {
  const alertLogout({super.key});

  void _showLogoutSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 1800),
        content: Text(
          'Berhasil menghapus Task',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: GColors.textTitle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Mengatur sudut bulatan kotak dialog
      ),
      content: const Text("Are you sure want to delete this list ?"),
      actions: [
        TextButton(
            onPressed: () {
              _showLogoutSnackbar(context);
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text(
              'Yes',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold, 
                  color: GColors.primaryBackground, 
                  fontSize: 15),
            )
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: GColors.primaryBackground,
                  fontSize: 15),
            )),
      ],
    );
  }
}
