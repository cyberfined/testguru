module HeaderHelper
  def welcome_link(user)
    url = if user.admin?
            :admin_tests
          else
            :tests
          end
    link_to("Welcome, #{user.first_name} Guru", url)
  end

  def badges_link(user)
    url = if user.admin?
            :admin_badges
          else
            :badges
          end
    link_to('Badges', url)
  end
end
