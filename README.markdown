DogTheDataHunter
================

Adds a named scope to your models called search.
Can search on any attribute you specify.

Example
=======

Add this module to lib/
include it in any model which you would like to perform searches on.
To include an attribute in the search query, simple call the search_attributes method like so:

     class User < ActiveRecord::Base
     
       include DogTheDataHunter

       search_attributes :first_name, :last_name, :exact_match => false

     end

This creates a named scope on the model called "search" which you can pass a string to:
User.search("Gavin").order("last_name, first_name")

Options:

* <tt>:exact_match</tt> - Should the string that is passed be an exact match for the column data or simply LIKE it?


Copyright (c) 2010 [Gavin Morrice]("http://gavinmorrice.com"), released under the MIT license
