import 'dart:async';

import 'package:bloc_practise/blocs/internet_bloc/internet_event.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState>{
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  InternetBloc(): super(InternetInitialState()){
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainEvent>((event, emit) => emit(InternetGainState()));

    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result){
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        add(InternetGainEvent());
      }
      else{
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    connectivitySubscription?.cancel();
    return super.close();
  }

}
