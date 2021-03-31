module FooterHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to author, "https://#{repo}/#{author}", target: 'blank'
  end

  def thinknetica_path
    link_to 'Учебный проект в онлайн-школе Thinknetica', 'https://thinknetica.com', target: 'blank'
  end
end