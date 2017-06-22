class Job < ApplicationRecord

  def hide!
    self.is_hidden = true
    self.save
  end

  def public!
    self.is_hidden = false
    self.save
  end
end
