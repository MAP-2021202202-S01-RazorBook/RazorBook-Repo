import '../models/counter_model.dart';

class HomeViewModel {
  String title = "Hi Again";
  var counter = CounterModel();

  getCounter(){
    return counter.count;
  }

  inc (){
    counter.count++;
  }
}