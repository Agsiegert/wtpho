class User < ActiveRecord::Base
  validates :full_name, presence: { message: "Please enter your full name." }
  validates :display_name, allow_blank: true, length: { in: 2..32, message: "Display name should be between 2 and 32 characters, please." }
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password_confirmation, presence: true, if: "!password.nil?"
  has_secure_password

  has_many :orders

  def admin?
    self.admin_status
  end

  def current_order
    orders.last
  end

  def past_orders
    orders.where("id != ?", current_order.id)
  end

  def total_spent
    orders.completed.map(&:subtotal).reduce(:+) || 0
  end
end
