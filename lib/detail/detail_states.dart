import 'package:session6/detail/details_model.dart';

class DetailStates {}

class GetDetailDataLoading extends DetailStates {}

class GetDetailDataSuccess extends DetailStates {
  final DetailsData? data;

  GetDetailDataSuccess({required this.data});
}

class GetDetailDataFailed extends DetailStates {}
