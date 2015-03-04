require 'pubnub'
require 'sinatra'

pubnub = Pubnub.new(publish_key: 'pub-c-736f5f42-db7b-44cb-8cf7-850a20a93363', subscribe_key: 'sub-c-eac810f0-c15d-11e4-b54a-0619f8945a4f')

def send_message(pubnub, message)
  pubnub.publish(channel: 'arduled',
                 message: message,
                 http_sync: true)
end

get '/' do
  erb :index, layout: :main_layout
end

post '/first_led' do
  send_message(pubnub, 'first_led')
  redirect to('/')
end

post '/second_led' do
  send_message(pubnub, 'second_led')
  redirect to('/')
end

post '/third_led' do
  send_message(pubnub, 'third_led')
  redirect to('/')
end
