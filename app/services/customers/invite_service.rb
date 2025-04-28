module Customers
  class InviteService
    class InvalidFileError < StandardError; end

    MUMBAI_LAT = 19.0590317
    MUMBAI_LON = 72.7553452
    MAX_DISTANCE_KM = 100

    def initialize(file)
      @file = file
    end

    def call
      customers = []
      File.foreach(@file.path) do |line|
        begin
          customer = JSON.parse(line.strip)
          distance = DistanceCalculator.distance_in_km(MUMBAI_LAT, MUMBAI_LON, customer["latitude"].to_f, customer["longitude"].to_f)
          if distance <= MAX_DISTANCE_KM
            customers << { user_id: customer["user_id"], name: customer["name"] }
          end
        rescue JSON::ParserError
          raise InvalidFileError, "Invalid JSON format in file."
        end
      end
      customers.sort_by { |c| c[:user_id] }
    end
  end
end