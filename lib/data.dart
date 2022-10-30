import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    required this.topfive,
    required this.marvelstudiosoriginalsmovies,
    required this.marvelstudiosoriginalseries,
    required this.sonymarvel,
    required this.foxstarmarvel,
    required this.others,
    required this.popularmovies,
    required this.popularseries,
    required this.movieslist,
    required this.serieslist,
  });

  List<Topfive> topfive;
  List<Foxstarmarvel> marvelstudiosoriginalsmovies;
  List<Marvelstudiosoriginalsery> marvelstudiosoriginalseries;
  List<Foxstarmarvel> sonymarvel;
  List<Foxstarmarvel> foxstarmarvel;
  List<Foxstarmarvel> others;
  List<Foxstarmarvel> popularmovies;
  List<Foxstarmarvel> popularseries;
  List<Marvelstudiosoriginalsery> movieslist;
  List<Marvelstudiosoriginalsery> serieslist;

  factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
        topfive:
            List<Topfive>.from(json["TOPFIVE"].map((x) => Topfive.fromJson(x))),
        marvelstudiosoriginalsmovies: List<Foxstarmarvel>.from(
            json["MARVELSTUDIOSORIGINALSMOVIES"]
                .map((x) => Foxstarmarvel.fromJson(x))),
        marvelstudiosoriginalseries: List<Marvelstudiosoriginalsery>.from(
            json["MARVELSTUDIOSORIGINALSERIES"]
                .map((x) => Marvelstudiosoriginalsery.fromJson(x))),
        sonymarvel: List<Foxstarmarvel>.from(
            json["SONYMARVEL"].map((x) => Foxstarmarvel.fromJson(x))),
        foxstarmarvel: List<Foxstarmarvel>.from(
            json["FOXSTARMARVEL"].map((x) => Foxstarmarvel.fromJson(x))),
        others: List<Foxstarmarvel>.from(
            json["OTHERS"].map((x) => Foxstarmarvel.fromJson(x))),
        popularmovies: List<Foxstarmarvel>.from(
            json["POPULARMOVIES"].map((x) => Foxstarmarvel.fromJson(x))),
        popularseries: List<Foxstarmarvel>.from(
            json["POPULARSERIES"].map((x) => Foxstarmarvel.fromJson(x))),
        movieslist: List<Marvelstudiosoriginalsery>.from(json["MOVIESLIST"]
            .map((x) => Marvelstudiosoriginalsery.fromJson(x))),
        serieslist: List<Marvelstudiosoriginalsery>.from(json["SERIESLIST"]
            .map((x) => Marvelstudiosoriginalsery.fromJson(x))),
      );

  Map<dynamic, dynamic> toJson() => {
        "TOPFIVE": List<dynamic>.from(topfive.map((x) => x.toJson())),
        "MARVELSTUDIOSORIGINALSMOVIES": List<dynamic>.from(
            marvelstudiosoriginalsmovies.map((x) => x.toJson())),
        "MARVELSTUDIOSORIGINALSERIES": List<dynamic>.from(
            marvelstudiosoriginalseries.map((x) => x.toJson())),
        "SONYMARVEL": List<dynamic>.from(sonymarvel.map((x) => x.toJson())),
        "FOXSTARMARVEL":
            List<dynamic>.from(foxstarmarvel.map((x) => x.toJson())),
        "OTHERS": List<dynamic>.from(others.map((x) => x.toJson())),
        "POPULARMOVIES":
            List<dynamic>.from(popularmovies.map((x) => x.toJson())),
        "POPULARSERIES":
            List<dynamic>.from(popularseries.map((x) => x.toJson())),
        "MOVIESLIST": List<dynamic>.from(movieslist.map((x) => x.toJson())),
        "SERIESLIST": List<dynamic>.from(serieslist.map((x) => x.toJson())),
      };
}

class Foxstarmarvel {
  Foxstarmarvel({
    required this.data,
  });

  List<FoxstarmarvelDatum> data;

