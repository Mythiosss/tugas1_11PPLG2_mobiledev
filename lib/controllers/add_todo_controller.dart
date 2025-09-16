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

  void setKategori(String kategori) {
    selectedKategori.value = kategori;
  }

  void setDueDate(DateTime? dt) {
    selectedDueDate.value = dt;
  }

  void addTodo() {
    if (namaController.text.isEmpty || selectedKategori.value.isEmpty) {
      Get.snackbar(
        "Error",
        "Nama kegiatan dan kategori wajib diisi!",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    try {
      todoController.todos.add(
        TodoModel(
          namaTodo: namaController.text.trim(),
          deskripsiTodo: deskripsiController.text.trim(),
          kategoriTodo: selectedKategori.value,
          dueDate: selectedDueDate.value,
        ),
      );
    } catch (e) {
      todoController.todos.add(
        TodoModel(
          namaTodo: namaController.text.trim(),
          deskripsiTodo: deskripsiController.text.trim(),
          kategoriTodo: selectedKategori.value,
        ),
      );
    }

    clearFields();

    Get.back();
    Get.snackbar(
      "Berhasil",
      "Kegiatan berhasil ditambahkan!",
      snackPosition: SnackPosition.BOTTOM,
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
