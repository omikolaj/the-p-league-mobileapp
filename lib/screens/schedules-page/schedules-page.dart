import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_p_league_mobileapp/models/p-league-match.dart';
import 'package:the_p_league_mobileapp/models/p-league-session.dart';
import 'package:the_p_league_mobileapp/screens/schedules-page/p-league-source.dart';
import 'package:the_p_league_mobileapp/services/schedules-service.dart';

class SchedulesPage extends StatefulWidget {
  SchedulesPage({Key key}) : super(key: key);

  @override
  _SchedulesPageState createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
  Future<List<PLeagueSession>> futureScheduledMatches;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _lastRowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    _populateScheduledMatches();
  }

  Future _populateScheduledMatches() {
    return this.futureScheduledMatches = SchedulesService().fetchSchedules();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this.futureScheduledMatches,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else
              return SingleChildScrollView(
                  child: SafeArea(child: _createTableView(context, snapshot)));
        }
      },
    );
  }

  Widget _createTableView(BuildContext context, AsyncSnapshot snapshot) {
    List<PLeagueSession> sessions = snapshot.data;
    List<PLeagueMatch> scheduledMatches =
        sessions.expand((session) => session.matches).toList();

    PLeagueSource dataSource = PLeagueSource(scheduledMatches);

    return PaginatedDataTable(
      columns: [
        DataColumn(label: Text("Home")),
        DataColumn(label: Text("Result")),
        DataColumn(label: Text("Away")),
        DataColumn(label: Text("Date"))
      ],
      source: dataSource,
      header: Text("P League Mathes"),
      rowsPerPage: _rowsPerPage,
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:the_p_league_mobileapp/models/p-league-match.dart';
// import 'package:the_p_league_mobileapp/models/p-league-session.dart';
// import 'package:the_p_league_mobileapp/services/schedules-service.dart';

// class SchedulesPage extends StatefulWidget {
//   SchedulesPage({Key key}) : super(key: key);

//   @override
//   _SchedulesPageState createState() => _SchedulesPageState();
// }

// class _SchedulesPageState extends State<SchedulesPage> {
//   Future<List<PLeagueSession>> futureScheduledMatches;

//   @override
//   void initState() {
//     super.initState();
//     _populateScheduledMatches();
//   }

//   Future _populateScheduledMatches() {
//     return this.futureScheduledMatches = SchedulesService().fetchSchedules();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: this.futureScheduledMatches,
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.waiting:
//             return CircularProgressIndicator();
//           default:
//             if (snapshot.hasError)
//               return Text('Error: ${snapshot.error}');
//             else
//               return SingleChildScrollView(
//                   child: _createTableView(context, snapshot));
//         }
//       },
//     );
//   }

//   Widget _createTableView(BuildContext context, AsyncSnapshot snapshot) {
//     List<PLeagueSession> sessions = snapshot.data;
//     List<PLeagueMatch> scheduledMatches =
//         sessions.expand((session) => session.matches).toList();

//     List<DataRow> rows = new List<DataRow>();
//     for (var i = 0; i < scheduledMatches.length; i++) {
//       rows.add(DataRow(cells: [
//         DataCell(Text(scheduledMatches[i].homeTeamName)),
//         DataCell(
//           Text(scheduledMatches[i].matchResult.score ?? "0 : 0"),
//         ),
//         DataCell(Text(scheduledMatches[i].awayTeamName)),
//         DataCell(Text(scheduledMatches[i].dateTime.toString()))
//       ]));
//     }

//     return DataTable(
//       columns: [
//         DataColumn(label: Text("Home")),
//         DataColumn(label: Text("Result")),
//         DataColumn(label: Text("Away")),
//         DataColumn(label: Text("Date"))
//       ],
//       rows: rows,
//     );
//   }
// }
