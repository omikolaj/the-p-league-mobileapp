class Team{
  final String id;
  final bool active;
  final String name;
  final bool selected;
  final String leagueID;

  Team({
    this.id, 
    this.active, 
    this.name,
    this.selected,
    this.leagueID,
  });

  factory Team.fromJson(Map<String, dynamic> json){
    return Team(
      id: json["id"],
      active: json["active"],
      name: json["name"],      
      selected: json["selected"],      
      leagueID: json["leagueID"],      
    );
  }
}