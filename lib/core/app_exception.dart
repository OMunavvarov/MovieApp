class AppException implements Exception{
  final String? _message;
  final String? _prefix;

  AppException([this._message,this._prefix]);


  String toString(){
    return "$_prefix - $_message";
  }

}

class BadRequestException extends AppException{
  BadRequestException([String? message]) :super(message ,'invalid request');
}
class UnauthorizedException extends  AppException{
  UnauthorizedException([String? message]) : super(message ,'unauthorized request');
}
class NotFoundException extends  AppException{
  NotFoundException([String? message]) : super(message ,'not found request');
}