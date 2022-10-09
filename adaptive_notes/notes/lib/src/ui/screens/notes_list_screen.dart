import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:notes/src/data/providers/layout_provider.dart';
import 'package:notes/src/data/providers/notes_provider.dart';
import 'package:notes/src/navigation/app_router.dart';
import 'package:notes/src/navigation/app_router_paths.dart';
import 'package:notes/src/utils/helpers/device_type.dart';
import 'package:notes/src/utils/helpers/screen_type.dart';

class NotesListScreen extends ConsumerWidget {
  const NotesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        actions: [
          Consumer(
            builder: (context, toggleConsumerRef, child) {
              /* this provider needs to be defined somewhere */
              // why do we not use the top level ref all the time? becuase it might get stale?
              final layout = toggleConsumerRef.watch(layoutProvider);
              final iconData =
                  // have to define that Layout model too it seems
                  layout == Layout.grid ? Icons.grid_view : Icons.view_stream;

              // and now we just return icon button that will toggle data
              // we manualyl set state
              // anjd since we are listening / reading on with consumer, will update
              return IconButton(
                splashRadius: isWebOrDesktopDevice ? 16 : null,
                onPressed: () {
                  final newLayout =
                      layout == Layout.grid ? Layout.list : Layout.grid;

                  // nowe we read state and update
                  // note here that we are now actually reading a notifier - so we need to get notifier, to get its state
                  toggleConsumerRef.read(layoutProvider.notifier).state =
                      newLayout;
                },
                icon: Icon(iconData),
              );
            },
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.zero,
        child: FloatingActionButton.extended(
          onPressed: () {
            appRouter.pushNamed(AppRouterPaths.noteNew);
          },
          label: const Text("Create new note"),
        ),
      ),
      floatingActionButtonLocation: isWebOrMobileDevice
          ? FloatingActionButtonLocation.endFloat
          : FloatingActionButtonLocation.endTop,
      body: Align(
        alignment: Alignment.topCenter,
        child: Consumer(
          // note how here we dont use the ref arg not child
          builder: (context, _, __) {
            final notes = ref.watch(notesProvider);
            final layout = ref.watch(layoutProvider);

            // this refresh thing will force the provider to reavualte its state and return a new value
            // tis causes infinite changes
            // final notesFutureToBeCalledOnRefresh =
            //     ref.refresh(notesProvider.future);

            return RefreshIndicator(
              onRefresh: () => ref.refresh(notesProvider.future),
              // note that the child here
              // ok, so this should return just one widget, and hits possibly return multiple
              child: notes.maybeWhen(
                // so it seems maybe when has a named argument called data
                // and this data is a method that accepts single data field
                // TODO KARLO come back to this to see how this works at all
                // or else will return i guess if there is no data
                // error: ((error, stackTrace) {
                //   return const Text("error");
                // }),
                orElse: () => const SizedBox.shrink(),
                data: (data) {
                  // now we decide between gtrid render and list render
                  if (layout == Layout.grid) {
// getting dimensions for cross axis count
// ok, so shortest side will give use whatever is shortest between width and height
                    // final screenSize = MediaQuery.of(context).size.shortestSide;
                    final screenWidth = MediaQuery.of(context).size.width;
                    final handsetMinWidth = ScreenType.handset.minWidth!;
                    final crossAxisCount =
                        min((screenWidth / handsetMinWidth).floor(), 4);

                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        // note that layout grid is already decide in the providwer - we just react to it
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: StaggeredGrid.count(
                          crossAxisCount: crossAxisCount,
                          // ok, now the children is received from data
                          // and data is actually returning a single thing
                          // i guess this is for data when data exists? i dont know to be hones
                          // children: const [Text("test only")]
                          // this creates error
                          // i dont like this
                          children: data.map(
                            (note) {
                              return Card(
                                elevation: 0,
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        note.title,
                                        maxLines: 2,
                                      ),
                                      // gap is coold becuase it takes its parent main axis
                                      const Gap(8),
                                      Text(
                                        note.content,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final note = data[index];

                      // return const Text("hello");
// TODO temp disable
                      return GestureDetector(
                        onTap: () => appRouter.pushNamed(
                          AppRouterPaths.noteEdit,
                          params: {
                            "id": note.id,
                          },
                        ),
                        // this could should be reused
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  note.title,
                                  maxLines: 2,
                                ),
                                // gap is coold becuase it takes its parent main axis
                                const Gap(8),
                                Text(
                                  note.content,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    // itemCount: data.length,
                    itemCount: data.length,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
