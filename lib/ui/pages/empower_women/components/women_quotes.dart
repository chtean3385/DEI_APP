import 'package:dei_champions/ui/pages/empower_women/components/women_quote_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/shimmer_loader.dart';

class WomenQuotes extends ConsumerWidget {
  const WomenQuotes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(womenQuoteControllerProvider);
    // Handle loading, error, and data states
    if (state.pageState == PageState.loading) {
      return _loading();
    }

    if (state.pageState == PageState.error) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          state.errorMessage ?? 'Something went wrong.',
          style: TextStyle(color: Colors.black54),
        ),
      );
    }

    final data = state.data;
    if (data == null || data.isEmpty) {
      return const SizedBox.shrink();
    }
    // 🎨 Define your two alternating color schemes
    final List<List<Color>> colorPairs = const [
      [Color(0xFF8B008B), Color(0xFFE6A8D7)], // purple tone
      [Color(0xFF0047AB), Color(0xFF6EC1E4)], // blue tone
    ];

    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(data.length, (index) {
          final quotes = data[index];
          final colors = colorPairs[index % colorPairs.length];
          return WomenQuoteCard(
            text: quotes.text ?? "",
            startColor: colors[0],
            endColor: colors[1],
          );
        }),
      ),
    );
  }



  // assuming you have your model and API data parsed already

  Widget buildShimmerCard() {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(height: 100, width: 300),
    );
  }

  Widget _loading() {
    return  ShimmerLoader(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(2, (index) {
            return buildShimmerCard();
          }),
        ),
      ),
    );
  }

}
