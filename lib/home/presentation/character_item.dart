import 'package:dragon_ball_catallog_flutter/utils/common/utils.dart';
import 'package:dragon_ball_catallog_flutter/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/routes.dart';
import '../domain/entities/character.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({required Key key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.detail,
          arguments: character.id,
        );
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(
                character.image,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: TextStyles.subtitle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    getLocalizable(context).ki(character.ki),
                    style: TextStyles.body,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
