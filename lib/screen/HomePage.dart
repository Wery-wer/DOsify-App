import 'package:dosify_app/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart'; 
import 'package:intl/date_symbol_data_local.dart';
import 'package:dosify_app/utils/constants/sizes.dart' as sizes;
import 'package:dosify_app/widget/FragmentAddList.dart';
import 'package:dosify_app/widget/FragmentAddTask.dart';
import 'package:dosify_app/screen/alertLogout.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? isChecked = false;

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
  
  void addNewList(String newListName) {
    setState(() {
      data.add(newListName);
    });
  }

  List<String> data = ["Travel", "Music", "Task"]; // template grid view builder di awal
  List<String> _tasks = [];


  void fetchDateAndTime() {
    var now = DateTime.now();
    var formatter = DateFormat('EEEE\nd MMMM', 'id_ID');
    formattedDate = formatter.format(now);
  }

  void _showAddListModal(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    FocusNode _focusNode = FocusNode();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FragmentAddList(controller: _controller, focusNode: _focusNode);
      },
    );
  }

  void _showAddTaskModal(BuildContext context) {
    TextEditingController controller = TextEditingController();
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
                        const Spacer(),
                        Text(
                          'Add Task', 
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 17,
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
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: controller,
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
                ..._tasks.map((task) => Row(
                      children: [
                        Checkbox(
                          value: true, // Atur nilai checkbox sesuai dengan keadaan tugas
                          onChanged: (newValue) {
                            // Perbarui keadaan tugas
                          },
                        ),
                        Expanded(
                          child: Text(
                            task,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: sizes.GSizes.fontSizeMd,
                            ),
                          ),
                        ),
                      ],
                    )).toList(),
                SizedBox(height: 520),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const alertLogout();
                          }
                        );
                      },
                      child: Text(
                        'Delete List',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Color(0xffECE3CE),
                        ),
                      ),
                    ),
                    FloatingActionButton( 
                      onPressed: () {
                        setState(() {
                              // Simpan task yang ditulis di dalam TextField ke dalam daftar
                              _tasks.add(controller.text);
                              // Kosongkan TextField setelah menyimpan tugas
                              controller.clear();
                            });
                      },
                      child: Image.asset(
                        'assets/images/plus.png',
                        width: 20,
                        height: 20,
                      ),
                      backgroundColor: GColors.fourht,
                    ),
                ],
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

//ini menampilkan nama yang sesuai dengan nama list dengan nama appbar nya tapi kayanya ga kepake
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