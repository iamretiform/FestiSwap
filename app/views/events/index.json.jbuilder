json.events @events do |event|
  json.call(event, :longitude, :latitude, :radius)
end
