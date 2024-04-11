// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ApiStore on _ApiStore, Store {
  late final _$movieListAtom =
      Atom(name: '_ApiStore.movieList', context: context);

  @override
  ObservableList<ApiModel> get movieList {
    _$movieListAtom.reportRead();
    return super.movieList;
  }

  @override
  set movieList(ObservableList<ApiModel> value) {
    _$movieListAtom.reportWrite(value, super.movieList, () {
      super.movieList = value;
    });
  }

  late final _$activeMovieDetailsAtom =
      Atom(name: '_ApiStore.activeMovieDetails', context: context);

  @override
  ApiModel? get activeMovieDetails {
    _$activeMovieDetailsAtom.reportRead();
    return super.activeMovieDetails;
  }

  @override
  set activeMovieDetails(ApiModel? value) {
    _$activeMovieDetailsAtom.reportWrite(value, super.activeMovieDetails, () {
      super.activeMovieDetails = value;
    });
  }

  late final _$_ApiStoreActionController =
      ActionController(name: '_ApiStore', context: context);

  @override
  void setActiveMovieDetails(ApiModel? movie) {
    final _$actionInfo = _$_ApiStoreActionController.startAction(
        name: '_ApiStore.setActiveMovieDetails');
    try {
      return super.setActiveMovieDetails(movie);
    } finally {
      _$_ApiStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addApiModel(ApiModel apiModel) {
    final _$actionInfo =
        _$_ApiStoreActionController.startAction(name: '_ApiStore.addApiModel');
    try {
      return super.addApiModel(apiModel);
    } finally {
      _$_ApiStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setApiModels(List<ApiModel> models) {
    final _$actionInfo =
        _$_ApiStoreActionController.startAction(name: '_ApiStore.setApiModels');
    try {
      return super.setApiModels(models);
    } finally {
      _$_ApiStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movieList: ${movieList},
activeMovieDetails: ${activeMovieDetails}
    ''';
  }
}
