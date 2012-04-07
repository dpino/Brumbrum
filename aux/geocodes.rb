#!/usr/bin/ruby
# encoding: UTF-8

require 'json'
require 'uri'
require 'open-uri'

require 'rubygems'
require 'sequel'

BASE_URL = "http://maps.googleapis.com/maps/api/geocode/json?address=%s&sensor=false"

DB = Sequel.mysql 'brumbrum', :user => 'root', :password => 'nexus7', :host => 'localhost'

def getURL(url)
    return open(url).read
end

def getMapLocation(address)
    result = Hash.new

    address = URI.encode(address, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    url = BASE_URL % [address]
    response = JSON.parse(getURL(url))
    if (response['status'] == "OK")
        location = getLocation(response)
        if (!location.empty?)
            result[:lat] = location['lat']
            result[:lng] = location['lng']
        end
    end
    return result
end

def getLocation(response)
    response = response['results'][0]
    return response['geometry']['location']
end

spareyards = DB["SELECT id, address FROM spareyards WHERE latitude is null ORDER BY id"]
spareyards.each { |spareyard| 
    location = getMapLocation(spareyard[:address])
    if (!location.empty?)
        puts "UPDATE spareyards SET latitude = '%s', longitude = '%s' where id = %d;" % 
            [location[:lat], location[:lng], spareyard[:id]]
    end
}
exit
