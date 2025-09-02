import 'package:bloc/bloc.dart';
import 'home_states.dart';
import 'package:session6/home/home_model.dart';
import 'package:dio/dio.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeStates());
  HomeData? homeData;
  final dio = Dio();
  Future getHomeData() async {
    emit(GetHomeDataLoading());
    try {
      final data = await dio.get(
        "https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b",
      );

      final Map<String, dynamic> map = data.data;

      homeData = HomeData.fromJson(map);
      emit(GetHomeDataSucces(data: HomeData.fromJson(map)));
    } catch (e) {
      emit(GetHomeDataFailed());
    } finally {}
  }
}
