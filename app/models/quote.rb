class Quote < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name

  scope :ordered, -> { order(id: :desc) }


  after_create_commit -> { broadcast_prepend_later_to "quotes", partial: "quotes/quote", locals: { quote: self } }
  after_update_commit -> { broadcast_replace_later_to "quotes", partial: "quotes/quote", locals: { quote: self } }
  after_update_commit -> { broadcast_replace_later_to self, partial: "quotes/quote_details", locals: { quote: self }, target: "quote_details_#{self.id}" }

  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to "quotes" }
  after_destroy_commit -> { broadcast_remove_to "quotes" }



end
