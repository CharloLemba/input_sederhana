import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: ''),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  String _teks = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Input Sederhana", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            // mainAxisAlignment: .center,
            children: [
              Text(
                "Selamat Datang!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10),
              Text(
                "Silahkan ketik nama dan tekan tombol di bawah untuk menyapa namamu.",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.blueGrey,
                thickness: 1,
                height: 24,
                // indent: 16,
                // endIndent: 16,
              ),
              SizedBox(height: 30),
              TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Masukkan Nama",
                  hintText: "Contoh: Charlo",
                ),
              ),
              SizedBox(height: 10),
              Text(
                _teks.isEmpty ? "Halo!" : 'Halo, $_teks',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _teks = _textEditingController.text;
          });
        },
        backgroundColor: Colors.blueGrey,
        elevation: 5,
        tooltip: "Sapa Nama",
        label: const Text("Sapa Nama", style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.send, color: Colors.white),
      ),
    );
  }
}
