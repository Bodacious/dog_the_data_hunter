DogTheDataHunter
================

Adds a named scope named search to any of your models. Once included, you can search on any attribute you specify.


Example
=======

You have a User model and would like to be able to search all users by either their first name, last name or email address:

     class User < ActiveRecord::Base
     
       include DogTheDataHunter

       search_attributes :first_name, :last_name, :email, :exact_match => false

     end

This creates a named scope on the model called "search" which you can pass a string to:
    
    User.search("Gavin").all(:order => "last_name, first_name")

Options:

* <tt>:exact_match</tt> - Should the string that is passed be an exact match for the column data or simply LIKE it?


Copyright (c) 2010 [Gavin Morrice]("http://gavinmorrice.com"), released under the MIT license
