

import 'package:flutter/material.dart';
import 'package:movie_api/core/api_response.dart';
import 'package:movie_api/models/details.dart';
import 'package:movie_api/models/repositories/details_repository.dart';

class DetailsViewModel extends ChangeNotifier{
  ApiResponse _apiResponse=ApiResponse.initial('initial');
  Details? _details;

  Details? get details{
    return _details;
  }
  ApiResponse get response{
    return _apiResponse;
  }
  Future fetchDetailsById(int movieId) async{
    try{
      Details details=await DetailsRepository().fetchDetails(movieId);
      _details=details;
      _apiResponse=ApiResponse.completed(details.toString());
    }catch (e){
      _apiResponse=ApiResponse.error(e.toString());
    }notifyListeners();
  }
  void clearData(){
    _apiResponse=ApiResponse.initial('initial');
    _details=null;
  }
}