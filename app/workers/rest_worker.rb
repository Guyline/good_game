class RestWorker
  include Sidekiq::Worker

  URL_ROOT = "https://www.giantbomb.com/api"

  def perform(method, params = {})
    request_params = {
      :api_key => ENV['giant_bomb_api_key'],
      :offset => params["offset"] || 0,
      :limit => params["limit"] || 100
    }
    begin
      case method
      when "companies"
        url = "#{URL_ROOT}/companies/"
        response_hash = fetch_json_hash(url, request_params)
        results_array = response_hash["results"] || []
        results_array.each do |company_hash|
          begin
            parse_company_hash(company_hash)
          rescue StandardError => e
            next
          end
        end
      when "company"
        company_id = params["id"]
        company = Company.find(company_id)
        url = "#{URL_ROOT}/company/#{company.api_resource_id}"
        response_hash = fetch_json_hash(url, request_params)
        company_hash = response_hash["result"]
        if company_hash.present?
          company = parse_company_hash(company_hash)

          # Parse associated games
          parsed_game_external_ids = Set.new
          games_array_keys = ["developed_games", "published_games"]
          games_array_keys.each do |games_array_key|
            games_array = company_hash[games_array_key] || []
            games_array.each do |game_hash|
              game_external_id = game_hash["id"]
              unless game_external_id.blank? || parsed_game_external_ids.include?(game_hash["id"])
                game = parse_game_hash(game_hash)
                parsed_game_external_ids.add(game_external_id)
              end
            end
          end
        end
      end
    rescue StandardError => e
      puts "** SOMETHING WENT WRONG: #{e.message} **"
      puts e.backtrace.join("\n")
    end
  end

  private

  def fetch_response(url, params)
    puts "  REQUESTING URL (#{url}), PARAMS => #{params.inspect}"
    RestClient.get(url, :params => params).gsub(/\n\s*/, "")
  end

  def fetch_json_hash(url, params)
    params[:format] = "json"
    response = fetch_response(url, params)
    json_hash = JSON.parse(response)
  end

  def parse_company_hash(company_hash)
    external_id = company_hash["id"]
    company = Company.where(:external_id => external_id).first_or_initialize
    company.name = company_hash["name"]
    company.city = company_hash["location_city"] || company.city
    company.state = company_hash["location_state"] || company.state
    company.country = company_hash["location_country"] || company.country
    company.save! if company.changed?
    company
  end

  def parse_game_hash(game_hash)
    external_id = game_hash["id"]
    game = Game.where(:external_id => external_id).first_or_initialize
    game.name = game_hash["name"]
    game.save! if game.changed?
    game
  end

end