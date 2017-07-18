Barebone Docker Xvfb
--------------------
This should take the following steps:
=====================================
* Pull current Docker ruby image
* install xvfb and chromium
* Ping Google to get the HTTP response code (make sure we have network access)
* Go to Google and search for pictures of puppies


Steps taken to get to failure
=============================
* docker build -t dxfail .
* docker run dxfail


Errors given
============
``/usr/local/bundle/gems/selenium-webdriver-3.4.4/lib/selenium/webdriver/common/service.rb:138:in `connect_until_stable': unable to connect to chromedriver 127.0.0.1:9515 (Selenium::WebDriver::Error::WebDriverError)                                       
				from /usr/local/bundle/gems/selenium-webdriver-3.4.4/lib/selenium/webdriver/common/service.rb:74:in `block in start'                                                                              
				from /usr/local/bundle/gems/selenium-webdriver-3.4.4/lib/selenium/webdriver/common/socket_lock.rb:41:in `locked'                                                                                  
				from /usr/local/bundle/gems/selenium-webdriver-3.4.4/lib/selenium/webdriver/common/service.rb:71:in `start'                                                                                       
				from /usr/local/bundle/gems/selenium-webdriver-3.4.4/lib/selenium/webdriver/chrome/driver.rb:52:in `initialize'                                                                                   
				from /usr/local/bundle/gems/selenium-webdriver-3.4.4/lib/selenium/webdriver/common/driver.rb:46:in `new'                                                                                          
				from /usr/local/bundle/gems/selenium-webdriver-3.4.4/lib/selenium/webdriver/common/driver.rb:46:in `for'                                                                                          
				from /usr/local/bundle/gems/selenium-webdriver-3.4.4/lib/selenium/webdriver.rb:86:in `for'   
				from /usr/local/bundle/gems/watir-6.4.2/lib/watir/browser.rb:47:in `initialize'              
				from main.rb:25:in `new'                  
				from main.rb:25:in `<main>'               
FAIL: 1``
