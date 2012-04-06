class CreateFaqFaqs < ActiveRecord::Migration
  def change
    create_table :faq_faqs do |t|
    	t.integer 	:category_id
			t.integer		:position	
    	t.string		:question
    	t.text			:answer

      t.timestamps
    end
  end
end
