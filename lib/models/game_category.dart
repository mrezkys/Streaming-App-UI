class GameCategory {
  String name;
  String image;

  GameCategory(this.name, this.image);
}

List<GameCategory> gamedData = gameList.map((data) => GameCategory(data['name'], data['image'])).toList();

var gameList = [
  {"name": "Pubg", "image": "assets/images/pubg.png"},
  {"name": "Csgo", "image": "assets/images/csgo.png"},
  {"name": "Dota2", "image": "assets/images/dota.png"},
  {"name": "Valorant", "image": "assets/images/valorant.png"},
];
