import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_p_league_mobileapp/models/p-league-match.dart';
import 'package:the_p_league_mobileapp/services/schedules-service.dart';

class SchedulesPage extends StatefulWidget {
  SchedulesPage({Key key}) : super(key: key);

  @override
  _SchedulesPageState createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
  Future<List<PLeagueMatch>> futureScheduledMatches;
  
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
              return _createTableView(context, snapshot);              
        }
      },
    );
  }

  Widget _createTableView(BuildContext context, AsyncSnapshot snapshot) {
    List<PLeagueMatch> scheduledMatches = snapshot.data;
    List<DataRow> rows = new List<DataRow>();
    for(var i = 0; i < 3; i++){
      rows.add(
        DataRow(
          cells: [
            DataCell(
              // Text(scheduledMatches[i].homeTeamName)              
              Text("Barca")
            ),
            DataCell(
              // Text(scheduledMatches[i].matchResult.score),             
              Text("5:2")
            ),
            DataCell(
              // Text(scheduledMatches[i].awayTeamName)              
              Text("Juve")
            ) 
          ]
        )
      );
    }

    return DataTable(
      columns: [
        DataColumn(label: Text("Home")),
        DataColumn(label: Text("Result")),
        DataColumn(label: Text("Away")),
        // DataColumn(label: Text("Date"))
      ],
      rows: rows,
    );
  }
}
