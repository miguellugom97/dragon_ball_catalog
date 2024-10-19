import 'package:dragon_ball_catallog_flutter/home/presentation/character_item.dart';
import 'package:dragon_ball_catallog_flutter/home/presentation/home_view_model.dart';
import 'package:dragon_ball_catallog_flutter/utils/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    viewModel.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (viewModel.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(viewModel.errorMessage!)),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(getLocalizable(context).appName),
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.6),
              itemCount: viewModel.characters.length,
              itemBuilder: (context, index) {
                final character = viewModel.characters[index];
                return Padding(
                  padding:
                      const EdgeInsets.all(8.0), // Add padding around each Card
                  child: CharacterItem(
                    character: character,
                    key: ValueKey(character.id),
                  ),
                );
              },
            ),
    );
  }
}