  factory Foxstarmarvel.fromJson(Map<dynamic, dynamic> json) => Foxstarmarvel(
        data: List<FoxstarmarvelDatum>.from(
            json["data"].map((x) => FoxstarmarvelDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FoxstarmarvelDatum {
  FoxstarmarvelDatum({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.poster,
    required this.rating,
    required this.generes,
    required this.length,
    // required this.languages,
  });

  int id;
  String title;
  String overview;
  String releaseDate;
  String poster;
  String rating;
  String generes;
  String length;
  // Languages languages;

  factory FoxstarmarvelDatum.fromJson(Map<dynamic, dynamic> json) =>
      FoxstarmarvelDatum(
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        releaseDate: json["releaseDate"],
        poster: json["poster"],
        rating: json["rating"],
        generes: json["generes"],
        length: json["length"] == null ? null : json["length"],
        // languages: languagesValues.map[json["languages"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "overview": overview,
        "releaseDate": releaseDate,
        "poster": poster,
        "rating": rating,
        "generes": generes,
        "length": length == null ? null : length,
        // "languages": languagesValues.reverse[languages],
      };
}

enum Languages { ENGLISH_HINDI }

final languagesValues =
    EnumValues({"English / Hindi": Languages.ENGLISH_HINDI});

class Marvelstudiosoriginalsery {
  Marvelstudiosoriginalsery({
    required this.data,
  });

  List<MarvelstudiosoriginalseryDatum> data;

  factory Marvelstudiosoriginalsery.fromJson(Map<String, dynamic> json) =>
      Marvelstudiosoriginalsery(
        data: List<MarvelstudiosoriginalseryDatum>.from(json["data"]
            .map((x) => MarvelstudiosoriginalseryDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<String>.from(data.map((x) => x.toJson())),
      };
}

class MarvelstudiosoriginalseryDatum {
  MarvelstudiosoriginalseryDatum({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.poster,
    required this.rating,
    required this.generes,
    //  required this.languages,
    //  required this.seasons,
    required this.mainposter,
    required this.titlelogo,
    required this.length,
  });

  int id;
  String title;
  String overview;
  String releaseDate;
  String poster;
  String rating;
  String generes;
  // Languages languages;
  // List<SeasonElement> seasons;
  String mainposter;
  String titlelogo;
  String length;

  factory MarvelstudiosoriginalseryDatum.fromJson(Map<String, dynamic> json) =>
      MarvelstudiosoriginalseryDatum(
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        releaseDate: json["releaseDate"],
        poster: json["poster"],
        rating: json["rating"],
        generes: json["generes"],
        // languages: languagesValues.map[json["languages"]],
        // seasons: json["seasons"] == null ? null : List<SeasonElement>.from(json["seasons"].map((x) => SeasonElement.fromJson(x))),
        mainposter: json["mainposter"] == null ? null : json["mainposter"],
        titlelogo: json["titlelogo"] == null ? null : json["titlelogo"],
        length: json["length"] == null ? null : json["length"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "overview": overview,
        "releaseDate": releaseDate,
        "poster": poster,
        "rating": rating,
        "generes": generes,
        // "languages": languagesValues.reverse[languages],
        // "seasons": seasons == null ? null : List<dynamic>.from(seasons.map((x) => x.toJson())),
        "mainposter": mainposter == null ? null : mainposter,
        "titlelogo": titlelogo == null ? null : titlelogo,
        "length": length == null ? null : length,
      };
}

class SeasonElement {
  SeasonElement({
    required this.season1,
    required this.season2,
    required this.season3,
  });

  List<Season1Element> season1;
  List<Season1Element> season2;
  List<Season1Element> season3;

  // factory SeasonElement.fromJson(Map<String, dynamic> json) => SeasonElement(
  //     season1: json["season1"] == null ? null : List<Season1Element>.from(json["season1"].map((x) => Season1Element.fromJson(x))),
  //     season2: json["season2"] == null ? null : List<Season1Element>.from(json["season2"].map((x) => Season1Element.fromJson(x))),
  //     season3: json["season3"] == null ? null : List<Season1Element>.from(json["season3"].map((x) => Season1Element.fromJson(x))),
  // );

  Map<String, dynamic> toJson() => {
        "season1": season1 == null
            ? null
            : List<dynamic>.from(season1.map((x) => x.toJson())),
        "season2": season2 == null
            ? null
            : List<dynamic>.from(season2.map((x) => x.toJson())),
        "season3": season3 == null
            ? null
            : List<dynamic>.from(season3.map((x) => x.toJson())),
      };
}

class Season1Element {
  Season1Element({
    required this.episodes,
  });

  List<Episode> episodes;

  factory Season1Element.fromJson(Map<String, dynamic> json) => Season1Element(
        episodes: List<Episode>.from(
            json["episodes"].map((x) => Episode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
      };
}

class Episode {
  Episode({
    required this.id,
    required this.title,
    required this.overview,
    required this.poster,
    required this.rating,
    required this.length,
  });

  int id;
  String title;
  String overview;
  String poster;
  String rating;
  String length;

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        poster: json["poster"],
        rating: json["rating"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "overview": overview,
        "poster": poster,
        "rating": rating,
        "length": length,
      };
}

class Topfive {
  Topfive({
    required this.data,
  });

  List<TopfiveDatum> data;

  factory Topfive.fromJson(Map<String, dynamic> json) => Topfive(
        data: List<TopfiveDatum>.from(
            json["data"].map((x) => TopfiveDatum.fromJson(x))),
      );

 

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TopfiveDatum {
  TopfiveDatum(
    //  this.id,
    // this.title,
    //  this.overview,
    //  this.releaseDate,
    // this.poster,
    // this.rating,
    // this.generes,
    // //  required this.languages,
    // //  required this.seasons,
    //  this.mainposter,
    //  this.titlelogo,
    //  this.length,
  );
  // int id;
  // String title;
  // String overview;
  // String releaseDate;
  // String poster;
  // String mainposter;
  // String titlelogo;
  // String rating;
  // String generes;
  // String length;

  factory TopfiveDatum.fromJson(Map<dynamic, dynamic> json) => 
  TopfiveDatum();

  Map<String, dynamic> toJson() => {
    //  "id": id,
    //     "title": title,
    //     "overview": overview,
    //     "releaseDate": releaseDate,
    //     "poster": poster,
    //     "rating": rating,
    //     "generes": generes,
    //     "length": length == null ? null : length,
          // "languages": languagesValues.reverse[languages],
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
