import 'package:flutter/material.dart';
import 'package:movie_api/core/api_response.dart';
import 'package:movie_api/movie_item.dart';
import 'package:movie_api/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

import '../models/genre.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState(){
    super.initState();
    Provider.of<MainViewModel>(context,listen:false).fetchPopular();
    Provider.of<MainViewModel>(context,listen:false).fetchGenres();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie app'),),
      body: Consumer<MainViewModel>(builder: (context,data,child){
        List<Genre> genres=data.genres;
        if(data.response.status==Status.LOADING){
          return CircularProgressIndicator();
        }
        if(data.response.status==Status.COMPLETED){
          return ListView.builder(
              itemCount: data.movies.length,
              itemBuilder: (context, int index){
                List<Genre> movieGenre=[];
                data.movies[index].genreIds?.forEach((id) {
                  movieGenre.addAll(genres.where((genre) => genre.id==id));
                });
            return MovieItem(data.movies[index],movieGenre);
          });

        }
        if(data.response.status==Status.ERROR){
          return Text(data.response.message ?? 'Error',style: TextStyle(fontSize: 24),);
        }
        if(data.response.status==Status.INITIAL){
          return Center(child: Text('Loading',style: TextStyle(fontSize: 24),));
        }
        else return Container();
      },),
    );

  }

}
