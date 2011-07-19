require 'rubygems'
require 'simple-rss'
require 'open-uri'

module MicroEconomy
  class CraigsData
    def initialize(options = {})
      options[:location] ||= "sfbay"
      @base_url = "http://#{options[:location]}.craigslist.org"
    end
    
    def apartment_data
      rss = SimpleRSS.parse open("#{@base_url}/pen/apa/index.rss")

      bedrooms = Hash.new

      for item in rss.items
        title = item.title
        bedroom_count = title.match(/(\d+)[\s]*[Bb][DdRr]/)
        price = title.match(/\$(\d+)/)

        unless bedroom_count.nil? || price.nil?
          bedrooms[bedroom_count[1].to_i] ||= Array.new
          bedrooms[bedroom_count[1].to_i] << price[1].to_i
        end
      end
      
      listings = Hash.new
      
      for key in bedrooms.keys
        listings[key] = Hash.new
        total_in_set = bedrooms[key].size
        average = bedrooms[key].inject(0.00){ |sum, cur| sum + cur } / total_in_set
        listings[key]['average'] = average
        listings[key]['data_point_count'] = total_in_set 
      end
            
      return listings
      
    end
  end
end