# encoding: utf-8

module Faq
  class Faq < ActiveRecord::Base
    attr_accessible :category_id, :question, :answer
    belongs_to :category
    acts_as_list :scope => :category

	  def self.in_category_id(category_id)
	    if category_id.present?
	    	where(:category_id => category_id)
	    else
	    	where(:category_id => Category.first.id)
	    end
	  end

  end
end
