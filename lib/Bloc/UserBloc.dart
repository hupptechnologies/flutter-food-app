import 'dart:async';

abstract class BaseBloc{
  void dispose();
}

class UserBloc implements BaseBloc{

  // Loader stream init
  final _loaderController = StreamController<bool>();
  // Update loader flag
  StreamSink<bool> get updateLoader => _loaderController.sink;
  // Return loader flag
  Stream<bool> get getLoader => _loaderController.stream;


  @override
  dispose(){
    _loaderController.close();
  }
}