class WelcomeController < ApplicationController

caches_page :index

  def get_chart(inputArray,grain)

  	puts grain
  	if grain == 'yearly'
	  	format = "%Y"
	else
	  	format = "%Y/%m"
	end

  	#build global array of months
	months =  Array.new
  	inputArray.each do | inputArgumentSet | 
  		posts = inputArgumentSet['posts']
  		keyword = inputArgumentSet['keyword']

		#prepare data for graph
		posts.each do |post|
			month = post['time'].strftime(format)
			months.push month
		end
	end
	months = months.uniq{|x| x}
	months = months.sort

	series = {}
	#build the xValues for each chart line
  	inputArray.each  do | inputArgumentSet |
  		posts = inputArgumentSet['posts']
  		keyword = inputArgumentSet['keyword']

  		hashResults = {}
  		months.each do | key, value |
  			hashResults[key] = 0
  		end

		posts.each do |post|
			month = post['time'].strftime(format)
			if hashResults[month] == nil
				hashResults[month] = 0
			end
			hashResults[month] = hashResults[month] + 1
		end
		
		xValues = Array.new
			hashResults.sort.map do |key,value|
			xValues.push value
		end

		series[keyword] = xValues

  	end

  	#label formatting for large # of labels, format = y/m
  	monthsLabels = Array.new
  	months.each do | month |
  		if (month.include? '/01') != true && format == "%Y/%m"
  			month = month[5..7]
  		end
  		monthsLabels.push month
  	end

	#build graph object
	chart = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Hacker News Posts Over Time (source: hntrends.com)")
	  f.xAxis(:categories => monthsLabels, :labels => {:rotation => -45, :style => { :fontSize => '8px' } } )

	  series.each do | keyword, xValues | 
		  f.series(:name => keyword, :yAxis => 0, :data => xValues)
	  end

	  #f.yAxis fAxisInputs

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"line"})
	end

	return chart

  end

  def get_search_results(keyword, page_num)

	return Rails.cache.fetch 'keyword/'+keyword, expires_in: 1430.minutes do

  	#set up asari gem
	asari = Asari.new("hnposts3-cn5dy6h35krsag5mxkc377kwra") 
	asari.aws_region = "us-west-2"
	Asari.mode = :production

	#make the cloudsearch api request
	cloudsearch_results = asari.search keyword, :page_size => 10000, :page => page_num, :return_fields => ["id", "time","title","by"]


	posts = Array.new
	cloudsearch_results.each do |item|
		response = item[1]

		new_result_obj = {}
		new_result_obj['created_timestamp'] = response['time']
		new_result_obj['time'] = DateTime.strptime(response['time'],'%s')
		new_result_obj['time_ui'] = new_result_obj['time'].strftime("%m/%d/%Y %I:%M %p")
		new_result_obj['title'] = response['title']
		new_result_obj['title_ui'] = response['title']
		if new_result_obj['title_ui']  == 'null' then
			new_result_obj['title_ui'] = 'comment'
		end
		new_result_obj['text'] = response['text']
		new_result_obj['created'] = response['created']
		new_result_obj['by'] = response['by']
		new_result_obj['url'] = "https://news.ycombinator.com/item?id=" + response['id'];
		posts.push new_result_obj
	end

	#pull some metadata
	total_entries = cloudsearch_results.total_entries
	page_size = cloudsearch_results.page_size

	#enumerate the results and prepare them for presentation

	num_pages = total_entries / page_size
	if num_pages = 0 
		num_pages = 'all'
	end

	posts = posts.sort_by{ |item| item['created_timestamp'] }
	resultsObj = {
		"keyword" => keyword,
		"posts" => posts,
		"num_pages" => num_pages,
		"total_entries" => total_entries,
		"page_size" => page_size,
	}

	resultsObj
	end


  end

	def redir
		@search_values = params[:k];

		# build list of valid keywords
		keywords = Array.new
		counter = 0
		keyword_limit = 6
		if @search_values != nil then
			@search_values.each do | i, search_value |
				if search_value != "" and search_value != nil and counter < keyword_limit
					counter = counter + 1
					keywords.push search_value
				end
			end
		end


		return redirect_to "/loading/"+URI.encode(keywords.join(',').gsub(' ','+'))
	end

  def index
  	
	# get search value get param
  	if params[:keywords] != nil
  		args_as_array = params[:keywords].split(',');
  		@search_values = {}
  		counter=0
  		args_as_array.each do | arg |
  			@search_values[counter] = arg
  			counter = counter + 1
  		end
  	else
		@search_values = params[:k];
	end
	
	#get slice param
  	if params[:slice] != nil
  		@slice_at = params[:slice].to_s.gsub(/\D/, '').to_i
  	else
  		@slice_at = 1000
  	end

	#get grains param
	@grains = ['monthly','yearly']
  	if params[:grain] != nil
  		@grain = params[:grain]
  	else
  		@grain = 'monthly'
  	end


	# build list of valid keywords
	keywords = Array.new
	counter = 0
	keyword_limit = 6
	if @search_values != nil then
		@search_values.each do | i, search_value |
			if search_value != "" and search_value != nil and counter < keyword_limit
				counter = counter + 1
				keywords.push search_value.gsub('+',' ')
			end
		end
	end

	#validate keyword list
	if keywords.length == 0 then
		@search_results = Array.new
		@keywords = Array.new
		return true
	end

	#get page param
	@page_num = params[:page];
	if @page_num == nil then
		@page_num = 1
	end
	@next_page_num = @page_num + 1

	#build search_results
	@keywords = keywords
	chartInput = Array.new
	@search_results = Array.new
	keywords.each do | keyword |
		Rails.logger.debug  keyword + " : " + Time.new.min.to_s + ":" + Time.new.sec.to_s
		these_results = self.get_search_results(keyword, @page_num )
		Rails.logger.debug  "/" + keyword + " : " + Time.new.min.to_s + ":" + Time.new.sec.to_s
		@search_results.push these_results
		chartInput.push these_results
	end

	#build chart
	@chart=self.get_chart(chartInput,@grain)

	#build uri
	@uri = '/search/'+params[:keywords]+'/'+@grain.to_s+'/'+@slice_at.to_s

	#results view'
	@grains
	@grain
	@slice_at
	@keywords
	@chart
	@search_results 
	@page_num
	@next_page_num
  end
end
