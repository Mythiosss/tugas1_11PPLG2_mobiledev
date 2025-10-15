import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/todo_controller.dart';
import 'package:tugas_flutter_1/widgets/custom_card_widget.dart';

class HistoryWidescreen extends StatelessWidget {
  HistoryWidescreen({super.key});

  final TodoController todoController = Get.find<TodoController>();

  final Color mint = const Color(0xFF7FD6D6);
  final Color mintDark = const Color(0xFF5CB3B3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Column(
        children: [
          // HEADER GRADIENT
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 144,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [mint, mintDark],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Riwayat Aktivitas",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Todo yang sudah selesai & dihapus",
                            style: TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                        ],
                      ),
                      Obx(() => Text(
                        "${todoController.history.length} Riwayat",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              const Positioned(
                bottom: -28,
                left: 48,
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.history, size: 32, color: Color(0xFF5CB3B3)),
                ),
              ),
            ],
          ),

          const SizedBox(height: 46),

          // ISI HISTORY
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Obx(() {
                if (todoController.history.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.inbox_outlined, size: 80, color: Colors.grey[300]),
                      const SizedBox(height: 16),
                      const Text(
                        "Belum ada riwayat aktivitas.",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  );
                }

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.4,
                  ),
                  itemCount: todoController.history.length,
                  itemBuilder: (context, index) {
                    final todo = todoController.history[index];
                    return _buildHistoryCard(todo, context, index);
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  // CUSTOM CARD UNTUK HISTORY
  Widget _buildHistoryCard(todo, BuildContext context, int index) {
    final bool isRemoved = todo.removedAt != null;
    final bool isCompleted = todo.isCompleted;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: isRemoved
                ? [Colors.red[50]!, Colors.white]
                : isCompleted
                ? [Colors.green[50]!, Colors.white]
                : [Colors.grey[100]!, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isRemoved
                      ? Icons.delete_outline
                      : isCompleted
                      ? Icons.check_circle_outline
                      : Icons.pending_outlined,
                  color: isRemoved
                      ? Colors.red[400]
                      : isCompleted
                      ? Colors.green[400]
                      : Colors.grey[400],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    todo.namaTodo ?? "Untitled",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isRemoved
                          ? Colors.red[700]
                          : isCompleted
                          ? Colors.green[700]
                          : Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              todo.deskripsiTodo ?? "",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    todo.kategoriTodo ?? "Umum",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  backgroundColor: mintDark,
                ),
                if (todo.completedAt != null)
                  Text(
                    "Selesai: ${todo.completedAt}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
