import 'package:flutter/material.dart';
import 'package:movie_app/models/api_model.dart';
import 'package:movie_app/page/movie_detail_page.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class MovieTiles extends StatelessWidget {
  const MovieTiles({super.key, required this.apiModel});

  final ApiModel apiModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(apiModel.title ?? 'Unknown title'),
      subtitle: Text(apiModel.year ?? 'Unknown year'),
      leading: apiModel.poster != null
          ? SizedBox(
              width: 100,
              height: 100,
              child: Image.network(apiModel.poster!, fit: BoxFit.contain),
            )
          : const Icon(Icons.movie),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        final ApiStore provider = Provider.of<ApiStore>(context, listen: false);
        provider.setActiveMovieDetails(apiModel);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MovieDetailPage(),
          ),
        );
      },
    );
  }
}
