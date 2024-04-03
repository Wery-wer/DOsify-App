import 'package:dosify_app/screen/HomePage.dart';
import 'package:dosify_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super (key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usiaController = TextEditingController();
  TextEditingController jeniskelaminController = TextEditingController();
  // TextEditingController tanggallahirController = TextEditingController();
  
  // File? image;
  // XFile? img;
  // String imageurl = '';
  // DateTime _dateTime = DateTime.now();
  // FirebaseAuth auth = FirebaseAuth.instance;
  // String uid = "";

  // @override
  // Future getImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   try {
  //     final XFile? imagePicked =
  //         await picker.pickImage(source: ImageSource.gallery);

  //     if (imagePicked != null) {
  //       image = File(imagePicked.path);
  //       img = imagePicked;
  //       setState(() {});
  //     } else {
  //       // Handle the case where the user canceled the image picking.
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text("Image Picking canceled"),
  //         behavior: SnackBarBehavior.floating,
  //       ));
  //     }
  //   } catch (e) {
  //     // Handle any potential errors that might occur during image picking.
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Error picking image: $e"),
  //       behavior: SnackBarBehavior.floating,
  //     ));
  //   }
  // }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3A4D39),
      appBar: AppBar(
        backgroundColor: GColors.fourht,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: GColors.fourht, // Ganti dengan warna yang sesuai
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 4
                            )
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/dumprofile.png',
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )                  
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 75, top: 110),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: GColors.primaryBackground),
                        child: IconButton(
                          icon: const Icon(Icons.photo_camera),
                          color: Colors.white,
                          iconSize: 20,
                          onPressed: () async {
                              // await getImage();
                          },
                        )
                      )
                    ],
                  ),
                ),
              ],
            ),
            customTextField(
              controller: nameController,
              title: "Nama",
              hintText: "Masukan nama",
            ),
            customTextField(
              controller: usiaController,
              title: "Usia",
              hintText: "Masukkan usia",
            ),
            customTextField(
              controller: jeniskelaminController,
              title: "Jenis Kelamin",
              hintText: "Masukkan jenis kelamin",
            ),
            SizedBox(height: 35),
            Container(
                  margin: const EdgeInsets.only(top: 40),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      // UpDatabase(image);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      backgroundColor: GColors.textTitle, // Ubah warna teks
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(350, 50),
                    ),
                    child: const Text(
                      'UPDATE',
                      style:TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20, 
                        fontWeight: FontWeight.bold,
                        color: GColors.primaryBackground
                      ),
                    ),
                  ),
                )
          ],
        ),

        
      ),
    );
  }
}

class customTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  const customTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: GColors.textTitle, // Ubah warna teks
              height: 2,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.bottom,
              controller: controller,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xffA9A9A9),
                      )),
                  hintText: hintText),
              obscureText: false,
            ),
          ),
        ],
      ),
    );
  }
}