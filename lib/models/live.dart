class Live {
  String name;
  String title;
  String avatar;
  String background;
  double viewer;
  String streamTitle;
  List<LiveComments> comments;

  Live(this.comments, this.streamTitle, this.name, this.title, this.avatar, this.viewer, this.background);
}

class LiveComments {
  String userName;
  String userComments;

  LiveComments(this.userName, this.userComments);
}

List<LiveComments> comments = commentsData.map((data) => LiveComments(data['user_name'], data['comments'])).toList();
List<Live> featuredLive = livedata.map((data) => Live(comments, data['stream_title'], data['name'], data['title'], data['avatar'], data['viewer'], data['background'])).toList();

var livedata = [
  {"stream_title": "Valorant Live", "name": "Javier Slow", "title": "Valorant Player", "avatar": "assets/images/profil2.png", "viewer": 9.1, "background": "assets/images/1.png"},
  {"stream_title": "Valorant Live", "name": "Javier Slow", "title": "Valorant Player", "avatar": "assets/images/profil4.png", "viewer": 9.1, "background": "assets/images/Mask Group-1.png"},
];

var commentsData = [
  {"user_name": "Dwi Nopal", "comments": "Saya indo bang"},
  {"user_name": "Nice ward!", "comments": "Ada orang indo gak?"},
  {"user_name": "Briliant Gaming", "comments": "Wow nice game!"},
  {"user_name": "Rivangga", "comments": "Well Played 👏😍"},
  {"user_name": "John Kellen", "comments": "Amazing game :0"},
  {"user_name": "Stefen richard", "comments": "OMG 😮😱"},
  {"user_name": "Kelly Strongn", "comments": "Amazing game :0"},
];
