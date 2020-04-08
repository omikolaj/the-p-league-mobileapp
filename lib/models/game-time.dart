import 'package:the_p_league_mobileapp/models/match-result.dart';

class GameTime{
  final String id;
  final String gameDayId;
  final int gamesTime;

  GameTime({
    this.id, 
    this.gameDayId, 
    this.gamesTime,
  });

  factory GameTime.fromJson(Map<String, dynamic> json){
    return GameTime(
      id: json["id"],
      gameDayId: json["gameDayId"],
      gamesTime: json["gamesTime"],      
    );
  }
}