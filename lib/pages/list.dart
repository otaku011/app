import 'package:app/widgets/anime_card.dart';
import 'package:app/widgets/page.dart';
import 'package:flutter/widgets.dart';
import 'package:app/assets.dart';

class ListPage extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {

    return Container(
      color: MiruColors.dark,
      child: Column(
        children: <Widget>[
          PageTitle('Recently Watched'),
          Expanded(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,20),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 15,
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    childAspectRatio: AnimeCardList.aspectRatio,
                    children: List.generate(5, (index) {
                      return AnimeCardList(
                        imageURL: 'https://animevibe.tv/wp-content/uploads/Kimetsu-no-Yaiba.jpg',
                        title: 'Howl\'s Moving Castle ',
                        type: 'Movie'
                      );
                    }),
                  ),
                ),
              ],
            )
          )
        ]
      )
    );

  }
}