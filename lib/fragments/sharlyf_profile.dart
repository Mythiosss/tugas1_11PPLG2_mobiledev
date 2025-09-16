import 'package:flutter/material.dart';

class SharlyfProfilePage extends StatelessWidget {
  const SharlyfProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sharlyf Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('lib/assets/image/sharlyf.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              "Sharlyf",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              "@Mythiosss",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: const ListTile(
                leading: Icon(Icons.school, color: Colors.green),
                title: Text('Kelas'),
                subtitle: Text('XI PPLG 2'),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: const ListTile(
                leading: Icon(Icons.home, color: Colors.orange),
                title: Text('Alamat'),
                subtitle: Text('Jl. Jend. Soedirman No.24, Kota Yogyakarta'),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
