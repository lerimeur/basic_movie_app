import 'package:mobx/mobx.dart';
import 'package:movie_app/models/api_model.dart';

part 'movie_provider.g.dart';

class ApiStore = _ApiStore with _$ApiStore;

abstract class _ApiStore with Store {
  @observable
  ObservableList<ApiModel> movieList = ObservableList<ApiModel>();

  @observable
  ApiModel? activeMovieDetails;

  @action
  void setActiveMovieDetails(ApiModel? movie) {
    activeMovieDetails = movie;
  }

  @action
  void addApiModel(ApiModel apiModel) {
    movieList.add(apiModel);
  }

  @action
  void setApiModels(List<ApiModel> models) {
    movieList = ObservableList.of(models);
  }
}
