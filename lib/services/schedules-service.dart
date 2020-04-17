import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:the_p_league_mobileapp/models/p-league-session.dart';

class SchedulesService{
  Future<List<PLeagueSession>> fetchSchedules() async {
    final response = await http.get('https://www.thepleague.club/api/schedules/sessions');

    if(response.statusCode == 200){     
      Iterable pLeagueSchedules = json.decode(response.body);      
      List<PLeagueSession> sessions = pLeagueSchedules.map((var model) => PLeagueSession.fromJson(model)).toList();
      return sessions;
    }
    else{
      throw Exception('Failed to load schedules');
    }
  }
}