class PhotosData {
  PhotosData({required this.id, required this.profiles});

  final int? id;
  final List<Profile> profiles;

  factory PhotosData.fromJson(Map<String, dynamic> json) {
    return PhotosData(
      id: json["id"],
      profiles: json["profiles"] == null
          ? []
          : List<Profile>.from(
              json["profiles"]!.map((x) => Profile.fromJson(x)),
            ),
    );
  }
}

class Profile {
  Profile({
    required this.aspectRatio,
    required this.height,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  final double? aspectRatio;
  final int? height;
  final dynamic iso6391;
  final String? filePath;
  final double? voteAverage;
  final int? voteCount;
  final int? width;

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      aspectRatio: json["aspect_ratio"],
      height: json["height"],
      iso6391: json["iso_639_1"],
      filePath: "https://image.tmdb.org/t/p/w500${json["file_path"]}",
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
      width: json["width"],
    );
  }
}
