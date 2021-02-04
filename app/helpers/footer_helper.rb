module FooterHelper
  def github_url(author, repo)
    link_to(repo, "https://github.com/#{author}/#{repo}", rel: 'nofollow', target: '_blank')
  end

  def current_year
    Time.current.year
  end
end
