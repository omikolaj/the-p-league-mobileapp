import 'game-time.dart';

class GameDay{
  final String id;
  final String gamesDay;
  final String leagueSessionScheduleId;
  final List<GameTime> gamesTimes;    

  GameDay({
    this.id, 
    this.gamesDay, 
    this.leagueSessionScheduleId, 
    this.gamesTimes,
  });

  factory GameDay.fromJson(Map<String, dynamic> json){
    List gamesTimeItems = json["gamesTimes"] as List;
    List<GameTime> gamesTimes = gamesTimeItems.map((gameTime) => GameTime.fromJson(gameTime)).toList();

    return GameDay(
      id: json["id"],
      gamesDay: json["gamesDay"],
      leagueSessionScheduleId: json["leagueSessionScheduleId"],
      gamesTimes: gamesTimes
    );
  }
}