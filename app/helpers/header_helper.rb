module HeaderHelper
  def welcome_link(user)
    url = user.admin? :admin_tests : :tests
    link_to("Welcome, #{user.first_name} Guru", url)
  end

  def badges_link(user)
    url = user.admin? :admin_badges : :badges
    link_to('Badges', url)
  end
end
