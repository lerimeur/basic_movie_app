import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/models/api_model.dart';
import 'package:movie_app/page/movie_detail_page.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:movie_app/services/client.dart';
import 'package:movie_app/widget/movie_tiles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  final List<ApiModel> _suggestedMovie = [];
  final List<String> _pastSearches = [];

  getSugestedMovies() async {
    final suggestedMovies = ['Avatar', 'The Matrix', "The Godfather"];
    List<ApiModel> movieList = [];
    for (var item in suggestedMovies) {
      final resp = await Provider.of<Client>(context, listen: false)
          .getMovieDetail(name: item);
      movieList.add(resp);
    }

    setState(() {
      _suggestedMovie.addAll(movieList);
    });
  }

  getMovieDetails(ApiStore apiStore, BuildContext context) async {
    try {
      final ApiModel value =
          await Provider.of<Client>(context, listen: false).getMovieDetail(
        name: _searchController.text,
      );
      apiStore.addApiModel(value);
      apiStore.setActiveMovieDetails(value);

      Future.microtask(() {
        setState(() {
          _pastSearches.add(_searchController.text);
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MovieDetailPage(),
          ),
        );
      });
    } catch (e) {
      Future.microtask(() {
        showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Error"),
                Text("movie not found"),
              ],
            ),
          ),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getSugestedMovies();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search a movie by his title',
              ),
              // GOTO details page
              onSubmitted: (_) => getMovieDetails(provider, context)),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _suggestedMovie.isNotEmpty
                ? Column(
                    children: [
                      ..._suggestedMovie
                          .map((ApiModel item) => MovieTiles(apiModel: item)),
                      const Divider(),
                    ],
                  )
                : Container(),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text('Past Searches'),
            ),
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                    itemCount: provider.movieList.length,
                    itemBuilder: (_, index) =>
                        MovieTiles(apiModel: provider.movieList[index])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
