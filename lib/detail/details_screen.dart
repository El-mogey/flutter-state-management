import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session6/detail/details_model.dart';
import 'package:session6/detail/detail_cubit.dart';
import 'package:session6/detail/detail_states.dart';
import 'package:session6/detail/photos_model.dart';
import 'package:session6/detail/photos_cubit.dart';
import 'package:session6/detail/photos_states.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final int id;
  const DetailsScreen({super.key, required this.id});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  DetailsData? data;
  PhotosData? photos;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailCubit()..getDetailsData(widget.id),
      child: BlocConsumer<DetailCubit, DetailStates>(
        listener: (context, state) {
          if (state is GetDetailDataSuccess) {
            data = state.data;
          }
        },
        builder: (context, state) {
          if (state is GetDetailDataLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetDetailDataSuccess) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.photo)),
                ],
                title: const Text(
                  'Details',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: const Color.fromARGB(255, 61, 128, 245),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: ListView(
                children: [
                  Image.network(state.data?.profilePath ?? ""),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.data?.name ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(state.data?.birthday.toString() ?? ""),
                        const SizedBox(height: 4),
                        Text(state.data?.placeOfBirth ?? ""),
                        const SizedBox(height: 4),
                        Text(
                          state.data?.biography ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 16),
                        BlocProvider(
                          create: (context) =>
                              PhotosCubit()..getPhotosData(widget.id),
                          child: BlocConsumer<PhotosCubit, PhotosDetailStates>(
                            listener: (context, state) {
                              if (state is GetPhotosDataSuccess) {
                                photos = state.photos;
                              }
                            },
                            builder: (context, state) {
                              if (state is GetPhotosDataLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is GetDetailDataSuccess) {
                                return SizedBox(
                                  height: 300,
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 130,
                                          mainAxisExtent: 168,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20,
                                        ),
                                    itemCount: photos?.profiles.length ?? 0,
                                    itemBuilder: (context, index) => Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                            255,
                                            0,
                                            0,
                                            0,
                                          ),
                                          width: 2.4,
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            photos?.profiles[index].filePath ??
                                                "",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else if (state is GetDetailDataFailed) {
                                return Center(child: Text("Error: " * 88));
                              } else {
                                return SizedBox.shrink();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is GetDetailDataFailed) {
            return Center(child: Text("Error: " * 88));
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
