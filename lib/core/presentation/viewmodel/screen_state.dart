abstract class ScreenState<E> {
  E? error;
  bool isLoading = false;
  bool isSuccess = false;

  void enableLoading() => isLoading = true;
  void enableSuccess() => isSuccess = true;

  void clearLoading() => isLoading = false;
  void clearError() => error = null;
  void clearSuccess() => isSuccess =false;

  void reset(){
    clearLoading();
    clearError();
    clearSuccess();
  }
}
