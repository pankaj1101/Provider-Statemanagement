import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/model/task_model.dart';
import 'package:sample/view_model/task_view_model.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  void _openAddSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddNoteSheet(
        onAdd: (note) {
          context.read<TaskViewModel>().setNotes(note);

          // setState(() => _notes.add(note));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ──
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'My Notes',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE53935),
                    letterSpacing: 0.5,
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Pending Task',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              // ── Notes list ──
              Consumer<TaskViewModel>(
                builder: (_, controller, __) {
                  return Expanded(
                    child: controller.pendingNotes.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.note_alt_outlined,
                                  size: 64,
                                  color: const Color(
                                    0xFFE53935,
                                  ).withOpacity(0.3),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'No notes yet.\nTap + to add one.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color(
                                      0xFFE53935,
                                    ).withOpacity(0.5),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.separated(
                            itemCount: controller.pendingNotes.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, index) => _NoteCard(
                              note: controller.pendingNotes[index],
                              onTapCheck: () {
                                controller.markIsCompleted(
                                  controller.pendingNotes[index].id,
                                );
                              },
                            ),
                          ),
                  );
                },
              ),

              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Complete Task',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              // ── Notes list ──
              Consumer<TaskViewModel>(
                builder: (_, controller, __) {
                  return Expanded(
                    child: controller.completeNotes.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.note_alt_outlined,
                                  size: 64,
                                  color: const Color(
                                    0xFFE53935,
                                  ).withOpacity(0.3),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'No notes yet.\nTap + to add one.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color(
                                      0xFFE53935,
                                    ).withOpacity(0.5),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.separated(
                            itemCount: controller.completeNotes.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, index) => _NoteCard(
                              note: controller.completeNotes[index],
                              onTapCheck: () {
                                controller.markIsCompleted(
                                  controller.completeNotes[index].id,
                                );
                              },
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // ── FAB ──
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddSheet,
        backgroundColor: const Color(0xFFE53935),
        foregroundColor: Colors.white,
        elevation: 4,
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }
}

// ── Note Card ────────────────────────────────────────────────────────────────

class _NoteCard extends StatelessWidget {
  final TaskModel note;
  final VoidCallback onTapCheck;
  const _NoteCard({required this.note, required this.onTapCheck});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE53935).withOpacity(0.35),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE53935).withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                if (note.description != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    note.description ?? "",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                  ),
                ],
              ],
            ),
          ),
          IconButton(
            onPressed: onTapCheck,
            icon: Icon(Icons.circle_outlined, color: const Color(0xFFE53935)),
          ),
          // Icon(Icons.circle_outlined),
          // check_circle
        ],
      ),
    );
  }
}

// ── Add Note Bottom Sheet ─────────────────────────────────────────────────────

class AddNoteSheet extends StatefulWidget {
  final void Function(TaskModel) onAdd;
  const AddNoteSheet({super.key, required this.onAdd});

  @override
  State<AddNoteSheet> createState() => _AddNoteSheetState();
}

class _AddNoteSheetState extends State<AddNoteSheet> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  void _submit() {
    final title = _titleController.text.trim();
    if (title.isEmpty) return;

    final String id = DateTime.now().millisecondsSinceEpoch.toString();

    widget.onAdd(
      TaskModel(title: title, description: _descController.text.trim(), id: id),
    );
    Navigator.of(context).pop();
  }

  // memory leak
  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20 + bottomInset),
      decoration: BoxDecoration(
        color: const Color(0xFFF5EDE8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFE53935).withOpacity(0.4),
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Drag handle ──
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFE53935).withOpacity(0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // ── Title field ──
          _StyledTextField(
            controller: _titleController,
            hint: 'title',
            maxLines: 1,
          ),

          const SizedBox(height: 14),

          // ── Description field ──
          _StyledTextField(
            controller: _descController,
            hint: 'Desc',
            maxLines: 4,
          ),

          const SizedBox(height: 16),

          // ── Add button ──
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE53935),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Add',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Styled text field ─────────────────────────────────────────────────────────

class _StyledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;

  const _StyledTextField({
    required this.controller,
    required this.hint,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(fontSize: 15, color: Color(0xFF1A1A1A)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: const Color(0xFFE53935).withOpacity(0.5),
          fontSize: 15,
          fontStyle: FontStyle.italic,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.85),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: const Color(0xFFE53935).withOpacity(0.35),
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: const Color(0xFFE53935).withOpacity(0.35),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE53935), width: 2),
        ),
      ),
    );
  }
}
