import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:the_p_league_mobileapp/models/p-league-match.dart';
import 'package:the_p_league_mobileapp/models/p-league-session.dart';

class SchedulesService{
  static List<PLeagueSession> scheduledMatchesCache = List<PLeagueSession>();

  Future<List<PLeagueSession>> fetchSchedules() async {
    if(SchedulesService.scheduledMatchesCache.length > 0)
      return SchedulesService.scheduledMatchesCache;
    final response = await http.get('https://www.thepleague.club/api/schedules/sessions');

    if(response.statusCode == 200){     
      Iterable pLeagueSchedules = json.decode(response.body);      
      SchedulesService.scheduledMatchesCache = pLeagueSchedules.map((var model) => PLeagueSession.fromJson(model)).toList();
      return SchedulesService.scheduledMatchesCache;
    }
    else{
      throw Exception('Failed to load gallery images');
    }
  }
}