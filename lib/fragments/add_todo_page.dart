import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/add_todo_controller.dart';
import 'package:tugas_flutter_1/widgets/custom_dropdown.dart';
import 'package:tugas_flutter_1/widgets/custom_button.dart';
import 'package:tugas_flutter_1/widgets/custom_tf.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final AddTodoController c = Get.find(AddTOdo());

  final List<String> _categories = const ['Sekolah', 'Pribadi', 'Pekerjaan'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Tambah Todo'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue.shade700,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Buat Todo Baru',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Isi detail todo-mu. Nama dan kategori wajib diisi.',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 18),

              CustomTextField(
                controller: c.namaController,
                label: 'Nama Todo',
                hint: 'Contoh: Belajar Flutter',
                prefixIcon: Icons.task,
              ),
              const SizedBox(height: 12),

              CustomTextField(
                controller: c.deskripsiController,
                label: 'Deskripsi',
                hint: 'Keterangan singkat (opsional)',
                prefixIcon: Icons.description,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: 12),

              Obx(
                    () => CustomDropdown(
                  items: _categories,
                  value: c.selectedKategori.value.isEmpty
                      ? null
                      : c.selectedKategori.value,
                  onChanged: (v) => c.setKategori(v ?? ""),
                  label: 'Kategori',
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Batal',
                      textColor: Colors.black,
                      bgColor: Colors.white,
                      onPressed: () {
                        c.clearFields();
                        Get.back();
                      },
                      height: 48,
                    ),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: Obx(() {
                      final isNameOk = c.namaController.text.trim().isNotEmpty;
                      final isCategoryOk =
                          c.selectedKategori.value.trim().isNotEmpty;
                      final enabled = isNameOk && isCategoryOk;
                      return CustomButton(
                        text: 'Simpan',
                        textColor: Colors.white,
                        bgColor: enabled ? Colors.blue : Colors.grey,
                        onPressed: enabled
                            ? () => c.addTodo()
                            : () {
                          Get.snackbar(
                            'Todo Info',
                            'Nama dan kategori harus diisi',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        },
                        height: 48,
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
