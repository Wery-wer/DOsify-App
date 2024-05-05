import 'package:dosify_app/screen/Profile.dart';
import 'package:dosify_app/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart'; 
import 'package:intl/date_symbol_data_local.dart';
import 'package:dosify_app/utils/constants/sizes.dart' as sizes;
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Travel"
    },
    {
      "title": "Music"
    },
    {
      "title": "Task"
    },
  ];

  List<String> logoFileNames = [
  'logo1.png',
  'logo2.png',
  'logo3.png',
  ];

  String formattedDate = '';

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    fetchDateAndTime();
  }

  List<String> data = ["Travel", "Music", "Task"]; // template grid view builder di awal

  void addNewList(String newListName) {
  setState(() {
    data.add(newListName);
  });
}

  void fetchDateAndTime() {
    var now = DateTime.now();
    var formatter = DateFormat('EEEE\nd MMMM', 'id_ID');
    formattedDate = formatter.format(now);
  }

  // final List<Map<String, dynamic>> myProducts = List.generate(100000, (index) => {
  //   "id": index,
  //   "name": "Product $index",
  // }).toList();

  void _showAddListModal(BuildContext context) {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            color: GColors.textPrimary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13),
              topRight: Radius.circular(13),
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              AppBar(
                backgroundColor: GColors.textPrimary,
                title: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (_controller.text.isNotEmpty){
                            addNewList(_controller.text);
                            Navigator.pop(context);
                          } else {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Nama List Harus Di Isi',
                                  style: TextStyle(
                                    color: GColors.primaryBackground,
                                    fontFamily: 'Poppins',
                                    fontSize: sizes.GSizes.fontSizeMd,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                backgroundColor: Color(0xFFFFF2D8),
                                behavior: SnackBarBehavior.floating,
                                action: SnackBarAction(
                                  label: 'Dismiss',
                                  disabledTextColor: Colors.white,
                                  textColor: GColors.primaryBackground,
                                  onPressed: () {
                                    //Do whatever you want
                                  },
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: sizes.GSizes.fontSizeLg,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Add List',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: sizes.GSizes.fontSizeLg,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                automaticallyImplyLeading: false,
                elevation: 0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  autofocus: true, 
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Enter your task',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: sizes.GSizes.fontSizeMd,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
    
  void _showAddTaskModal(BuildContext context) {
  
  FocusNode _focusNode = FocusNode();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            color: GColors.textPrimary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13),
              topRight: Radius.circular(13),
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              AppBar(
                backgroundColor: GColors.textPrimary,
                title: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: sizes.GSizes.fontSizeLg,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Add List',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: sizes.GSizes.fontSizeLg,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                automaticallyImplyLeading: false,
                elevation: 0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: TextField(
                  // controller: _controller,
                  focusNode: _focusNode,
                  autofocus: true, 
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Enter your task',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: sizes.GSizes.fontSizeMd,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
              '$formattedDate',
              style: const TextStyle(
                fontFamily: 'Poppins', 
                fontSize: sizes.GSizes.fontSizeLg,
                color: Colors.white
              ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.calendar_month_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: GColors.textPrimary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(13),
                            topRight: Radius.circular(13),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0), 
                          child: Theme(
                            data: ThemeData(
                              primarySwatch: Colors.deepOrange,
                              colorScheme: ColorScheme.light(primary: Color.fromARGB(255, 252, 71, 0)),
                              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
                            ),
                            child: Container(
                              height: 600, 
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFF2D8),
                                borderRadius: BorderRadius.all(Radius.circular(13)),
                              ),
                              child: CalendarDatePicker(
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                                onDateChanged: (selectedDate) {
                                  print('Tanggal dipilih: $selectedDate');
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        backgroundColor: GColors.textPrimary,
      ),
      body: Column(    
        children: [ 
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 14,right: 14),
            decoration: const BoxDecoration(
              color: GColors.primaryBackground,
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: GColors.textTitle,
                contentPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                prefixIcon: Image.asset(
                  'assets/images/search.png',
                  width: 20,
                  height: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFF3A4D39),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(11),
              decoration: const BoxDecoration(
                color: Color(0xFF3A4D39), 
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                  ), 
                  itemCount: data.length,
                  itemBuilder: (_, index){
                    Random random = Random();
                    String randomLogoFileName = logoFileNames[random.nextInt(logoFileNames.length)];
                    String logoAssetPath = 'assets/logo/$randomLogoFileName';
                    return GestureDetector(
                      onTap: () {
                        _showAddTaskModal(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF2D8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 8.0,
                              left: 8.0,
                              child: Image.asset(
                                logoAssetPath,
                                width: 30,
                                height: 30,
                              ),
                            ),
                            Positioned(
                              bottom: 8.0,
                              left: 8.0,
                              child: Text(
                                data[index],
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton( // Tombol Floating
        onPressed: () {
          _showAddListModal(context);
        },
        child: Icon(
          Icons.file_upload_outlined,
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF3A4D39),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Letakkan tombol di bawah kiri
    );
  }
}

//ini buat konten item dari setiap yang dipilih
class ItemContentWidget extends StatelessWidget{
  final String data;
  ItemContentWidget({required this.data});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          data,
          style: TextStyle(
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}