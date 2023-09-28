part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}
class CounterIncreased extends CounterState {}
class CounterDecreased extends CounterState {}

