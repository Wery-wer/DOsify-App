import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> data = ["Item 1", "Item 2", "Item 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid View'),
        backgroundColor: Color(0xFF3A4D39),
      ),
      body: Column(    
        children: [ 
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF3A4D39), 
              ),
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