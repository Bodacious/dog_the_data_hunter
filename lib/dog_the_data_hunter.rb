# DogTheDataHunter
# Add this module to lib/
# include it in any model which you would like to perform searches on.
# To include an attribute in the search query, simple call the search_attributes method like so:
#    class User < ActiveRecord::Base
#      
#      include DogTheDataHunter
#
#      search_attributes :first_name, :last_name, :exact_match => false
#
#    end
# 
# This creates a named scope on the model called "search" which you can pass a string to:
# User.search("Gavin").order("last_name, first_name")
# 
# Options:
# * :exact_match - Should the string that is passed be an exact match for the column data or simply LIKE it
module DogTheDataHunter



  def self.included(base)
    base.class_eval do

      def self.search_attributes(*args)
        if args.any?
          options = args.extract_options!
          # exact_match is false by default
          @@exact_match = !!options[:exact_match]
          @@search_attributes = args
        else
          @@search_attributes
        end
      end

      named_scope :search, lambda { |crit| 
        {:conditions => lambda { search_query_string(crit) }.call}
      }

      def self.search_query_string( crit )
        string_array = []
        search_attributes.each do |att|
          string_array << "#{table_name}.#{att} #{ @@exact_match ? "= \"#{crit}\"" : "LIKE \"%#{crit}%\"" }"
        end
        string_array.join(" OR ")
      end

    end

  end

end
