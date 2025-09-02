import 'package:session6/detail/photos_model.dart';

class PhotosDetailStates {}

class GetPhotosDataLoading extends PhotosDetailStates {}

class GetPhotosDataSuccess extends PhotosDetailStates {
  final PhotosData? photos;

  GetPhotosDataSuccess({required this.photos});
}

class GetPhotosDataFailed extends PhotosDetailStates {}
