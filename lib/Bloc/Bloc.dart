import 'dart:async';

abstract class BaseBloc{
  void dispose();
}

class Bloc implements BaseBloc{

  int counter;

  // Counter Stream
  final counterStream = StreamController<int>();

  // Input counter stream
  StreamSink<int> get _inAdd => counterStream.sink;

  // Output counterStream
  Stream<int> get outCounter => counterStream.stream;


  //
  // Stream to handle the action on the counter
  //
  StreamController _actionController = StreamController();
  StreamSink get incrementCounter => _actionController.sink;

  StreamController _actionDecrement = StreamController();
  StreamSink get decrementCounter => _actionDecrement.sink;



  Bloc(){
    counter = 0;
    _actionController.stream.listen(_handleLogic);
    _actionDecrement.stream.listen(_handleLogic);
  }

  _handleLogic(a){
      if(a == 'add'){
        _inAdd.add(++counter);
      }else{
        _inAdd.add(--counter);
      }

  }

  @override
  void dispose() {
    // TODO: implement dispose
    counterStream.close();
    _actionController.close();
  }

}