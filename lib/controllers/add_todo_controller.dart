import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/todo_controller.dart';
import 'package:tugas_flutter_1/models/todo_model.dart';

class AddTodoController extends GetxController {
  final namaController = TextEditingController();
  final deskripsiController = TextEditingController();

  var selectedKategori = "".obs;

  final TodoController todoController = Get.find<TodoController>();

  void setKategori(String kategori) {
    selectedKategori.value = kategori;
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

    todoController.todos.add(
      TodoModel(
        namaTodo: namaController.text,
        deskripsiTodo: deskripsiController.text,
        kategoriTodo: selectedKategori.value,
      ),
    );

    Get.snackbar(
      "Berhasil",
      "Kegiatan berhasil ditambahkan!",
      snackPosition: SnackPosition.BOTTOM,
    );

    Get.back();
  }

  void clearFields() {
    namaController.clear();
    deskripsiController.clear();
    selectedKategori.value = "";
  }

  @override
  void onClose() {
    namaController.dispose();
    deskripsiController.dispose();
    super.onClose();
  }

}