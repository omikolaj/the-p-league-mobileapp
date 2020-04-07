import 'match-status-enum.dart';

class MatchResult{
  final String matchResultId;
  final String matchId;
  final String leagueId;
  final MatchStatus status;  
  final int awayTeamScore;
  final String awayTeamId;
  final int homeTeamScore;
  final String homeTeamId;
  final String score;
  final String sessionId;
  final String wontTeamName;
  final String lostTeamName;  

  MatchResult({
    this.matchResultId, 
    this.matchId, 
    this.leagueId, 
    this.status, 
    this.awayTeamScore, 
    this.awayTeamId,
    this.homeTeamScore,
    this.homeTeamId,
    this.score,
    this.sessionId,
    this.wontTeamName,
    this.lostTeamName
  });

  factory MatchResult.fromJson(Map<String, dynamic> json){
    return MatchResult(
      matchResultId: json["matchResultId"],
      matchId: json["matchId"],
      leagueId: json["leagueId"],
      status: json["status"],
      awayTeamScore: json["awayTeamScore"],
      awayTeamId: json["awayTeamId"],
      homeTeamScore: json["homeTeamScore"],
      homeTeamId: json["homeTeamId"],
      score: json["score"],
      sessionId: json["sessionId"],
      wontTeamName: json["wonTeamName"],
      lostTeamName: json["lostTeamName"],
    );
  }
}