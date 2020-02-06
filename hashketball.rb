def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }, {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        }, {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        }, {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        }, {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        }, {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        }, {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        }, {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        }, {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }]
    }
  }
end


def names_with_stats(stat) #helper method displaying all players names with corresponding points
  new_hash = {}
  game_hash.each do |team_key, team_value|
    team_value[:players].each do |player|
      new_hash[player[:player_name]] = player[stat]
    end
  end
  return new_hash
end

def names_with_points
  names_with_stats(:points)
end

def names_with_shoe_size
  names_with_stats(:shoe)
end

def team_information(info)
  new_hash = {}
  game_hash.each do |team_key, team_value|
    new_hash[team_value[:team_name]] = team_value[info.to_sym]
  end
  new_hash
end

def players_info
  player_array = []
  team_information("players").each do |team_key, team|
    team.each {|player| player_array.push(player)}
  end
  player_array
end
      



def num_points_scored(player)
  names_with_points[player]
end

def shoe_size(player)
  names_with_shoe_size[player]
end

def team_colors(team)
  team_information("colors")[team]
end

def team_names
  team_information("team_name").keys
end

def player_numbers(team)
  arr = []
  team_information("players")[team].each do |player|
    arr.push(player[:number])
  end
  arr
end


def player_stats(name)
  players_info.each do |player_info|
    if player_info[:player_name] == name
      player_info.delete(:player_name)
      return player_info
    end
  end
end

def big_shoe_rebounds
  largest_shoe = 0
  rebound_record = 0
  players_info.each do |player_info|
    if player_info[:shoe] > largest_shoe
      largest_shoe = player_info[:shoe]
      rebound_record = player_info[:rebounds]
    end
  end
  return rebound_record
end

def most_points_scored
  highest_score = 0
  highest_scoring_player = ""
  players_info.each do |player_info|
    if player_info[:points] > highest_score
      highest_score = player_info[:points]
      highest_scoring_player = player_info[:player_name]
    end
  end
  return highest_scoring_player
end

def winning_team
  highest_score = 0
  highest_scoring_team_name = ""
  team_information("players").each do |team_name, players|
    team_score = 0
    players.each do |player|
      team_score += player[:points]
    end
    if team_score > highest_score
      highest_score = team_score
      highest_scoring_team_name = team_name
    end
  end
  return highest_scoring_team_name
end

def player_with_longest_name
  longest_name = ""
  players_info.each do |player_info|
    if player_info[:player_name].length > longest_name.length
      longest_name = player_info[:player_name]
    end
  end
  return longest_name
end

def most_steals
  highest_score = 0
  highest_scoring_player = ""
  players_info.each do |player_info|
    if player_info[:steals] > highest_score
      highest_score = player_info[:steals]
      highest_scoring_player = player_info[:player_name]
    end
  end
  return highest_scoring_player
end

def long_name_steals_a_ton?
  player_with_longest_name == most_steals ? true : false
end