require 'sinatra'

$result ||= nil
$number ||= nil

get '/' do
	erb :index
end

get '/uptime' do
	content_type :json
	{ status:"OK" }.to_json
end

post '/calculate' do
	$number = params[:number]
	$result = fibonacci(params[:number].to_i)
	redirect '/'
end

def fibonacci(number, store={})
	return 0 if number == 0
	return 1 if number <= 2
	return store[number] if store.has_key?(number)

	store[number] = fibonacci(number - 1, store) + fibonacci(number - 2, store)
	store[number]
end