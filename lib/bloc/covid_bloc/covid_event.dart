import 'package:equatable/equatable.dart';

abstract class CovidEvent extends Equatable {
  const CovidEvent();

  @override
  List<Object> get props => [];
}

class GetCovidList extends CovidEvent {}

// equatable" This helps us when it comes to stream as we need to decide state updation based on it. LoginState will not make duplicate calls and will not going to rebuild the widget if the same state occurs.