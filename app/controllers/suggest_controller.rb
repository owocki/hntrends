class SuggestController < ApplicationController

caches_page :index

  def index

  	suggest = Array.new

  	item = {
  		"title" => 'top startup markets',
  		"keywords" => ['nyc','silicon valley', 'san francisco', 'boulder', 'seattle', 'los angeles']
  	}
  	suggest.push item

  	item = {
  		"title" => 'top yc startups',
  		"keywords" => ['airbnb','loopt', 'dropbox', 'heroku', 'wufoo', 'Reddit', 'OMGPop', 'Mixpanel']
  	}
  	suggest.push item

  	item = {
  		"title" => 'top accelerators',
  		"keywords" => ['ycombinator', 'techstars', 'dreamit', '500 startups', 'angelpad', 'alchemist']
  	}
  	suggest.push item

  	item = {
  		"title" => 'top techstars startups',
  		"keywords" => ['digital ocean','Filtrbox', 'Sendgrid', 'Brightkite', 'Sphero', 'Occipital', 'Keen.io']
  	}
  	suggest.push item

  	item = {
  		"title" => 'presidential candidates - 2016 (democrats)',
  		"keywords" => ['hillary clinton', 'jim webb', 'john biden', 'elizabeth warren']
  	}
  	suggest.push item

  	item = {
  		"title" => 'presidential candidates - 2012 (democrats)',
  		"keywords" => ['hillary clinton', 'barack obama', 'john edwards']
  	}
  	suggest.push item

  	item = {
  		"title" => 'presidential candidates - 2016 (republicans)',
  		"keywords" => ['rand paul', 'jeb bush', 'ted cruz', 'chris christie', 'mike huckabee', 'rick santorum']
  	}
  	suggest.push item

  	item = {
  		"title" => 'presidential candidates - 2012 (republicans)',
  		"keywords" => ['john mccain', 'paul ryan', 'mitt romney', 'mike huckabee','ron paul']
  	}
  	suggest.push item

  	item = {
  		"title" => 'tech trends - #1',
  		"keywords" => ['seo', 'social', 'privacy', 'sharing', 'security', 'wearables']
  	}
  	suggest.push item

  	item = {
  		"title" => 'tech trends - #2',
  		"keywords" => ['bitcoin', 'streaming', 'messaging', 'glass', 'tablets']
  	}
  	suggest.push item

  	item = {
  		"title" => 'top websites - media',
  		"keywords" => ['nytimes', 'buzzfeed', 'wsj', 'blogger', 'cnn', 'huffington post']
  	}
  	suggest.push item

  	item = {
  		"title" => 'top websites - india',
  		"keywords" => ['flipkart', 'india times']
  	}
  	suggest.push item

  	item = {
  		"title" => 'top websites - tech',
  		"keywords" => ['apple', 'google', 'yahoo', 'microsoft', 'facebook', 'twitter']
  	}
  	suggest.push item

  	item = {
  		"title" => 'top websites - ecommerce',
  		"keywords" => ['ebay', 'amazon', 'paypal', 'craigslist']
  	}
  	suggest.push item

  	item = {
  		"title" => 'top govt agencies in usa',
  		"keywords" => ['nsa', 'dhs', 'dod', 'doj', 'epa', 'fda', 'fema']
  	}
  	suggest.push item

  	item = {
  		"title" => 'top programming languages',
  		"keywords" => ['php', 'ruby', 'python', 'node.js', 'c++', 'Objective-C']
  	}
  	suggest.push item

  	item = {
  		"title" => 'rise of the functional programming languages',
  		"keywords" => ['scala', 'haskell', 'go', 'scheme']
  	}
  	suggest.push item

  	item = {
  		"title" => 'top programming frameworks',
  		"keywords" => ['rails', 'express', 'django', 'sinatra']
  	}
  	suggest.push item

  	item = {
  		"title" => 'version control',
  		"keywords" => ['svn', 'git', 'mercurial']
  	}
  	suggest.push item

  	item = {
  		"title" => 'illicit drugs',
  		"keywords" => ['adderall', 'psilocybin', 'LSD', 'marijuana', 'cocaine']
  	}
  	suggest.push item

  	item = {
  		"title" => 'political issues - #1',
  		"keywords" => ['terrorism', 'shooting', 'evolution', 'drones']
  	}
  	suggest.push item

  	item = {
  		"title" => 'political issues - gov',
  		"keywords" => ['socialism','capitalism','communism']
  	}
  	suggest.push item

  	item = {
  		"title" => 'political issues - energy',
  		"keywords" => ['wind', 'solar', 'coal', 'nuclear', 'oil']
  	}
  	suggest.push item

  	item = {
  		"title" => 'political issues - domestic issues #1',
  		"keywords" => ['healthcare','abortion','torture','marijuana','racism']
  	}
  	suggest.push item

  	item = {
  		"title" => 'political issues - domestic issues #2',
  		"keywords" => ['taxes','racism','guns', 'gay', 'police']
  	}
  	suggest.push item

    item = {
      "title" => 'political issues - countries',
      "keywords" => ['thailand','darfur','vietnam','afghanistan','iraq', 'iran']
    }
    suggest.push item

    item = {
      "title" => 'startups - remember 2008?',
      "keywords" => ['digg', '23andme', 'admob', 'bittorrent', 'linkedin', 'slide']
    }
    suggest.push item

    item = {
      "title" => 'startups - remember 2010?',
      "keywords" => ['instagram', 'quora', 'Chatroulette']
    }
    suggest.push item

    item = {
      "title" => 'startups - remember 2012?',
      "keywords" => ['kickstarter','medium','circa', 'clear', '42floors']
    }
    suggest.push item

    item = {
      "title" => 'investor celebrities',
      "keywords" => ['paul graham','david cohen',  'mark cuban', 'mark suster', 'tim ferris', 'fred wilson']
    }
    suggest.push item

    item = {
      "title" => 'VCs',
      "keywords" => ['brad feld','fred wilson','marc andreessen', 'chris dixon']
    }
    suggest.push item

    item = {
      "title" => 'startup celebrities',
      "keywords" => ['ashton kutcher', 'justin timberlake', 'alexis ohanian' ]
    }
    suggest.push item

    item = {
      "title" => 'tech luminaries',
      "keywords" => ['bill gates','steve jobs', 'mark zuckerberg', 'larry page', 'larry ellison']
    }
    suggest.push item

    item = {
      "title" => 'rise of the whistleblowers',
      "keywords" => ['snowden','assange','manning']
    }
    suggest.push item

  	@suggest = Array.new
  	suggest.each do |item|
  		keywords = item['keywords']
  		item['url'] = 'loading/'+keywords.join(',').gsub(' ','+')
  		item['desc'] = ''+keywords.join(' vs. ')
  		@suggest.push item
  	end

  	@suggest

  end
end
