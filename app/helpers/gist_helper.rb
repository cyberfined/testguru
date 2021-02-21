module GistHelper
  def gist_link(gist)
    link_to(gist.git_hash, gist.url, rel: 'nofollow', target: '_blank')
  end
end
