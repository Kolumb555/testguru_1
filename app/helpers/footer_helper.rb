module FooterHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    "https://#{repo}/#{author}"
  end

  def thinknetica_path
    'https://thinknetica.com'
  end
end