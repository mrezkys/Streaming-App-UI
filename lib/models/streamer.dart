class Streamer {
  String name;
  String title;
  String avatar;

  Streamer(this.name, this.title, this.avatar);
}

List<Streamer> topStreamer = streamerData.map((data) => Streamer(data['name'], data['title'], data['avatar'])).toList();

var streamerData = [
  {"name": "Zen Islands", "title": "Dota2 Player", "avatar": "assets/images/profil5.png"},
  {"name": "Edward Low", "title": "Valorant Player", "avatar": "assets/images/profil2.png"},
  {"name": "Zen Islands", "title": "Dota2 Player", "avatar": "assets/images/profil5.png"},
];
