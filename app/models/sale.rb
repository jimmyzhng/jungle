class Sale < ApplicationRecord

  # self.___ is a class method
  # This creates an Active Record Scope. This lets us take our query further
  # Eg. Sale.active.for_city('Toronto').any?

  # This would be the same as:
  # scope :active, -> {where("sales.starts_on < ? AND sales.ends_on >= ?", Date.current, Date.current).any?}
  def self.active
    where("sales.starts_on < ? AND sales.ends_on >= ?", Date.current, Date.current)
  end


  def finished?
    # Question mark methods imply boolean
    # Return is implicit
  ends_on < Date.current
  end

  def upcoming?
    # self is implied
    # This is a method call on itself 
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end
end
