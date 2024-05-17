import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pr_3/repository/api/anime_api.dart';
import 'package:pr_3/repository/model/animemodel.dart';

part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  late Anime animemodel;
  AnimeApi animeapi =AnimeApi();

  AnimeBloc() : super(AnimeInitial()) {
    on<Fetchanime>((event, emit)async {
      emit (Animeblocloading());
      try {
        animemodel = await animeapi.getAnime();
        emit (Animeblocloaded());
      }catch(e){
        print(e);
        emit (Animeblocerror());

      }
 
    });
  }
}
