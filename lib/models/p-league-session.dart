import 'game-day.dart';
import 'p-league-match.dart';
import 'team-session.dart';

class PLeagueSession{
  final String id;
  final List<PLeagueMatch> matches;
  final bool active;
  final String leagueID;  
  final String leagueName;
  final String sportTypeID;
  final String sportTypeName;
  final bool byeWeeks;
  final int numberOfWeeks;
  final String sessionStart;
  final String sessionEnd;
  final List<TeamSession> teamsSessions;
  final List<GameDay> gamesDays;  

  PLeagueSession({
    this.id, 
    this.matches, 
    this.active, 
    this.leagueID, 
    this.leagueName,
    this.sportTypeID,
    this.sportTypeName,
    this.byeWeeks,
    this.numberOfWeeks,
    this.sessionStart,
    this.sessionEnd,
    this.teamsSessions,
    this.gamesDays
  });

  factory PLeagueSession.fromJson(Map<String, dynamic> json){
    // parse matches
    List matchItems = json["matches"] as List;
    List<PLeagueMatch> matches = matchItems.map((match) => PLeagueMatch.fromJson(match)).toList();

    // parse teamSessions
    List teamSessionItems = json["teamsSessions"] as List;
    List<TeamSession> teamSessions = teamSessionItems.map((teamSession) => TeamSession.fromJson(teamSession)).toList();

    // parse gameDays
    List gameDayItems = json["gamesDays"] as List;
    List<GameDay> gameDays = gameDayItems.map((gameDay) => GameDay.fromJson(gameDay)).toList();

    return PLeagueSession(
      id: json["id"],
      matches: matches,
      active: json["active"],
      leagueID: json["leagueID"],
      leagueName: json["leagueName"],
      sportTypeID: json["sportTypeID"],
      sportTypeName: json["sportTypeName"],
      byeWeeks: json["byeWeeks"],
      numberOfWeeks: json["numberOfWeeks"],
      sessionStart: json["sessionStart"],
      sessionEnd: json["sessionEnd"],
      teamsSessions: teamSessions,
      gamesDays: gameDays
    );
  }
}