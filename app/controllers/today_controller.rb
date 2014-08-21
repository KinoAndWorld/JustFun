require 'nokogiri'
require 'open-uri'

class TodayController < ApplicationController
  # helper :today
  include TodayHelper

  def lists

  	# binding.pry
  	@dataManager = StaticDataManager.instance
  	@todaylists = fetchTodays()

  	binding.pry

  	
	# isSuccess,data = @dataManager.autoLogin()
	# if isSuccess
	# 	userInfo = data
	# 	# binding.pry
	# 	# cookies[] = { :value => " }
	# 	# cookies["GKEY"] = { :value => "ab3a1f748cacb2b8a9d0382d988b8f28c2e9fa626bd1652890e530c86ddcf8d6", :expires => 1.hour.from_now }

		

	# 	todaylists = fetchTodays()
		
	# else
	# 	message = data
	# 	binding.pry
	# end
  end

end
