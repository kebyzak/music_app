import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StoryController controller = StoryController();

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(8),
        child: StoryView(
          controller: controller,
          storyItems: [
            StoryItem.pageImage(
              url:
                  "https://i.pinimg.com/736x/4a/a6/a7/4aa6a784d0e26d91df82f632c55c32f8.jpg",
              caption: 'Taylor Swift',
              controller: controller,
            ),
            StoryItem.pageImage(
              url: "https://pbs.twimg.com/media/EOoXg8GUEAEsYya.jpg",
              caption: "Eminem",
              controller: controller,
            ),
            StoryItem.pageImage(
              url: "https://green-day-fan.ucoz.ru/_ph/1/191529226.jpg",
              caption: "Green Day",
              controller: controller,
            ),
          ],
          progressPosition: ProgressPosition.top,
          repeat: false,
          inline: true,
        ),
      ),
    );
  }
}
