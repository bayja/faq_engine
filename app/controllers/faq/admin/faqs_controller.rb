# encoding: utf-8

class Faq::Admin::FaqsController < Admin::AdminsController
  before_filter :from_engine_mark
	before_filter :find_faq, :except => [:index, :new, :create, :sort]

  def index
    @cates = Faq::Category.all
    @faqs = Faq::Faq.in_category_id(params[:category_id]).order(:position)#.paginate(:page => params[:page], :per_page => 10)
  end
  
  def show
  end

  def new
    @faq = Faq::Faq.new
  end
  
  def create
    @faq = Faq::Faq.new params[:faq]
    if @faq.save
      redirect_to admin_faqs_path(:category_id => @faq.category_id)
      # redirect_to [:admin, :faqs]
    else
      render :action => "new"
    end
  end
  
  def edit
  end
  
  def update
    if @faq.update_attributes params[:faq]
      redirect_to [:admin, @faq]
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @faq.destroy
    redirect_to [:admin, :faqs]
  end
  
  def sort
    params[:faq].each_with_index do |id, index|
      Faq::Faq.update_all({:position => index+1}, {:id => id})
    end
    render :nothing => true
  end
  
  private
  
  def find_faq
    @faq = Faq::Faq.find params[:id]
  end

  def from_engine_mark
    @is_from_engine = true
  end
end

