module ApplicationHelper
  def link_with_filter_to(path, *args, &block)
    if path.start_with?('/')
      if path.include?('?')
        path += '&'
      else
        path += '?'
      end
    end
    raw_ranking_configuration.each do |key, value|
      path += "#{key}=#{URI.encode_www_form_component(value.to_s)}&"
    end
    link_to(path, *args, &block)
  end
end
