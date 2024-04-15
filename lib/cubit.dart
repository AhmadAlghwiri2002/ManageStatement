import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/cubit_states.dart';

class CostCubit extends Cubit<CostState> {
  CostCubit() : super(CostInitState());
  static CostCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  double cost = 0;
  void addToCert(double value) {
    cost = value + cost;
    emit(AddToCertState(cost));
  }

  void removeFromCert(double value) {
    cost = cost - value;
    emit(RemoveFromCertState(cost));
  }
}
