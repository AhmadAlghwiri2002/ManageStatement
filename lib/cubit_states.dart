abstract class CostState {
  double cost = 0;
  CostState({required this.cost});
}

class CostInitState extends CostState {
  CostInitState() : super(cost: 0);
}

class AddToCertState extends CostState {
  AddToCertState(double value) : super(cost: value);
}

class RemoveFromCertState extends CostState {
  RemoveFromCertState(double value) : super(cost: value);
}
