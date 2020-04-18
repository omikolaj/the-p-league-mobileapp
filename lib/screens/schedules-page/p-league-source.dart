import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:the_p_league_mobileapp/models/p-league-match.dart';
import 'package:intl/intl.dart';
import 'package:the_p_league_mobileapp/models/p-league-session.dart';
import 'package:the_p_league_mobileapp/services/schedules-service.dart';

class PLeagueSource extends DataTableSource {
  List<PLeagueMatch> data = List<PLeagueMatch>();
  SchedulesService scheduleService = SchedulesService();
  final _sessionsCache = AsyncCache<List<PLeagueSession>>(const Duration(hours: 1));
  // in flutter material ascending points arrow down and descending up. Seems backwards
  bool ascending = true;
  int sortingIndex = 3;
  
  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  Future<List<PLeagueSession>> get sessions => _sessionsCache.fetch((){
    return scheduleService.fetchSchedules().then((json) {
      List<PLeagueSession> sessions = json;
      List<PLeagueMatch> scheduledMatches = sessions.expand((session) => session.matches).toList();
      data = scheduledMatches;
      // sory by date in asc from oldest date to latest
      sortData(Columns.Date, ascending);
      return json;
    });
  });

  void sortData(int columnIndex, bool ascending){
    this.sortingIndex = columnIndex;
    RegExp teamNameReg = new RegExp(r"\s+\b|\b\s");
    data.sort((a,b) {
      switch (columnIndex) {
      case Columns.Home:
        String aHomeTeam = a.homeTeamName.toLowerCase().replaceAll(teamNameReg, "");
        String bHomeTeam = b.homeTeamName.toLowerCase().replaceAll(teamNameReg, "");
        return ascending ? aHomeTeam.compareTo(bHomeTeam) : bHomeTeam.compareTo(aHomeTeam);
      case Columns.Result:
        return ascending ? b.matchResult.homeTeamScore.compareTo(a.matchResult.awayTeamScore) : a.matchResult.homeTeamScore.compareTo(b.matchResult.awayTeamScore);
      case Columns.Away:
        String aAwayTeam = a.awayTeamName.toLowerCase().replaceAll(teamNameReg, "");
        String bAwayTeam = b.awayTeamName.toLowerCase().replaceAll(teamNameReg, "");
        return ascending ? aAwayTeam.compareTo(bAwayTeam) : bAwayTeam.compareTo(aAwayTeam);
      case Columns.Date:
        DateTime aDate = DateTime.fromMillisecondsSinceEpoch(a.dateTime * 1000).toLocal();
        DateTime bDate = DateTime.fromMillisecondsSinceEpoch(b.dateTime * 1000).toLocal();
        return ascending ? aDate.compareTo(bDate) : bDate.compareTo(aDate); 
      default:
        return 0;
    }
    });
  }

  @override
  DataRow getRow(int index) {
    final f = DateFormat("M/d/y, h:mm a");
    return DataRow.byIndex(index: index, cells: [
        DataCell(Text(this.data[index].homeTeamName)),
        DataCell(
          Text(data[index].matchResult.score ?? "0 : 0"),
        ),
        DataCell(Text(data[index].awayTeamName)),
        DataCell(Text(f.format(DateTime.fromMillisecondsSinceEpoch(data[index].dateTime * 1000).toLocal())))
      ]);
  }
}

/// Convenience class. Is not synched up with display colums 
class Columns{
  static const int Home = 0;
  static const int Result = 1;
  static const int Away = 2;
  static const int Date = 3;
}

