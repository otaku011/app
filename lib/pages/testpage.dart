import 'package:flutter/widgets.dart';
import 'package:app/widgets/notificationcard.dart';
import 'package:app/widgets/horizontalanimelist.dart';
import 'package:app/apis/kitsu.dart' as kitsu; // Kitsu API methods
import 'package:app/widgets/button.dart';
import 'package:app/assets.dart';

class TestPage extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MiruColors.purplePrimary,
      child: ListView(
        children: <Widget>[
          NotificationCard(
            title: 'Welcome!',
            text: 'I hope our app fills your anime needs. Lets us know what you think of it on our website.'
          ),
          Container(
            child: HorizontalAnimeList(
              future: kitsu.getTranding()
            )
          ),
          Button(
            text: 'Press F to pay respects',
            onTap: () {
              print('F pressed!');  
            }
          ),
          Button(
            text: 'Home button',
            onTap: () {
              Navigator.pushNamed(context, '/home');
            }
          )
        ]
      )
    );
  }
}