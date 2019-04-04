import 'package:flutter/widgets.dart'; // Material design package
import 'package:app/apis/kitsu.dart' as KitsuAPI; // Kitsu API methods
import 'package:app/widgets/anime_widget_small.dart'; // Anime widget

class SearchPage extends StatelessWidget  {
  final String title;

  SearchPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: KitsuAPI.getTrending(), // sets the getTranding method as the expected Future
        builder: (context, snapshot) {
          if (snapshot.hasData) { //checks if the response returns valid data
            final List<AnimeWidgetSmall> animeList = [];

            // Add the widgets to the list
            snapshot.data.forEach((anime) {
              animeList.add(AnimeWidgetSmall(anime: anime));
            });

            // Building the basic UI
            return Container(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: animeList,
              ),
            );
          } else if (snapshot.hasError) { //checks if the response throws an error
            return Text(snapshot.error);
          }

          return Text("Loading..."); // If no errors and no data, assume still loading
        }
      )
    );
  }
}