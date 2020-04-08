
import 'package:the_p_league_mobileapp/models/team.dart';

class TeamSession{
  final String teamId;
  final String teamName;
  final Team team;
  final String leagueSessionScheduleId;

  TeamSession({
    this.teamId, 
    this.teamName, 
    this.team,
    this.leagueSessionScheduleId,
  });

  factory TeamSession.fromJson(Map<String, dynamic> json){
    return TeamSession(
      teamId: json["teamId"],
      teamName: json["teamName"],
      team: Team.fromJson(json["team"]),      
      leagueSessionScheduleId: json["leagueSessionScheduleId"],   
    );
  }
}