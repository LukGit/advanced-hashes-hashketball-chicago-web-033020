# Write your code here!
require 'pry'
def game_hash
  hash = {
    :home => {:team_name => "Brooklyn Nets", 
              :colors => ["Black", "White"],
              :players => [{:player_name => "Alan Anderson",
                            :number => 0, 
                            :shoe => 16,
                            :points => 22,
                            :rebounds => 12,
                            :assists => 12,
                            :steals => 3,
                            :blocks => 1,
                            :slam_dunks => 1},
                            {:player_name => "Reggie Evans",
                            :number => 30, 
                            :shoe => 14,
                            :points => 12,
                            :rebounds => 12,
                            :assists => 12,
                            :steals => 12,
                            :blocks => 12,
                            :slam_dunks => 7},
                            {:player_name => "Brook Lopez",
                            :number => 11, 
                            :shoe => 17,
                            :points => 17,
                            :rebounds => 19,
                            :assists => 10,
                            :steals => 3,
                            :blocks => 1,
                            :slam_dunks => 15},
                            {:player_name => "Mason Plumlee",
                            :number => 1, 
                            :shoe => 19,
                            :points => 26,
                            :rebounds => 11,
                            :assists => 6,
                            :steals => 3,
                            :blocks => 8,
                            :slam_dunks => 5},
                            {:player_name => "Jason Terry",
                            :number => 31, 
                            :shoe => 15,
                            :points => 19,
                            :rebounds => 2,
                            :assists => 2,
                            :steals => 4,
                            :blocks => 11,
                            :slam_dunks => 1},
                          ]
              }, 
    :away => {:team_name => "Charlotte Hornets", 
              :colors => ["Turquoise", "Purple"],
              :players => [{:player_name => "Jeff Adrien",
                            :number => 4, 
                            :shoe => 18,
                            :points => 10,
                            :rebounds => 1,
                            :assists => 1,
                            :steals => 2,
                            :blocks => 7,
                            :slam_dunks => 2},
                            {:player_name => "Bismack Biyombo",
                            :number => 0, 
                            :shoe => 16,
                            :points => 12,
                            :rebounds => 4,
                            :assists => 7,
                            :steals => 22,
                            :blocks => 15,
                            :slam_dunks => 10},
                            {:player_name => "DeSagna Diop",
                            :number => 2, 
                            :shoe => 14,
                            :points => 24,
                            :rebounds => 12,
                            :assists => 12,
                            :steals => 4,
                            :blocks => 5,
                            :slam_dunks => 5},
                            {:player_name => "Ben Gordon",
                            :number => 8, 
                            :shoe => 15,
                            :points => 33,
                            :rebounds => 3,
                            :assists => 2,
                            :steals => 1,
                            :blocks => 1,
                            :slam_dunks => 0},
                            {:player_name => "Kemba Walker",
                            :number => 33, 
                            :shoe => 15,
                            :points => 6,
                            :rebounds => 12,
                            :assists => 12,
                            :steals => 7,
                            :blocks => 5,
                            :slam_dunks => 12},
                          ]
            }  
  }
  hash
end

def build_hash(type)
  player_ah = []
  hash1 = game_hash
  hash1.each do |h_w, team|
    player_ah.concat(team[:players])
  end
  pt_hash = {}
  # take each player hash in the array and convert it into a hash with player name as the key and the incoming type as the value. The entire hash is them return to caller for examination
  pt_hash = player_ah.to_h {|k| [k[:player_name], k[type]]}
  pt_hash
end

def num_points_scored(name)
  # call build_hash to build a hash with player name as key and points as value. This can then be looked up using parm name
  retrun_hash = build_hash(:points)
  point_s = retrun_hash[name]
  point_s
end

def shoe_size(name)
  # call build_hash to build a hash with player name as key and shoe size as value. This can then be looked up using parm name
  retrun_hash = build_hash(:shoe)
  ssize = retrun_hash[name]
  ssize
end

def team_colors(tname)
  colorhash = {}
  hash3 = game_hash
  hash3.each do |h_w, team|
    colorhash[team[:team_name]] = team[:colors]
  end
  t_color = colorhash[tname]
  t_color
end

def team_names
  name_ar = []
  hash3 = game_hash
  hash3.each do |h_w, team|
    name_ar << team[:team_name]
  end
  name_ar
end

def player_numbers(tname)
  player_num = []
  hash2 = game_hash
  hash2.each do |h_w, team|
    if team[:team_name] == tname
      player_num = team[:players]
    end
  end
  outnum = player_num.map{|h| h[:number]}
  outnum
end

def player_stats(name)
  stat = []
  s_hash = {}
  hash4 = game_hash
  hash4.each do |h_w, team|
    stat.concat(team[:players])
  end
  i = 0 
  hash_temp = {}
  new_hash = {}
  while i < stat.size do
    pname = stat[i][:player_name]
    hash_temp = {:number => stat[i][:number],
    :shoe => stat[i][:shoe],
    :points => stat[i][:points],
    :rebounds => stat[i][:rebounds],
    :assists => stat[i][:assists],
    :steals => stat[i][:steals],
    :blocks => stat[i][:blocks],
    :slam_dunks => stat[i][:slam_dunks]}
    new_hash[pname] = hash_temp
    i += 1
  end
  out_hash = new_hash[name]
  out_hash
end

def big_shoe_rebounds
  player_s = []
  hash5 = game_hash
  hash5.each do |h_w, team|
    player_s.concat(team[:players])
  end
  maxpt = 0 
  maxshoe = 0
  i = 0 
  while i < player_s.size do
    if maxshoe < player_s[i][:shoe]
      maxshoe = player_s[i][:shoe]
      maxpt = player_s[i][:rebounds]
    end
    i += 1
  end
  maxpt
end

def most_stat(type)
  # return name of player with the most of any stat type from calling method
  player_s = []
  hash5 = game_hash
  hash5.each do |h_w, team|
    player_s.concat(team[:players])
  end
  maxpt = 0 
  maxplayer = ""
  i = 0 
  while i < player_s.size do
    if maxpt < player_s[i][type]
      maxplayer = player_s[i][:player_name]
      maxpt = player_s[i][type]
    end
    i += 1
  end
  maxplayer
end

def most_points_scored
  # call most_stat to return most points player
  the_player = most_stat(:points)
  the_player
end

def winning_team 
 teams = []
 record = []
  hash5 = game_hash
  hash5.each do |h_w, team|
    tot = 0
    record << team[:team_name]
    # use .sum to total up points for each player in the array team[:players]
    tot = team[:players].sum {|x| x[:points]}
    record << tot
    teams << record
  end
  i = 0 
  maxteam = ""
  maxpt = 0 
  while i < teams.size do
    if maxpt < teams[i][1]
      maxpt = teams[i][1]
      maxteam = teams[i][0]
    end
    i += 1
  end
  maxteam
end

def player_with_longest_name
 names = []
  hash5 = game_hash
  hash5.each do |h_w, team|
    i = 0 
    while i < team[:players].size do
      names << team[:players][i][:player_name]
      i += 1
    end
  end
  # use .max_by to find the max length of each array entry
  maxname = names.max_by {|a| a.length}
  maxname
end

def most_steals
  # call most_stat to return most steals player
  the_player = most_stat(:steals)
  the_player
end

def long_name_steals_a_ton?
  # call most_steals to find the name to compare to the name retrun by player_with_longest_name
  if most_steals = player_with_longest_name
    return true 
  else
    return false
  end 
end