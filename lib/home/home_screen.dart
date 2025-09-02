import 'package:session6/detail/details_screen.dart';
import 'package:session6/home/home_model.dart';
import 'package:flutter/material.dart';
import 'package:session6/home/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session6/home/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeData? data;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is GetHomeDataSucces) {
            data = state.data;
          }
        },
        builder: (context, state) {
          if (state is GetHomeDataLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetHomeDataSucces) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Home"),
                backgroundColor: const Color.fromARGB(255, 61, 128, 245),
              ),
              body: ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          id: state.data?.results[index].id ?? 0,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          state.data?.results[index].profilePath ?? "",
                          height: 250,
                        ),
                        SizedBox(height: 12),
                        Text(state.data?.results[index].name ?? ""),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.data?.results[index].gender == 2
                                  ? "male"
                                  : "female",
                            ),
                            Text(
                              "Popularity : ${state.data?.results[index].popularity ?? ""}",
                            ),
                          ],
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ),

                itemCount: state.data?.results.length ?? 0,
              ),
            );
          } else if (state is GetHomeDataFailed) {
            return Center(child: Text("Error: " * 88));
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
