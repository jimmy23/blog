require 'sanitize'

module ApplicationHelper
	def clean_html(html)
    if html.nil? || html.empty?
      return ''
    end
    # sanitize_config = { elements: %w(font span div p ol ul li blockquote sub sup i u strike s del img br b strong em a), attributes: { 'img' => ['src', 'alt'], 'a' => ['href','target','rel','card'] } }
    Sanitize.fragment(html, Sanitize::Config::RELAXED)
  end
end
