import 'package:dei_champions/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CandidatesFilter extends ConsumerWidget {
  const CandidatesFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(candidatesListProvider.notifier);

    return PopupMenuButton<String>(
      icon: const Icon(Icons.filter_list),
      onSelected: (filter) => controller.applyFilter(filter),
      itemBuilder: (context) {
        return controller.filters
            .map(
              (filter) =>
                  PopupMenuItem(value: filter, child: Text("Sort by $filter")),
            )
            .toList();
      },
    );
  }
}
