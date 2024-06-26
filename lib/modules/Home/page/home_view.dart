import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/modules/Home/page/widget/custom_list_view.dart';
import 'package:movie_app/modules/task_models.dart';
import '../../firebase_func/firestore_Utiles.dart';
import '../bloc/home_cubit/cubit.dart';
import '../bloc/home_cubit/states.dart';

class homeView extends StatelessWidget {
  const homeView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => SliderCubit()..getSlider(),
      child: BlocConsumer<SliderCubit, SliderStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = SliderCubit.get(context);
          if (state is SliderLoadingStates) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          if (state is SliderSuccessStates) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(toolbarHeight: 20),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: height * .3,
                                  width: double.infinity,
                                  color: Colors.transparent,
                                  alignment: Alignment.topCenter,
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/w500${cubit.categoriesList[1].posterPath}",
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                                Positioned(
                                  top: 170,
                                  left: 10,
                                  child: Container(
                                    width: 125,
                                    height: 180,
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w500${cubit.categoriesList[1].posterPath}",
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 270,
                                  left: 150,
                                  // right: 20,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 220,
                                        child: Text(
                                          cubit.categoriesList[0].title
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        cubit.categoriesList[0].releaseDate
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 170,
                                  left: 10,
                                  child: Container(
                                    width: 30,
                                    height: 40,
                                    color: Colors.black,
                                    child: IconButton(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      icon: const Icon(Icons.add),
                                      color: Colors.white,
                                      onPressed: () {
                                        var data=TaskModel(
                                            title: cubit.categoriesList[0].title.toString(),
                                            description: cubit.categoriesList[0].overview.toString(),
                                            isDone: false,
                                            datetime: cubit.categoriesList[0].releaseDate.toString(),
                                          posterPath: cubit.categoriesList[0].posterPath.toString(),
                                        );
                                        FireStoreUtiles().addNewTask(data);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    CustomListView(
                      titleListName: "New Releases",
                     newRealeasesList: cubit.newRealeasesListList,
                    ),

                    const SizedBox(
                      height: 40,
                    ),
                    CustomListView(
                      titleListName: "Recomended",
                      newRealeasesList: cubit.newRecommendedList,
                      isShowDetails: true,
                    ),
                  ],
                ),
              ),
            );
          }
          if (state is SliderErrorStates) {
            return const Center(
              child: Text("Errors"),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
