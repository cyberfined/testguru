module FooterHelper
  def github_url(author, repo)
    link_to(repo, "https://github.com/#{author}/#{repo}")
  end

  def current_year
    Date.today.year
  end
end
