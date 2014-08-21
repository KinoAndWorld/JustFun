require 'nokogiri'
require 'open-uri'

module TodayHelper
	def fetchTodays
		
		doc = Nokogiri::HTML(open("http://www.hltm.cc/shixianindex.asp"))
		movieList = doc.css('div#showall_today').css('tr')
		updatesByDates = []
		movieList.each do |x|

			date = x.css('td')[0].text
			contents = x.css('td')[1].css('a')

			comics = []
			contents.each do |cont|
				comics.push(cont.text) unless cont.nil?
			end
			updatesByDate = Hash.new
			updatesByDate[date] = comics unless date.empty?
			updatesByDates.push(updatesByDate)
		end

		# puts doc.class
		return updatesByDates
		
	end

end
