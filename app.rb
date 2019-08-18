require 'json'

require './memo.rb'
require './helpers.rb'

get '/' do
    redirect to '/dev'
end

get %r{/(.+)} do |page|
    @file = Memo.new(page)
    toc_file = File.expand_path('public/toc.json') 
    @toc = JSON.parse( File.read(toc_file), symbolize_names: true )
    
    haml :index
end
