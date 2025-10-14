import 'package:flutter/material.dart';

class AmirProfileWidescreen extends StatelessWidget {
  const AmirProfileWidescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amir Profile (Widescreen)'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // KIRI: Foto profil + nama
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('lib/assets/image/amir.jpg'),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Amir",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "@dettarune",
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Kembali'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 40),

                // KANAN: Detail informasi
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Informasi Profil",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildInfoCard(
                        icon: Icons.school,
                        color: Colors.green,
                        title: "Kelas",
                        subtitle: "XI PPLG 2",
                      ),
                      const SizedBox(height: 12),
                      _buildInfoCard(
                        icon: Icons.home,
                        color: Colors.orange,
                        title: "Alamat",
                        subtitle:
                        "Jl. Jend. Soedirman No.24, Kota Yogyakarta",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
