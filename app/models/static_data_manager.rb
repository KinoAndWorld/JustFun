require "singleton"
require 'net/http'
require 'json'

class StaticDataManager
	include Singleton
	
	def initialize()
		
	end

	def autoLogin
		@user = User.new
		# binding.pry
		# get the url that we need to post to
  		url = URI.parse(BaseUrl + 'User/Login/ajaxLogin')
	  	# build the params string
	  	post_args1 = { 'account' => @user.account, 'password' => @user.password, 'from' => 'loginpage' }
	  	# send the request
	  	res = Net::HTTP.post_form(url, post_args1)
	  	puts res.body if res.is_a?(Net::HTTPSuccess)
	  	# binding.pry
	  	resultHash = JSON.parse(res.body)
	  	if resultHash.is_a?(Hash)
	  		state = resultHash['status']
	  		if state == 1
	  			userInfo = resultHash['data']
	  			# binding.pry
	  			return true , userInfo
	  		else
	  			return false ,resultHash['info']
	  		end

	  	end
		# binding.pry
	end
	
end

class User
	attr_accessor :account
  	attr_accessor :password
	def initialize()

		@account = "992276678@qq.com"
		@password = "dream2012"
	end
	
	
end