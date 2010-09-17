require 'builder'
require 'ostruct'

class Blog < OpenStruct

  def entries
    @entries ||= []
  end

  def to_rss
    xml = Builder::XmlMarkup.new
    xml.instruct!
    xml.rss version: "2.0" do
      xml.channel do
        xml.title        title
        xml.link        "http://#{domain}/"
        xml.description  description
        xml.language    "en-us"

        @entries.each do |entry|
          xml.item do
            xml.title       entry.title
            xml.description entry.description
            xml.author      author
            xml.pubDate     entry.published_date
            xml.link        entry.url
            xml.guid        entry.url
          end
        end
      end
    end    
  end

end
