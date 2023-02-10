abstract class DataState<T> {
  final Exception? exception;
  final T? data;

  DataState({this.exception, this.data});
}

class DataSuccessState<T> extends DataState<T> {
  DataSuccessState(T data) : super(data: data);
}

class DataErrorState<T> extends DataState<T> {
  DataErrorState(Exception exception) : super(exception: exception);
}
