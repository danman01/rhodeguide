module LocationsHelper
  def display_key_distances
    html = ""
    [{key_distance.walk_distance=>"walking"},{key_distance.bike_distance=>"biking"},{key_distance.transit_distance=>"transit"},{key_distance.drive_distance=>"driving"}].each do |keyvalue|
      unless keyvalue[0].nil?
        span = "<span>#{keyvalue[1]}: #{keyvalue[0].round(2)}</span><br />"
        html += span
      end
    end 
    return html.html_safe
  end
end
