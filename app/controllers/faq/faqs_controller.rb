# encoding: utf-8

class Faq::FaqsController < ApplicationController
	before_filter :from_engine_mark

	def index
    @cates = Faq::Category.all
    @faqs = Faq::Faq.in_category_id(params[:category_id]).order(:position)#.paginate(:page => params[:page], :per_page => 10)
	end

	def from_engine_mark
		@is_from_engine = true
	end
end