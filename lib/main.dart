import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/page/home_page.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:movie_app/services/client.dart';
import 'package:movie_app/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load();
  final String? apikey = dotenv.env['API_KEY'];
  final String? baseUrl = dotenv.env['BASE_URL'];

  if (apikey == null || baseUrl == null) {
    throw Exception('API_KEY or BASE_URL not found in .env file');
  }

  runApp(MultiProvider(
    providers: [
      Provider<ApiStore>(
        create: (_) => ApiStore(),
      ),
      Provider<Client>(
        create: (_) => Client(
          baseUrl: baseUrl,
          apiKey: apikey,
        ),
      ),
    ],
    child: MaterialApp(
      title: 'Lunni test',
      theme: appTheme,
      home: const HomePage(),
      // HomePage(),
    ),
  ));
}
