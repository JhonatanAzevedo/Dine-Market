import 'dart:async';

class ControlProducts {
int  _amount = 1;
int get amount => _amount;

final _amountController = StreamController<int>();

Stream<int> get myStream => _amountController.stream;

void incrementAmount(){
  if(amount < 99){
    _amount++;
    _amountController.sink.add(amount);
  }
}

void decrementAmount(){
  if(amount > 1){
    _amount--;
    _amountController.sink.add(amount);
  }
}

void closeStream(){
  _amountController.close();
  
}
  
}