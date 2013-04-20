#!/bin/env/ruby 
# -*- coding:utf-8 -*-

require 'em-websocket'
require 'Mykytea'

def show_tags(t)
  ret_str = ""
  t.each do |word|
    ret_str += word.surface + "\t"
    word.tag.each{|t1| t1.each{|t2| t2.each{|t3| ret_str += "/" + t3.to_s} ;ret_str +=  "\t"} ; ret_str += "\t"}
    ret_str += "<br>"
  end
  return ret_str.force_encoding("UTF-8")
end


Process.daemon(nochdir=true) if ARGV[0] == "-D"
puts "Initializing..."
connections = Array.new
model_path= "/usr/local/share/kytea/model.bin"
mk = Mykytea::Mykytea.new(model_path)

puts "Model loaded!"


EventMachine::WebSocket.start(:host => "0.0.0.0", :port => 51234) do |ws|
  ws.onopen{
    puts "connected"
    #ws.send "connected"
    connections.push(ws) unless connections.index(ws)
  }
  ws.onmessage{ |msg|
    #puts "recieved:" + msg
    msg = show_tags( mk.getTags(msg) )
    ws.send msg
    #puts msg
  }
  ws.onclose {puts "Connection closing"}
end
