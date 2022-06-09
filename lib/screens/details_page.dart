import 'package:flutter/material.dart';
import 'package:movie_api/models/details.dart';
import 'package:movie_api/view_model/details_view_model.dart';
import 'package:provider/provider.dart';

import '../core/api_response.dart';

class DetailsPage extends StatefulWidget {
  final int movieId;
  const DetailsPage(this.movieId, {Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState(){
    super.initState();
    Provider.of<DetailsViewModel>(context,listen:false).fetchDetailsById(widget.movieId);
    //dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Page'),),
      body: Consumer<DetailsViewModel>(builder: (context,data,child){
        //List<Genre> genres=data.genres;
        if(data.response.status==Status.LOADING){
          return CircularProgressIndicator();
        }
        if(data.response.status==Status.COMPLETED){
          return _initUi(data.details!);

        }
        if(data.response.status==Status.ERROR){
          return Text(data.response.message ?? 'Error',style: const TextStyle(fontSize: 24),);
        }
        if(data.response.status==Status.INITIAL){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else return Container();
      },),
    );

  }
  Widget _initUi(Details details){
    return Container(
      child: Column(
        children: [
          Image.network("http://image.tmdb.org/t/p/w500/${details.backdropPath}" ,
          key: UniqueKey(),
          ),
         const SizedBox(height: 10,),
         // Container(child: Text('${details.budget}') ),
        //  Container(child: Text(details.overview ?? ''),)

        ],
      ),
    );
  }
  void dispose(){
    super.dispose();
    Provider.of<DetailsViewModel>(context,listen: false).clearData();
  }
  void deactivate(){
    super.deactivate();
    Provider.of<DetailsViewModel>(context,listen: false).clearData();

  }
}
