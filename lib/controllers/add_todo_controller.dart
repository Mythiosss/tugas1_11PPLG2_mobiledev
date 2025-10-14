import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/todo_controller.dart';
import 'package:tugas_flutter_1/models/todo_model.dart';

class AddTodoController extends GetxController {
  final namaController = TextEditingController();
  final deskripsiController = TextEditingController();

  var selectedKategori = "".obs;
  final Rxn<DateTime> selectedDueDate = Rxn<DateTime>();

  final TodoController todoController = Get.find<TodoController>();

  final List<String> categories = const ['Sekolah', 'Pribadi', 'Pekerjaan'];

  String formatDateTime(DateTime? dt) {
    if (dt == null) return 'Tidak diatur';
    return '${dt.day.toString().padLeft(2, '0')}-'
        '${dt.month.toString().padLeft(2, '0')}-'
        '${dt.year}';
  }

  Future<void> pickDueDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDueDate.value ?? now,
      firstDate: DateTime(now.year - 2),
      lastDate: DateTime(now.year + 5),
    );

    if (pickedDate != null) {
      setDueDate(DateTime(pickedDate.year, pickedDate.month, pickedDate.day));
    }
  }

  void setKategori(String kategori) {
    selectedKategori.value = kategori;
  }

  void setDueDate(DateTime? dt) {
    selectedDueDate.value = dt;
  }

  // Update method addTodo menjadi async
  Future<void> addTodo() async {
    if (namaController.text.isEmpty || selectedKategori.value.isEmpty) {
      Get.snackbar(
        "Error",
        "Nama kegiatan dan kategori wajib diisi!",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Gunakan method addTodo dari controller yang sudah async
    await todoController.addTodo(
      TodoModel(
        namaTodo: namaController.text.trim(),
        deskripsiTodo: deskripsiController.text.trim(),
        kategoriTodo: selectedKategori.value,
        dueDate: selectedDueDate.value, 
      ),
    );

    clearFields();

    Get.back();
    Get.snackbar(
      "Berhasil",
      "Kegiatan berhasil ditambahkan!",
      snackPosition: SnackPosition.TOP,
    );
  }

  void clearFields() {
    namaController.clear();
    deskripsiController.clear();
    selectedKategori.value = "";
    selectedDueDate.value = null;
  }

  @override
  void onClose() {
    namaController.dispose();
    deskripsiController.dispose();
    super.onClose();
  }
}