module Users
  class SearchUsersQuery
    def self.call(users = User.all, search_param, current_user_id)
      results = (first_name_matches(users, search_param) +
                last_name_matches(users, search_param) +
                full_name_matches(users, search_param) +
                email_matches(users, search_param)).uniq
      return nil if results.blank?

      results_without_current_user(results, current_user_id)
    end

    def self.first_name_matches(users, param)
      users.where("first_name LIKE ?", "%#{param}%")
    end

    def self.last_name_matches(users, param)
      users.where("last_name LIKE ?", "%#{param}%")
    end

    def self.full_name_matches(users, param)
      users.where("CONCAT_WS(' ', first_name, last_name) LIKE ?", "%#{param}%")
    end

    def self.email_matches(users, param)
      users.where("email LIKE ?", "%#{param}%")
    end

    def self.results_without_current_user(users, current_user_id)
      users.reject { |user| user.id == current_user_id }
    end
  end
end
