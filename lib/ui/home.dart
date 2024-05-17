import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr_3/bloc/bloc/anime_bloc.dart';
import 'package:pr_3/repository/model/animemodel.dart';
import 'package:pr_3/ui/firstview.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Anime anime;

  void initState() {
    BlocProvider.of<AnimeBloc>(context).add(Fetchanime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 225, 80, 128),
        title: const Text(
          'Movie App',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocBuilder<AnimeBloc, AnimeState>(
                builder: (context, state) {
                  if (state is Animeblocloading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is Animeblocerror) {
                    return Center(
                      child: Text('error'),
                    );
                  }
                  if (state is Animeblocloaded) {
                    anime = BlocProvider.of<AnimeBloc>(context).animemodel;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: anime.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Firstview(
                                        img:
                                            anime.data![index].image.toString(),
                                        title:
                                            anime.data![index].title.toString(),
                                        ranking: anime.data![index].ranking
                                            .toString(),
                                        description: anime.data![index].synopsis
                                            .toString(),
                                      )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              child: Image.network(
                                anime.data![index].image.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
