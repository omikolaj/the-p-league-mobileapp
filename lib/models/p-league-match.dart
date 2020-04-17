import 'package:the_p_league_mobileapp/models/match-result.dart';

class PLeagueMatch{
  final String id;
  final int dateTime;
  final String homeTeamName;
  final String homeTeamId;  
  final String awayTeamName;
  final String awayTeamId;
  final String sessionId;
  final String leagueId;
  final MatchResult matchResult;

  PLeagueMatch({
    this.id, 
    this.dateTime, 
    this.homeTeamName, 
    this.homeTeamId, 
    this.awayTeamName,
    this.awayTeamId,
    this.sessionId,
    this.leagueId,
    this.matchResult,
  });

  factory PLeagueMatch.fromJson(Map<String, dynamic> json){
    return PLeagueMatch(
      id: json["id"],
      dateTime: json["dateTime"],
      homeTeamName: json["homeTeamName"],
      homeTeamId: json["homeTeamId"],
      awayTeamName: json["awayTeamName"],
      awayTeamId: json["awayTeamId"],
      sessionId: json["sessionId"],
      leagueId: json["leagueID"],
      matchResult: MatchResult.fromJson(json["matchResult"]),
    );
  }

}