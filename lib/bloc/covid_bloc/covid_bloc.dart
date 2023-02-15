
import 'package:bloc/bloc.dart';
import 'package:covid_list/bloc/covid_bloc/covid_event.dart';
import 'package:covid_list/bloc/covid_bloc/covid_state.dart';
import 'package:covid_list/repository/covid_repository/covid_repository.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  CovidBloc() : super(CovidInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetCovidList>((event, emit) async {
      try {
        emit(CovidLoading());
        final mList = await _apiRepository.fetchCovidList();
        emit(CovidLoaded(mList));
        if (mList.error != null) {
          emit(CovidError(mList.error));
        }
      } on NetworkError {
        emit(const CovidError("Failed to fetch data. is your device online?"));
      }
    });
  }
}