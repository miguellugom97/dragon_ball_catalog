import 'package:dragon_ball_catallog_flutter/detail/presentation/detail_view_model.dart';
import 'package:dragon_ball_catallog_flutter/home/presentation/character_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/common/utils.dart';
import '../../utils/styles/text_styles.dart';

class DetailScreen extends StatefulWidget {
  final int id;

  const DetailScreen({super.key, required this.id});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final int id;
  late DetailViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<DetailViewModel>(context, listen: false);
    id = widget.id;
    viewModel.getCharacter(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<DetailViewModel>(builder: (context, viewModel, child) {
          return Text(
              viewModel.character?.name ?? getLocalizable(context).loading);
        }),
      ),
      body: Consumer<DetailViewModel>(builder: (context, viewModel, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (viewModel.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(viewModel.errorMessage!)),
            );
          }
        });

        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (viewModel.character == null) {
          return Center(
              child: Text(getLocalizable(context).lblCharacterNotFound));
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12.0),
                    ),
                    child: Image.network(
                      viewModel.character!.image,
                      fit: BoxFit.fitHeight,
                      height: 300,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.character!.name,
                          style: TextStyles.title,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          getLocalizable(context).ki(viewModel.character!.ki),
                          style: TextStyles.body,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}