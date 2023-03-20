class Todo < ApplicationRecord
    
  enum :status, [:CREATED, :IN_PROGRESS, :COMPLETE, :CANCELLED]
  enum :priority, [:LOW, :MEDIUM, :HIGH]

  validates :title, presence: true, length: {minimum: 5, maximum:25}
  validate :check_title

  def check_title
    if !title.include?('.')
      errors.add(:title, "Title must contain '.' character")
    end
  end

end
