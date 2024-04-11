import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/models/api_model.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiStore provider = Provider.of<ApiStore>(context);
    final ApiModel? activeMovieDetails = provider.activeMovieDetails;

    if (activeMovieDetails == null) {
      return const Center(child: Text('No movie selected'));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeMovieDetails.title ?? 'Unknown title'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 300,
                  child: Image.network(
                    activeMovieDetails.poster!,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title: ${activeMovieDetails.title}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Year: ${activeMovieDetails.year}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Runtime: ${activeMovieDetails.runtime}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Row(
                        children: [
                          ...activeMovieDetails.ratings!.map(
                            (e) => e.source == "Rotten Tomatoes"
                                ? Row(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: SvgPicture.asset(
                                          "assets/tomato.svg",
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '${e.value}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                        softWrap: true,
                                      ),
                                    ],
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ]),
            const SizedBox(height: 8),
            Column(
              children: [
                Text(
                  activeMovieDetails.plot!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_drop_down_sharp,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        content: Text(activeMovieDetails.plot!),
                      ),
                    );
                  },
                )
              ],
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Director: ${activeMovieDetails.director}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Genre: ${activeMovieDetails.genre}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "Main actors: ${activeMovieDetails.actors}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ])
            // Text('Main actors: ${activeMovieDetails.actors}'),
          ],
        ),
      ),
    );
  }
}
