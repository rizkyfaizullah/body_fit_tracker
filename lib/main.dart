import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    IndeksMassaTubuhScreen(),
    InformasiScreen(),
    TersimpanScreen(),
    PengaturanScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Indeks Massa Tubuh',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Informasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Tersimpan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}

class IndeksMassaTubuhScreen extends StatefulWidget {
  @override
  _IndeksMassaTubuhScreenState createState() => _IndeksMassaTubuhScreenState();
}

class _IndeksMassaTubuhScreenState extends State<IndeksMassaTubuhScreen> {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  bool kalkulasiPressed = false;

  // Controllers untuk mengatur data di dalam `TextField`.
  TextEditingController namaController = TextEditingController();
  TextEditingController usiaController = TextEditingController();
  TextEditingController beratController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: Icon(
          Icons.calculate,
          color: Colors.black,
        ),
        title: Text('Indeks Massa Tubuh', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        child: Center(
          child: IntrinsicHeight(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 8),
                  width: screenWidth * 0.9,
                  color: Colors.teal,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Nama', style: TextStyle(color: Colors.white)),
                          Spacer(),
                        ],
                      ),
                      TextField(
                        controller: namaController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.yellow,
                          filled: true,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text('Usia', style: TextStyle(color: Colors.white)),
                          Spacer(),
                        ],
                      ),
                      TextField(
                        controller: usiaController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.yellow,
                          filled: true,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text('Berat badan (Kg)', style: TextStyle(color: Colors.white)),
                          Spacer(),
                        ],
                      ),
                      TextField(
                        controller: beratController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.yellow,
                          filled: true,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text('Tinggi badan (cm)', style: TextStyle(color: Colors.white)),
                          Spacer(),
                        ],
                      ),
                      TextField(
                        controller: tinggiController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.yellow,
                          filled: true,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isMaleSelected = true;
                                isFemaleSelected = false;
                              });
                            },
                            child: Text(
                              'Laki-laki',
                              style: TextStyle(
                                color: isMaleSelected ? Colors.white : Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isMaleSelected ? Colors.blue : Colors.grey,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isMaleSelected = false;
                                isFemaleSelected = true;
                              });
                            },
                            child: Text(
                              'Perempuan',
                              style: TextStyle(
                                color: isFemaleSelected ? Colors.white : Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isFemaleSelected ? Colors.pink : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: screenWidth * 0.6,
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
                  child: kalkulasiPressed
                      ? Center( // Tempatkan tombol "Simpan" di tengah
                          child: Container(
                            color: Colors.yellow,
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    'Hasil',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Teks yang muncul setelah Kalkulasi ditekan',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 16), // Tambahkan jarak antara teks dan tombol "Simpan"
                                Align(
                                  alignment: Alignment.center, // Tempatkan tombol "Simpan" di tengah
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Fungsi callback yang akan dipanggil saat tombol "Simpan" ditekan
                                      // Anda dapat menambahkan logika simpan di sini.
                                    },
                                    child: Text('Simpan', style: TextStyle(color: Colors.black)),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue, // Ganti warna latar belakang sesuai preferensi Anda.
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            setState(() {
                              kalkulasiPressed = true;
                            });
                          },
                          child: Text('Kalkulasi', style: TextStyle(color: Colors.black)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                          ),
                        ),
                ),
                SizedBox(height: 16),
                Container(
                  width: null,
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Reset semua `TextField` menjadi string kosong.
                        // Reset tombol jenis kelamin menjadi tidak terpilih (false).
                        namaController.text = '';
                        usiaController.text = '';
                        beratController.text = '';
                        tinggiController.text = '';
                        isMaleSelected = false;
                        isFemaleSelected = false;
                        kalkulasiPressed = false; // Reset tampilan "Hasil" jika sudah tampil.
                      });
                    },
                    child: Text('Bersihkan', style: TextStyle(color: Colors.yellow)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InformasiScreen extends StatefulWidget {
  @override
  _InformasiScreenState createState() => _InformasiScreenState();
}

class _InformasiScreenState extends State<InformasiScreen> {
  int expandedIndex = -1; // Gunakan indeks untuk melacak kotak teks yang diperluas

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: Icon(
          Icons.info,
          color: Colors.black,
        ),
        title: Text('Informasi', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: screenWidth * 0.9,
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 8),
            color: Colors.teal,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(5, (index) {
                List<String> infoTitles = [
                  "Apa itu Indeks Massa Tubuh?",
                  "Berapa nilai Ideal IMT?",
                  "Mengapa saya perlu IMT?",
                  "Obesitas: Apa penyebabnya?",
                  "Kurang berat badan: Apa penyebabnya?"
                ];

                return Container(
                  color: Colors.yellow,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            infoTitles[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (expandedIndex == index) {
                                  expandedIndex = -1; // Tutup kotak teks jika sudah diperluas
                                } else {
                                  expandedIndex = index; // Buka kotak teks yang diklik
                                }
                              });
                            },
                            child: Icon(
                              expandedIndex == index
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      if (expandedIndex == index)
                        Text(
                          'Ini adalah teks tambahan yang muncul ketika kotak teks diperluas.',
                          style: TextStyle(color: Colors.black),
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class TersimpanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: Icon(
          Icons.bookmark,
          color: Colors.black,
        ),
        title: Text('Tersimpan', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        child: Center(
          child: Text('Halaman Tersimpan'),
        ),
      ),
    );
  }
}

class PengaturanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.9; // Ukuran tombol hampir mendekati batas layar

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: Icon(
          Icons.settings,
          color: Colors.black,
        ),
        title: Text('Pengaturan', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: buttonWidth, // Ukuran tombol hampir mendekati batas layar
                margin: EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi yang ingin Anda lakukan saat tombol "Bahasa" ditekan
                  },
                  child: Text(
                    'Bahasa',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,  // Ukuran teks
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,  // Warna latar belakang
                  ),
                ),
              ),
              Container(
                width: buttonWidth, // Ukuran tombol hampir mendekati batas layar
                margin: EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi yang ingin Anda lakukan saat tombol "Bersihkan Data" ditekan
                  },
                  child: Text(
                    'Bersihkan Data',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,  // Ukuran teks
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,  // Warna latar belakang
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
