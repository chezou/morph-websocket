KyTea wrapper for ruby
==========================

2012/11/10 chezou

morph-websocket is a realtime morph analyzing web-app using websockets.
This program using Kytea as a morphological analyzer.

Requirements
-------------

- Kytea (0.4.2>=)
- Mykytea-ruby

KyTea is developed by KyTea Development Team

Detailed information of KyTea can be found at
http://www.phontron.com/kytea

Mykytea-ruby is ruby wrapper module for KyTea.


To use morph-websocket
--------------------------

First, install kytea and Mykytea-ruby.

Next, install dependent gems.

    $ bundle install --path vendor/bundler

Run,

    $ bundle exec ruby server.rb

Open index.html


License
--------------------
MIT License