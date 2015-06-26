json.metro_stations @info do |s|
json.name    s[0]
json.long    s[1]
json.lat     s[2]
json.code    s[3]
json.address s[4]
end

json.bike_stations @bike do |b|
json.name    b[0]
json.long    b[1]
json.lat     b[2]
end

json.trains_incoming @train do |t|
json.destination  t[0]
json.line         t[1]
json.station      t[2]
json.min          t[3]
end