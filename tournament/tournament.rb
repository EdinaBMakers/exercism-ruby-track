class Tournament
  
  TEAM_WIDTH = 31
  STAT_WIDTH = 4
  
  def self.tally(results_str)
    results_by_teams = Hash.new{|hash, key| hash[key] = Stats.new}
    results = results_str.split("\n")
    
    results.each do |result|
      result_arr = result.split(";")
      
      handle_result(results_by_teams, *result_arr)
    end
    
    get_table(results_by_teams)
  end
  
  def self.handle_result(results_by_teams, home_team, away_team, game_result)
    home_team_stats = results_by_teams[home_team]
    away_team_stats = results_by_teams[away_team]
    
    case game_result
      when "win"
        home_team_stats.win
        away_team_stats.loss
      when "loss"
        home_team_stats.loss
        away_team_stats.win
      else
        home_team_stats.draw
        away_team_stats.draw
    end
  end
  
  def self.get_table(results_by_teams)
    
    table_rows = [["Team", "MP", "W", "D", "L", "P"]]
    
    sort_teams(results_by_teams).each do |team|
      stats = results_by_teams[team]
      table_rows << [team, stats.matches_played, stats.matches_won, stats.matches_drawn, stats.matches_lost, stats.calculate_points]
    end
    
    table_rows.map do |row|
      format_row(row)
    end.join
  end
    
  def self.format_row(row)
    format_team(row[0]) + format_stats(row[1..5]) + "\n"
  end
  
  def self.format_team(team)
    team.ljust(TEAM_WIDTH)
  end
  
  def self.format_stats(stats)
    ("|" + stats.map {|s| format_stat(s)}.join("|")).rstrip
  end
  
  def self.format_stat(stat)
    (stat.to_s + " ").rjust(STAT_WIDTH)
  end
  
  def self.sort_teams(results_by_teams)
    results_by_teams.keys.sort_by {|t| [-results_by_teams[t].calculate_points, t]}
  end
  
end


class Stats
  attr_reader :matches_played, :matches_won, :matches_drawn, :matches_lost
  
  def initialize
    @matches_played = 0
    @matches_won = 0
    @matches_drawn = 0
    @matches_lost = 0
  end
    
  def win
    @matches_played += 1
    @matches_won += 1
  end
  
  def loss
    @matches_played += 1
    @matches_lost += 1
  end
  
  def draw
    @matches_played += 1
    @matches_drawn += 1
  end
  
  def calculate_points
    @matches_won * 3 + @matches_drawn
  end
  
end