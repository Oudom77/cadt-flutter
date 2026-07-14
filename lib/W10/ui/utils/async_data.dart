enum AsyncStatus {notStarted, loading, success, error}

class AsyncData<T> {

  final AsyncStatus status;
  final T? value;
  final String? error;

  AsyncData.success(T data): 
    status = AsyncStatus.success, 
    value = data,
    error = null;

  AsyncData.error(this.error): 
    status = AsyncStatus.error, 
    value =null;

  AsyncData.notStarted():
    status = AsyncStatus.notStarted,
    error = null,
    value = null;

  AsyncData.loading():
    status = AsyncStatus.loading,
    error = null,
    value = null;
}