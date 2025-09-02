import 'package:session6/home/home_model.dart';

class HomeStates {}

class GetHomeDataLoading extends HomeStates {}

class GetHomeDataSucces extends HomeStates {
  final HomeData? data;

  GetHomeDataSucces({required this.data});
}

class GetHomeDataFailed extends HomeStates {}
