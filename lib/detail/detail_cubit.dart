import 'package:bloc/bloc.dart';
import 'detail_states.dart';
import 'package:session6/detail/details_model.dart';
import 'package:dio/dio.dart';

class DetailCubit extends Cubit<DetailStates> {
  DetailCubit() : super(DetailStates());
  DetailsData? detailsData;
  final dio = Dio();
  Future getDetailsData(final int id) async {
    emit(GetDetailDataLoading());
    try {
      final data = await dio.get(
        "https://api.themoviedb.org/3/person/$id?api_key=2dfe23358236069710a379edd4c65a6b",
      );

      final Map<String, dynamic> map = data.data;

      detailsData = DetailsData.fromJson(map);
      emit(GetDetailDataSuccess(data: DetailsData.fromJson(map)));
    } catch (e) {
      emit(GetDetailDataFailed());
    } finally {}
  }
}
