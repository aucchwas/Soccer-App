require 'uri'
require 'net/http'
require 'openssl'
require 'json'

# Clear existing data
Player.delete_all
Team.delete_all
League.delete_all

HOST = 'v3.football.api-sports.io'
API_KEY = "73fc261b18c5c0cb4ef28499b44853f4"

def get_players(team_id, team)
  url = URI("https://v3.football.api-sports.io/players/squads?team=#{team_id}")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER # Ensure SSL verification

  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-host"] = HOST
  request["x-rapidapi-key"] = API_KEY

  response = http.request(request)

  if response.is_a?(Net::HTTPSuccess)
    json_data = JSON.parse(response.read_body)

    if json_data.key?('response')
      json_data['response'].each do |item|
        players_data = item['players']

        players_data.each do |player|
          begin
            Player.find_or_create_by!(
              id: player['id'],
              name: player['name'],
              age: player['age'],
              number: player['number'],
              position: player['position'],
              photo: player['photo'],
              team_id: team.id
            )
          rescue ActiveRecord::RecordInvalid => e
            puts "Failed to create player: #{player['name']} - #{e.message}"
          end
        end
      end
    else
      puts "Key 'response' not found in the JSON data."
    end
  else
    puts "HTTP request failed with code: #{response.code}"
  end
end

def get_teams(custom_id, league)
  url = URI("https://v3.football.api-sports.io/standings?league=#{custom_id}&season=2022")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER # Ensure SSL verification

  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-host"] = HOST
  request["x-rapidapi-key"] = API_KEY

  response = http.request(request)

  if response.is_a?(Net::HTTPSuccess)
    json_data = JSON.parse(response.read_body)

    if json_data.key?('response')
      json_data['response'].each do |item|
        standings_data = item['league']['standings'].flatten

        standings_data.each do |team|
          team_data = team['team']

          team_record = Team.find_or_create_by!(
            team_name: team_data['name'],
            points: team['points'],
            goal_diff: team['goalsDiff'],
            league_id: league.id
          )

          # Fetch players for the team
          get_players(team_data['id'], team_record)
        end
      end
    else
      puts "Key 'response' not found in the JSON data."
    end
  else
    puts "HTTP request failed with code: #{response.code}"
  end
end

url = URI("https://v3.football.api-sports.io/leagues")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER # Ensure SSL verification

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = HOST
request["x-rapidapi-key"] = API_KEY

response = http.request(request)

if response.is_a?(Net::HTTPSuccess)
  json_data = JSON.parse(response.read_body)

  if json_data.key?('response')
    json_data['response'].take(10).each do |item|
      league_data = item['league']
      country_data = item['country']

      league = League.find_or_create_by!(
        league_name: league_data['name'],
        league_type: league_data['type'],
        custom_id: league_data['id'],
        country_name: country_data['name']
      )
      get_teams(league.custom_id, league)
    end
  else
    puts "Key 'response' not found in the JSON data."
  end
else
  puts "HTTP request failed with code: #{response.code}"
end

puts "There are now #{League.count} leagues in the database."
puts "There are now #{Team.count} teams in the database."
puts "There are now #{Player.count} players in the database."
