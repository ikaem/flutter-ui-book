import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/data/providers/note_action_controller_provider.dart';
import 'package:notes/src/data/providers/notes_provider.dart';
import 'package:notes/src/models/note_form_data.dart';
import 'package:notes/src/navigation/app_router.dart';
import 'package:notes/src/ui/screens/widgets/note_form.dart';

class NoteDetailsScreen extends StatefulWidget {
  const NoteDetailsScreen({
    super.key,
    this.id,
  });

  final String? id;

  @override
  State<NoteDetailsScreen> createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  // todo THIS IS for submit
  Future<void> createNote({
    required WidgetRef ref,
    String? content,
    String? title,
  }) async {
    await ref.read(noteActionControllerProvider).createNote(
          title: title ?? "",
          content: content ?? "",
        );

    // and we also pop - to go back somewhere?
    appRouter.pop();
  }

// these could easily be the same functions
  Future<void> updateNote({
    required WidgetRef ref,
    required String id,
    String? content,
    String? title,
  }) async {
    await ref
        .read(noteActionControllerProvider)
        .updateNote(id: id, title: title ?? "", content: content ?? "");

    appRouter.pop();
  }

  @override
  Widget build(BuildContext context) {
    // final id = widget.id;

    return Consumer(
      builder: (context, ref, child) {
        final id = widget.id;

        if (id == null) {
          // return const Text("This is for creating note");
          return NoteForm(
            formKey: _formKey,
            onSubmit: (noteFormData) async {
              await createNote(
                  ref: ref,
                  content: noteFormData.content,
                  title: noteFormData.title);
            },
          );
        }

        // now we need to select the note based on id - and we do fetch it actually
        // wathc will
        /* 
          - return value that the provider exposes 
          - it will also rebuild the widget when this value changes 
         */

        // ok, so with select we filter unwated rebuilds - we only want to rebuild when the seelcted value changes
        // there is so many nested selections
        // ok, this is crazy
        /* 
        - we select from provider value 
        - we switch to only when data exists 
        - inside the data, we return first where ntoe is same as the one we passed in 
          - or null - in whcih case it should not rebuild
        
         */
        // future note is only used for knowing if we want to render or not
        final futureNote = ref.watch(
          notesProvider.select(
            (value) => value.whenData(
              (data) => data.firstWhereOrNull((note) => note.id == id),
            ),
          ),
        );

// and now with maybe when i guess we await for data - so it is a future builder kinda thing
        final ui = futureNote.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          data: ((data) {
            // return const Text("this is editing ntoe");

            return NoteForm(
              formKey: _formKey,
              // this note is not the note we want from future note
              // this should be called note form data instead of note
              onSubmit: (noteFormData) async {
                // on submit should also be mandatory
                await updateNote(
                  ref: ref,
                  id: widget.id!,
                  content: data?.content ?? "",
                  title: data?.title ?? "",
                );
              },
              note: NoteFormData(
                content: data?.content ?? "",
                title: data?.title ?? "",
              ),
            );
          }),
        );

        return ui;
      },
    );
  }
}
