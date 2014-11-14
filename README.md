arabic_stemmer
==============

Lightweight to stem Arabic words 

This small gem allows you to stem Arabic words i.e. to remove the common suffixes and prefixes.
It is a lightweight stemmer.

Examples
المعلمون => معلم
المدرسة => مدرسة
الأجهزة => اجهزة

Installation
============

Add this line to your application's Gemfile:

    gem 'arabic_stemmer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arabic_stemmer

Usage
=====

word = "المعلومن"
result = ArabicStemmer.to_arabic_stem(word)

Contributing
============

1. Fork it ( https://github.com/shuaibzahda/arabic_stemmer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
6. Please ensure all unit tests pass. To run them user: rake test
