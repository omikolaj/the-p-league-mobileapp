import 'package:flutter/material.dart';
import 'package:the_p_league_mobileapp/models/p-league-match.dart';
import 'package:intl/intl.dart';

class PLeagueSource extends DataTableSource {
  List<PLeagueMatch> data = List<PLeagueMatch>();

  PLeagueSource(this.data) : super();

  @override
  DataRow getRow(int index) {
    final f = DateFormat("EEEE MMM d, y, h:mm a");
    return DataRow.byIndex(index: index, cells: [
        DataCell(Text(this.data[index].homeTeamName)),
        DataCell(
          Text(data[index].matchResult.score ?? "0 : 0"),
        ),
        DataCell(Text(data[index].awayTeamName)),
        DataCell(Text(f.format(DateTime.fromMillisecondsSinceEpoch(data[index].dateTime * 1000).toLocal())))
      ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

}

