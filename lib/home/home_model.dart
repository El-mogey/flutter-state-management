class HomeData {
  HomeData({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int? page;
  final List<Result> results;
  final int? totalPages;
  final int? totalResults;

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      page: json["page"],
      results: json["results"] == null
          ? []
          : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
    );
  }
}

class Result {
  Result({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.knownFor,
  });

  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final List<KnownFor> knownFor;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      adult: json["adult"],
      gender: json["gender"],
      id: json["id"],
      knownForDepartment: json["known_for_department"],
      name: json["name"],
      originalName: json["original_name"],
      popularity: json["popularity"],
      profilePath: "https://image.tmdb.org/t/p/w500${json['profile_path']}",
      knownFor: json["known_for"] == null
          ? []
          : List<KnownFor>.from(
              json["known_for"]!.map((x) => KnownFor.fromJson(x)),
            ),
    );
  }
}

class KnownFor {
  KnownFor({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.name,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.originCountry,
    required this.title,
    required this.originalTitle,
    required this.releaseDate,
    required this.video,
  });

  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? name;
  final String? originalName;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final String? originalLanguage;
  final List<int> genreIds;
  final double? popularity;
  final DateTime? firstAirDate;
  final double? voteAverage;
  final int? voteCount;
  final List<String> originCountry;
  final String? title;
  final String? originalTitle;
  final DateTime? releaseDate;
  final bool? video;

  factory KnownFor.fromJson(Map<String, dynamic> json) {
    return KnownFor(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      id: json["id"],
      name: json["name"],
      originalName: json["original_name"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      mediaType: json["media_type"],
      originalLanguage: json["original_language"],
      genreIds: json["genre_ids"] == null
          ? []
          : List<int>.from(json["genre_ids"]!.map((x) => x)),
      popularity: json["popularity"],
      firstAirDate: DateTime.tryParse(json["first_air_date"] ?? ""),
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
      originCountry: json["origin_country"] == null
          ? []
          : List<String>.from(json["origin_country"]!.map((x) => x)),
      title: json["title"],
      originalTitle: json["original_title"],
      releaseDate: DateTime.tryParse(json["release_date"] ?? ""),
      video: json["video"],
    );
  }
}
