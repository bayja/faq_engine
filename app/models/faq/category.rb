# encoding: utf-8
module Faq
  class Category < ActiveRecord::Base
  	has_many :faqs
    # attr_accessible :title, :body
  end
end
