import 'package:dosify_app/screen/Profile.dart';
import 'package:dosify_app/utils/constants/colors.dart';
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

  void fetchDateAndTime() {
    var now = DateTime.now();
    var formatter = DateFormat('EEEE\nd MMMM', 'id_ID');
    formattedDate = formatter.format(now);
  }

  List<String> data = ["Travel", "Music", "Task"]; // template grid view builder di awal

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
                    return Container(
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