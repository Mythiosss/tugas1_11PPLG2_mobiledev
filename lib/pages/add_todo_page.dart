import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/add_todo_controller.dart';
import 'package:tugas_flutter_1/fragments/home_page.dart';
import 'package:tugas_flutter_1/routes/routes.dart';
import 'package:tugas_flutter_1/widgets/custom_dropdown.dart';
import 'package:tugas_flutter_1/widgets/custom_button.dart';
import 'package:tugas_flutter_1/widgets/custom_tf.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final AddTodoController c = Get.find<AddTodoController>();

  final mint = const Color(0xFF7FD6D6);
  final mintDark = const Color(0xFF5CB3B3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'Tambah Todo Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: mintDark,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Buat Todo Baru',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Isi detail todo. Nama dan kategori wajib diisi.',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: c.namaController,
                      label: 'Nama Todo',
                      hint: 'Contoh: Beli Gula',
                      prefixIcon: Icons.task,
                    ),
                    const SizedBox(height: 16),

                    CustomTextField(
                      controller: c.deskripsiController,
                      label: 'Deskripsi',
                      hint: 'Keterangan singkat (opsional)',
                      prefixIcon: Icons.description,
                      keyboardType: TextInputType.multiline,
                    ),
                    const SizedBox(height: 16),

                    Obx(
                          () => CustomDropdown(
                        items: c.categories,
                        value: c.selectedKategori.value.isEmpty
                            ? null
                            : c.selectedKategori.value,
                        onChanged: (v) => c.setKategori(v ?? ""),
                        label: 'Kategori',
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ===== Due Date row =====
                    Obx(
                          () => Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () => c.pickDueDate(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 14),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_month,
                                    color: Colors.black54),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Due Date',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black54),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        c.formatDateTime(
                                            c.selectedDueDate.value),
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: c.selectedDueDate.value == null
                                              ? Colors.black38
                                              : Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (c.selectedDueDate.value != null)
                                  IconButton(
                                    onPressed: () => c.setDueDate(null),
                                    icon: const Icon(Icons.close),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Tombol Aksi
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Batal',
                      textColor: mintDark,
                      bgColor: Colors.white,
                      onPressed: () {
                        c.clearFields();
                        Get.back();
                      },
                      height: 52,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Obx(() {
                      final isCategoryOk =
                          c.selectedKategori.value.trim().isNotEmpty;
                      final isNameOk =
                          c.namaController.text.trim().isNotEmpty;
                      final enabled = isNameOk && isCategoryOk;

                      return CustomButton(
                        text: 'Simpan',
                        textColor: Colors.white,
                        bgColor: enabled ? mintDark : Colors.grey,
                        onPressed: enabled
                            ? () => c.addTodo()
                            : () {
                          Get.offNamed(AppRoutes.homePage);
                          Get.snackbar(
                            'Todo Info',
                            'Nama dan kategori harus diisi',
                            snackPosition: SnackPosition.TOP,
                          );
                        },
                        height: 52,
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
