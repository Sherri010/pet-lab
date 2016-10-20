class Owner < ActiveRecord::Base

  validates :first_name, presence: true , length: {maximum:255}
  validates :last_name, presence: true , length: {maximum:255}
  validates :email, presence: true , length: {maximum:255},uniqueness: true
  validates :phone, presence:true
  before_validation  :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    if phone
      self.phone = phone.delete("(),-.")
      self.phone= phone[1..phone.length-1] if phone.start_with?("1")
  end
end
end
