

import 'error.dart' as root_error;
class Empty{
  static Empty instance=Empty();

}
sealed class Result<D, E extends root_error.Error> {}

class Success<D, E extends root_error.Error> extends Result<D,E>{
  final D data;
  Success(this.data);
}
class ResultError<D, E extends root_error.Error> extends Result<D,E>{
  final E error;
  ResultError(this.error);
}
