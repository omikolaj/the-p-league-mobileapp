import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_p_league_mobileapp/models/p-league-match.dart';
import 'package:the_p_league_mobileapp/models/p-league-session.dart';
import 'package:the_p_league_mobileapp/screens/schedules-page/p-league-source.dart';
import 'package:the_p_league_mobileapp/services/schedules-service.dart';
import 'dart:io';

class SchedulesPage extends StatefulWidget {
  SchedulesPage({Key key, PLeagueSource dataSource}) : dataSource = dataSource ;
  final PLeagueSource dataSource;

  @override
  _SchedulesPageState createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
  Future<List<PLeagueSession>> futureScheduledMatches;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool sortAsc = true;
  int sortColumnIndex = Columns.Date;

  @override
  void initState() {
    super.initState();
    //_populateScheduledMatches();
  }

  //Future _populateScheduledMatches() {
    //return this.futureScheduledMatches = SchedulesService().fetchSchedules();
  //}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.dataSource.sessions,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else
              return SingleChildScrollView(
                  child: SafeArea(child: _createTableView()));
        }
      },
    );
  }

  void _setUpTableForSorting(int columnIndex, bool asc){
    // change the table to display all records before we sort
    // navigating between pages is broken and resets the sort display arrow
    _rowsPerPage = widget.dataSource.data.length;
    sortAsc = asc;
    sortColumnIndex = columnIndex;
  }

  Widget _createTableView() {
    print("sortAscending: $sortAsc");
    return PaginatedDataTable(
      columns: [
        DataColumn(label: Text("Home"), onSort: (columnIndex, asc){
          setState(() {
            _setUpTableForSorting(columnIndex, asc);
            
            widget.dataSource.sortData(columnIndex, asc);
          });
        }),
        DataColumn(label: Text("Result"), onSort: (columnIndex, asc){
          setState(() {
            _setUpTableForSorting(columnIndex, asc);
            widget.dataSource.sortData(columnIndex, asc);
          });
        }),
        DataColumn(label: Text("Away"), onSort: (columnIndex, asc){
          setState(() {         
            _setUpTableForSorting(columnIndex, asc);
            widget.dataSource.sortData(columnIndex, asc);
          });
        }),
        DataColumn(label: Text("Date"), onSort: (columnIndex, asc){
          setState(() {
            _setUpTableForSorting(columnIndex, asc);
            widget.dataSource.sortData(columnIndex, asc);
          });
        })
      ],
      source: widget.dataSource,
      header: Text("P League Mathes"),
      rowsPerPage: _rowsPerPage,
      columnSpacing: 26,
      sortColumnIndex: sortColumnIndex,
      sortAscending: sortAsc,
      availableRowsPerPage: <int>[10, 15, widget.dataSource.data.length],
      onRowsPerPageChanged: (r) {
        setState(() {
          _rowsPerPage = r;
        });
      },
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
