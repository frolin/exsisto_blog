module CustomHelpers
  def post_author
    Dir.glob('source/posts/*').collect { |name| File.basename(name).to_s }
    category
  end

  def categories
    blog.articles.collect { |article|
      article.metadata[:page]['category']
    }.uniq
  end

  def post_breadcrumbs(current_article)
    unless current_article.nil?
      category = current_article.metadata[:page]['category']
     end
     # title = current_article.title

     link_to "#{category}", category_path(category), class:'category'

    # category_link +
    #     content_tag(:span, '/', class: 'separator') +
    #     content_tag(:span, title.downcase, class:'breadrumb-title')
  end


  def author(current_article)
    unless current_article.nil?
      current_article.metadata[:page]['author']
    end
  end


  class SyntaxHighlighting < Redcarpet::Render::HTML
    def block_code(code, language)
      puts '!!!!'
      puts language

    end
  end


end