class ApiResponse<T>{
  dynamic status;
  T? data;
  String? message;

ApiResponse.initial(this.message):status=Status.INITIAL;
ApiResponse.completed(this.message):status=Status.COMPLETED;
ApiResponse.error(this.message):status=Status.ERROR;
ApiResponse.loading(this.message):status=Status.LOADING;


}
enum Status{
  INITIAL,
  COMPLETED,
  ERROR,
  LOADING
}