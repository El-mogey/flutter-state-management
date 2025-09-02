import 'package:bloc/bloc.dart';
import 'photos_states.dart';
import 'package:session6/detail/photos_model.dart';
import 'package:dio/dio.dart';

class PhotosCubit extends Cubit<PhotosDetailStates> {
  PhotosCubit() : super(PhotosDetailStates());
  PhotosData? photosData;
  final dio = Dio();
  Future getPhotosData(final int id) async {
    emit(GetPhotosDataLoading());

    try {
      final photos = await dio.get(
        "https://api.themoviedb.org/3/person/$id?api_key=2dfe23358236069710a379edd4c65a6b",
      );

      final Map<String, dynamic> map = photos.data;

      photosData = PhotosData.fromJson(map);
      emit(GetPhotosDataSuccess(photos: PhotosData.fromJson(map)));
    } catch (e) {
      emit(GetPhotosDataFailed());
    } finally {}
  }
}
