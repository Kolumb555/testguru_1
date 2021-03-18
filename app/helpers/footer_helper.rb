module FooterHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to author, "https://#{repo}/#{author}"
  end

  def thinknetica_path
    link_to 'thinknetica', 'https://thinknetica.com'
  end
end