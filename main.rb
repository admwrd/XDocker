require 'watir'
require "net/http"

search_url = "https://www.google.com/"
keyword = "pictures of happy puppies"

puts "Testing connectivity"

url = URI.parse(search_url)
req = Net::HTTP.new(url.host, url.port)
req.use_ssl = true
res = req.request_head(url.path)
puts "Response Code: #{res.code}"

os = "linux"
if `uname -a`.include? "Darwin"
	os = "mac"
end
#Selenium::WebDriver::Chrome.driver_path = File.dirname(__FILE__)+"/bin/#{os}/x86_64/chromedriver"
# options = Selenium::WebDriver::Remote::Capabilities.chrome({
# 	accept_insecure_certs: true,
# 	download: {
# 		prompt_for_download: false,
# 		default_directory: 'bin/linux/x86_64'
# 	}
# })
# browser = Watir::Browser.new(:firefox, :prefs => prefs, :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(:accept_insecure_certs => true))
#browser = Watir::Browser.new(:chrome, :desired_capabilities => options)
browser = Watir::Browser.new(:firefox, :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.firefox(:accept_insecure_certs => true))

browser.goto(search_url)
browser.input(:xpath => '//input[@title="Search"]').to_subtype.clear
browser.input(:xpath => '//input[@title="Search"]').send_keys keyword
browser.input(:xpath => '//input[@title="Search"]').send_keys :enter

timeout = 10
timeout.times { |i|
	r = timeout - i
	puts "Closing in #{r} seconds"
	sleep 1
}
puts "Closing Window."

browser.close
