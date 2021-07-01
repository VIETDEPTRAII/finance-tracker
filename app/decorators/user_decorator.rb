class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    return 'Anonymous' if first_name.blank? && last_name.blank?

    "#{first_name} #{last_name}"
  end
end
