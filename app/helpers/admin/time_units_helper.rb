module Admin::TimeUnitsHelper
  include AdminHelper
 
  def complex_date_select(form_builder, field_name, show_end=true, options={})
    field_name_str = field_name.to_s
    field_type = field_name_str.sub(/_id$/, '')
    intercalary = options[:intercalary].to_s unless options[:intercalary].blank?
    
    if options[:collection].nil?
      collection = field_type.classify.constantize.options
      collection_from_model = true
    else
      collection = options[:collection]
      collection_from_model = false
    end
    
    certainty_field_name = (field_type+"_certainty_id").to_sym
    html = ""
    html += "<p>"
    html += "<div class='complex-date-certainty-wrapper'>"
    html += form_builder.label field_name, "Certainty:"
    html += form_builder.collection_select certainty_field_name, Certainty.options, :id, :name, {}, :onchange => ("toggle_end_date(this, '#{get_object_name_for(form_builder)}_#{field_type}_end_wrapper')" if show_end)
    html += "</div>"
    html += "<div class='complex-date-field-wrapper'>"
    html += form_builder.label field_name, (options[:text] || field_type.humanize.titleize)+":"
    if collection_from_model
      html += form_builder.collection_select field_name, collection, :id, options[:collection_text_method] || :name, :include_blank => true
    else
      html += form_builder.select field_name, collection, :include_blank => true
    end
    unless intercalary.blank?
      intercalary_collection = "intercalary_#{intercalary}".classify.constantize.find(:all)
      html += form_builder.collection_select "intercalary_#{intercalary}_id", intercalary_collection, :id, :name, :include_blank => true
    end
    html += "</div>"
    
    if show_end
      end_field_name = (field_name_str =~ /_id$/ ? field_name_str.sub(/_id$/, "_end_id") : field_name_str + "_end").to_sym
      html += "<div id='#{get_object_name_for(form_builder)}_#{field_type}_end_wrapper' class='complex-date-end-wrapper'#{" style='display:none;'" if form_builder.object[end_field_name].blank?}>"
      html += form_builder.label end_field_name, "To:"
      if collection_from_model
        html += form_builder.collection_select end_field_name, collection, :id, :name, :include_blank => true
      else
        html += form_builder.select end_field_name, collection, :include_blank => true
      end
      unless intercalary.blank?
        intercalary_collection = "intercalary_#{intercalary}".classify.constantize.find(:all)
        html += form_builder.collection_select "intercalary_#{intercalary}_end_id", intercalary_collection, :id, :name, :include_blank => true
      end
      html += "</div>"
    end
    
    html += "</p>"
    
    html
  end
  
  def complex_date_text_field(form_builder, field_name, show_end=true, options={})
    field_name_str = field_name.to_s
    field_type = field_name_str
    
    certainty_field_name = (field_type+"_certainty_id").to_sym
    html = ""
    html += "<p>"
    html += "<div class='complex-date-certainty-wrapper'>"
    html += form_builder.label field_name, "Certainty:"
    html += form_builder.collection_select certainty_field_name, Certainty.options, :id, :name, {}, :onchange => ("toggle_end_date(this, '#{get_object_name_for(form_builder)}_#{field_type}_end_wrapper')" if show_end)
    html += "</div>"
    html += "<div class='complex-date-field-wrapper'>"
    html += form_builder.label field_name, (options[:text] || field_type.humanize.titleize)+":"
    html += form_builder.text_field field_name
    #html += form_builder.text_field field_name, ({:value => form_builder.object[field_name]} unless form_builder.object.nil?)
    html += "</div>"
    
    if show_end
      end_field_name = (field_name_str =~ /_id$/ ? field_name_str.sub(/_id$/, "_end_id") : field_name_str + "_end").to_sym
      html += "<div id='#{get_object_name_for(form_builder)}_#{field_type}_end_wrapper' class='complex-date-end-wrapper'#{" style='display:none;'" if form_builder.object[end_field_name].blank?}>"
      html += form_builder.label end_field_name, "To:"
      html += form_builder.text_field end_field_name
      html += "</div>"
    end
    
    html += "</p>"
    
    html
  end

  def complex_date_fields(field_html, certainty_html, end_html=nil)
    html = ""
    html += "<p>"
    html += "<div class='complex-date-field-wrapper'>"
    html += "</div>"
    html += "<div class='complex-date-certainty-wrapper'>"
    html += "</div>"
    unless end_html.nil?
      html += end_html
    end
    html += "</p>"
  end
  
  def complex_date_display_field(complex_date, field_name, show_end=true, options={})
    field_name_str = field_name.to_s
    field_type = field_name_str
    
    display_field_name = (field_name_str =~ /_id$/ ? field_name_str.sub(/_id$/, "") : field_name_str).to_sym
    field_value = complex_date.send(display_field_name)
	
    certainty_field_name = ("#{display_field_name}_certainty").to_sym
    html = ""
    html += "<div class='row'>"
    html += "<label>#{(options[:text] || field_type.humanize.titleize)}</label>"
    html += "<span>"
    html += field_value.send(options[:collection_text_method] || :to_s) unless field_value.nil?
    if show_end
      end_field_name = (field_name_str =~ /_id$/ ? field_name_str.sub(/_id$/, "_end_id") : field_name_str + "_end").to_sym
      end_field_name_str = end_field_name.to_s
      display_end_field_name = (end_field_name_str =~ /_id$/ ? end_field_name_str.sub(/_id$/, "") : end_field_name_str).to_sym
      end_field_value = complex_date.send(display_end_field_name)
      html += "<span#{" style='display:none;'" if complex_date[end_field_name].blank?}>"
      html += " to "
      html += end_field_value.send(options[:collection_text_method] || :to_s) unless end_field_value.nil?
      html += "</span>"
    end
    certainty_value = complex_date.send(certainty_field_name)
    html += " (#{certainty_value})" unless certainty_value.nil? || certainty_value.to_s.eql?("Certain")
    
    html += "</div>"
    
    html
  end
    
  def date_options_for(field_name)
    field_name = field_name.to_sym
    options = case field_name
      when :month then (1..12).to_a
      when :gregorian_day then (1..31).to_a
      when :tibetan_day then (1..30).to_a
      when :hour then (0..23).to_a
      when :minute then (1..60).to_a
      else nil
    end
    if options.nil?
      options = []
    else
      options.collect!{|o| [o,o]}
    end
    options
  end
  
  def get_object_name_for(form_builder)
    form_builder.object_name.gsub(/\]$/, '').gsub(/\[|\]/, '_')
  end
  
  def format_minute(minute)
    "%02d" % minute
  end

  def stylesheet_files
    super + ['complex_dates']
  end  
end