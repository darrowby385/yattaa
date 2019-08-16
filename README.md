# やったー！
### Yahoo! Finance quote summaries as delicious, digestible JSON.

This is a humble Ruby script designed to scrape quote summaries from Yahoo! Finance and return them as JSON, ready to feed other hungry scripts that lack the enzyme for digesting HTML.

![example](https://user-images.githubusercontent.com/19504141/63202656-20f16e00-c0ce-11e9-9bac-a98d04bffdc7.jpg)

## Setup

1. [Clone this repository](https://help.github.com/en/articles/cloning-a-repository) to your local machine and [`cd` into it](https://www.learnenough.com/command-line-tutorial/basics).
2. Run `bundle install` to install dependencies (if you don't have [Bundler](https://bundler.io/), run `gem install bundler` first).
3. That's it!

## Actually using the thing
From within your local copy of this repository, run `ruby yattaa.rb <ticker>`, replacing `<ticker>` with the stock ticker you want to retrieve data for. If you don't get the results you expected, make sure the ticker you've specified matches the format used by Yahoo! Finance.

For example, `ruby yattaa.rb CSL.AX` will output the quote summary for CSL Limited on the Australian Securities Exchange (ASX). `ruby yattaa.rb MSFT` will output the quote summary for Microsoft Corporation on the Nasdaq, etc.

## Just to be clear
This software and its author are not affiliated, associated, authorized, endorsed by, or in any way officially connected with Yahoo or Verizon Media, any of their subsidiaries, or affiliates. The official Yahoo! Finance website can be found at http://finance.yahoo.com.

For other legal matters, please see the [LICENSE file](LICENSE).