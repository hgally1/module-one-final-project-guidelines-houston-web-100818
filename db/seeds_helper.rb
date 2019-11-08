require 'nokogiri'
require 'open-uri'
# require_relative '../config/environment'


def hrefs 
    html = open("https://www.hauntedrooms.com/haunted-places")
    doc = Nokogiri::HTML(html)

    return doc.css('div.entry-content li a').map { |link| link['href'] }
end

def href_arr # creates an array of urls that will be plugged into the other methods
    arr = []
    hrefs.each do |state|
        str = "https://www.hauntedrooms.com"
        str += "#{state}"
        arr << str
    end
    arr
end

def state_name(state_href) # gets state name

  href = "#{state_href}"

  html = open("#{href}")
  doc = Nokogiri::HTML(html)

  state = doc.css(".entry-title").text.split(" ").last
end

def haunt_info(state_href) # creates an array for each haunt with subarrays for its name and city
  haunt_names = []

    href = "#{state_href}"

    html = open("#{href}")
    doc = Nokogiri::HTML(html)

    places = doc.css(".section-title-main")

    places.each do |index|
      arr = []
      haunt = index.text[3..-1]
      haunt_names << haunt.split(", ")
    end
  
  haunt_names[0..-2]
end

def descriptions(state_href) # creates an array of descriptions (each description is 1 index)

  href = "#{state_href}"

  html = open("#{href}")
  doc = Nokogiri::HTML(html)

  unparsed_info = doc.css(".page-inner p")

  paragraph = ""
  x = unparsed_info[3..-1]
  x.each do |index|
      description = index.text
      if !description.empty?
          paragraph << description
      else
          paragraph << "*"
      end
  end

  h_description = paragraph.split("*")
  last = h_description.pop.split(".")
  h_description += [last[0..-3].join(".")]
  h_description
end

def haunt_hasher(state_href) # creates a hash of every haunt in a state

  haunt_hash = {}

  haunt_hash = {}
  href = "#{state_href}"

  info = haunt_info(href)
  state = state_name(href)
  about = descriptions(href)
    
  info.each do |haunt|
        if haunt.length == 3
          if !haunt_hash[state]
              haunt_hash[state] = [{ :name => haunt[0].to_s, :city => haunt[1].to_s, :state => haunt[2].to_s, :description => about[info.index(haunt)].to_s }]
            
          else
              haunt_hash[state] << { :name => haunt[0].to_s, :city => haunt[1].to_s, :state => haunt[2].to_s, :description => about[info.index(haunt)].to_s }
            
          end
        else
          if !haunt_hash[state]
              haunt_hash[state] = [{ :name => haunt[0].to_s, :city => haunt[1].to_s, :state => state.to_s, :description => about[info.index(haunt)].to_s }]
          else
              haunt_hash[state] << { :name => haunt[0].to_s, :city => haunt[1].to_s, :state => state.to_s, :description => about[info.index(haunt)].to_s }
            
          end
        end
  end

  haunt_hash
end


def final_haunt_hash # creates a hash of every state and their haunts
  
  hash = {}

  href_arr.each do |state_href|
    href = "#{state_href}"

    merger = haunt_hasher(href)
    
    hash.merge!(merger)
  end

  hash
end




# bars_array.each do | bar |

#   this_bar = Bar.find_or_create_by(
#     name: bar["name"],
#     category: bar["categories"][0]["title"],
#     city: bar["location"]["city"],
#     url: "https://www.yelp.com/biz/#{bar["alias"]}"
#   )

#   bar_reviews = review_scraper(this_bar.url)

#   bar_reviews.each do | bar_review |
#     this_user = User.find_or_create_by(name: bar_review["author"])

#     this_review = Review.find_or_create_by(
#       user: this_user,
#       bar: this_bar,
#       rating: bar_review["reviewRating"]["ratingValue"],
#       content: bar_review["description"]
#     )
#   end