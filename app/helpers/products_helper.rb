module ProductsHelper
  def lazy_image_tag(source, options={})
    options['data-src'] = asset_path(source)
    if options[:class].blank?
      options[:class] = 'lozad'
    else
      options[:class] = "lozad #{options[:class]}"
    end
    image_tag('dummy.jpg', options)
  end
end
