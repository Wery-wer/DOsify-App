import 'package:dosify_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import 'package:intl/date_symbol_data_local.dart';
import 'package:dosify_app/utils/constants/sizes.dart' as sizes;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String formattedDate = '';

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    // Panggil fungsi untuk memformat tanggal saat inisialisasi
    fetchDateAndTime();
  }

  // Fungsi untuk memformat tanggal
  void fetchDateAndTime() {
    var now = DateTime.now();
    var formatter = DateFormat('EEEE\nd MMMM', 'id_ID');
    formattedDate = formatter.format(now);
  }

  List<String> data = ["Item 1", "Item 2", "Item 3"]; // template grid view builder di awal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Text(
              '$formattedDate',
              style: TextStyle(
                fontFamily: 'Poppins', 
                fontSize: sizes.GSizes.fontSizeLg,
                color: Colors.white
              ),
               // Ubah warna teks menjadi putih
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
              decoration: BoxDecoration(
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
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF2D8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          data[index]
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
          // Tambahkan logika yang diinginkan di sini
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF3A4D39),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Letakkan tombol di bawah kiri
    );
  }
}