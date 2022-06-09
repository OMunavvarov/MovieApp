import 'package:flutter/material.dart';
import 'package:movie_api/screens/details_page.dart';

import 'models/genre.dart';
import 'models/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  final List<Genre> genres;
  const MovieItem(this.movie,this.genres,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){openDetails(context,movie.id?.toInt());},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network("http://image.tmdb.org/t/p/w500/${movie.posterPath}",width: 130 ,),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.title ?? 'salom',style: TextStyle(fontSize: 18),),
                     const  SizedBox(height: 10,),
                      buildGenres(genres),
                      const SizedBox(height: 70,),

                      Text(movie.releaseDate??'')
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildGenres(List<Genre> genres){
    List<Widget> widgets=[];
    for (var element in genres) {
      widgets.add(Text("-${element.name}",style: TextStyle(height: 1.2),));
    }
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets);
  }
  void openDetails(context,int? movieId){
    Navigator.push(context, MaterialPageRoute(
        builder: (context)=>DetailsPage(movieId!)));
  }
}
