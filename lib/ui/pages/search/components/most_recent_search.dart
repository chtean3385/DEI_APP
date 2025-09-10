import 'package:flutter/material.dart';


class MostRecentSearches extends StatelessWidget {
  final List<String> recentSearchList;

  const MostRecentSearches({super.key, required this.recentSearchList});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24, top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Your most recent searches",
                style: theme.titleMedium,
              ),
            ),

            const SizedBox(height: 8),

            // Horizontal scroll list
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: recentSearchList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(6),
                          bottomLeft: Radius.circular(6),
                          bottomRight: Radius.circular(16),
                        ),

                        color: Colors.white,
                      ),
                      child:  SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.search, color: Colors.black45, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                recentSearchList[index],
                                style: theme.bodyMedium, // use a readable style
                                maxLines: 2, // allow wrapping up to 2 lines
                                overflow: TextOverflow.ellipsis, // trim with "..."
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
