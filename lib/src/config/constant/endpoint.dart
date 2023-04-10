class ConfigApi {
  static const String baseUrl = "https://pilm.nopdev.cyou/v1";
  static const String auth = "/auth/main";
  static const String newRelease = "/app/new-release";
  static const String movies = "/app/movies/"; // :page
  static const String series = "/app/series/"; // :page
  static const String genre = "/app/genre";
  static const String search = "/app/search/"; // :keyword/:page
  static const String itemsByGenre = "/app/genre/"; // :slug/:page
  static const String itemsByYear = "/app/year/"; // :slug/:page
  static const String year = "/app/year";
  static const String movieDetail = "/app/movies-detail/"; // :slug/:title
  static const String movieVideo = "/app/movies-video/"; // :id
  static const String episodeDetail = "/app/series-eps/"; // :slug/:title
  static const String seriesVideo = "/app/series-video/"; // :id
  // static const String seriesDetail = "/series-detail/"; // :slug/:title
}
