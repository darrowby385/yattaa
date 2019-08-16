# やったー！
# Yahoo! Finance quote summaries, scraped and converted to digestible JSON.
# © 2019 Friday Saarelaht https://github.com/darrowby385/yattaa

require 'open-uri'
require 'nokogiri'
require 'json'

def process(ticker)

	# Set URL according to provided ticker, retrieve HTML, and parse using nokogiri.
	url = "https://au.finance.yahoo.com/quote/#{ticker}"
	html_data = open(url).read
	page = Nokogiri::HTML(html_data)

	# Initialise arrays to house extracted data.
	fields = []
	values = []

	# Iteratively extract fields from the quote summary and store them in the fields array.
	# Fields are isolated using the characteristic class of their td elements: "C(black) W(51%)".
	quote_summary_fields = page.xpath("//div[@id='quote-summary']//td[@class='C(black) W(51%)']/span").each do |field|
		fields.push(field.text)
	end

	# Iteratively extract values from the quote summary and store them in the values array.
	# Values are isolated using their data-test attributes, which consistently end in "-value", e.g. "PREV_CLOSE-value".
	quote_summary_values = page.xpath("//div[@id='quote-summary']
		//td[string-length(substring-before(@data-test, '-value')) >= 0 
		and  string-length(substring-after(@data-test, '-value')) = 0 
		and contains(@data-test, '-value')]").each do |value|
		values.push(value.text)
	end

	# Combine fields and values arrays to create a hash, and convert the hash to JSON.
	Hash[fields.zip(values)].to_json
end

# Accept and process ticker specified as an argument when running script.
if ARGV.first != nil
	output = process(ARGV.first)
	puts output
else
	puts "No ticker specified."
end