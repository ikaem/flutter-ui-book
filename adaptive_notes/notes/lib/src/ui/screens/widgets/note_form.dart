import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notes/src/models/note_form_data.dart';

class NoteForm extends StatefulWidget {
  const NoteForm({
    super.key,
    this.note,
    this.formKey,
    this.onSubmit,
  });

  final NoteFormData? note;
  final Key? formKey;
  final void Function(NoteFormData)? onSubmit;

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;

  late final _noteFormData = widget.note ?? const NoteFormData();

  @override
  void initState() {
    super.initState();
    // it is interesting how we dont use the _note form data - it is not avaialble here, because we dont know if it is initialized?
    _contentController = TextEditingController(text: widget.note?.content);
    // TODO lets see if this breaks
    _titleController = TextEditingController(text: _noteFormData.title);
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // why scaffold here in a regular widget?
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          widget.onSubmit?.call(
            _noteFormData.copyWith(
                title: _titleController.text, content: _contentController.text),
          );
        },
        label: const Text("Save"),
      ),
      body: Form(
        // this key remains unused really
        // we dont really need controllers if we have key and form fields are nested inside form like this
        key: widget.key,
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 420, maxWidth: 720),
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    label: Text("Title"),
                    border: OutlineInputBorder(),
                    hintText: ("Add a title"),
                  ),
                ),
                const Gap(16),
                TextFormField(
                  controller: _contentController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    label: Text("Content"),
                    border: OutlineInputBorder(),
                    hintText: ("Add content"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
