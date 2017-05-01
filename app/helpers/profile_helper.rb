require 'uri'

module ProfileHelper

	def twitterHandle(handle)
		lowerCaseHandle = handle.downcase
		twitterRegex = /(@)|(https?:\/\/)|(www.)?(twitter.com\/)|(\/status\/[a-z0-9]*)/i
		twitterUrls = ["http://www.twitter.com", "https://www.twitter.com", "http://twitter.com", "https://www.twitter.com"]
		if lowerCaseHandle.include?("http://www.twitter.com") || lowerCaseHandle.include?("https://www.twitter.com") || lowerCaseHandle.include?("http://twitter.com") || lowerCaseHandle.include?("https://twitter.com")
			finalName = lowerCaseHandle.split(twitterRegex)
			userName = finalName.last
			link_to(userName, "http://twitter.com/#{userName}")
		elsif lowerCaseHandle.include?("@")
			handle
			newHandle = lowerCaseHandle.sub!("@","")
			link_to(newHandle, "http://twitter.com/#{newHandle.downcase}")
		else
			handle
			link_to(handle, "http://twitter.com/#{lowerCaseHandle}")
		end
	end

	def websiteHandler(userUrl)
		url = URI(userUrl)
		if userUrl = ""
			return nil
		else
			if url.scheme.nil?
				httpUrl = "http://#{url}"
				hostUrl = URI.parse(httpUrl).host[4..-1]
				link_to(hostUrl, httpUrl)
			else
				host = url.host
				finalHost = host.start_with?('www.') ? host[4..-1] : host
				link_to(finalHost, host)
			end
		end
	end


end
