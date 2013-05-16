module ApplicationHelper
  def image_tag(source, options={})
    source = "#" if source.blank?
    super(source, options)
  end
end
