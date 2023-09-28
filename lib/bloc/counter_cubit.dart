import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  static CounterCubit get(context) => BlocProvider.of<CounterCubit>(context);

  int counter = 0;

  void increaseCounter(){
    counter++;
    emit(CounterIncreased());
  }

  void decreaseCounter(){
    counter--;
    emit(CounterIncreased());
  }
}
