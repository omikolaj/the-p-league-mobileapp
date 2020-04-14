import 'package:flutter/material.dart';
import 'package:the_p_league_mobileapp/models/p-league-match.dart';

class PLeagueSource extends DataTableSource {
  List<PLeagueMatch> data = List<PLeagueMatch>();

  PLeagueSource(this.data) : super();

  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
        DataCell(Text(this.data[index].homeTeamName)),
        DataCell(
          Text(data[index].matchResult.score ?? "0 : 0"),
        ),
        DataCell(Text(data[index].awayTeamName)),
        DataCell(Text(data[index].dateTime.toString()))
      ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

}

