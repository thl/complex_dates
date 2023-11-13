class Admin::TimeUnitsController < ResourceController::Base
  
  belongs_to :altitude, :category_feature, :description, :feature_geo_code, :feature_name, :feature_object_type, :feature_relation, :feature, :shape
  
  before_action :collection

  destroy.wants.html { redirect_to polymorphic_url(helpers.stacked_parents) }
 
  def index
    @time_units = TimeUnit.all
  end
  
  def show
    @time_unit = TimeUnit.find(params[:id])
  end
  
  def new
    @time_unit = parent_object.time_units.new
    @time_unit.dateable_type = parent_object.class.name
  end
  
  def edit
    @time_unit = TimeUnit.find(params[:id])
  end
  
  def create
    @time_unit = TimeUnit.new(time_unit_params)
    if @time_unit.is_range
      @time_unit.start_date.save
      @time_unit.end_date.save
    else
      @time_unit.date.save
    end
    if @time_unit.save
      flash[:notice] = 'Date successfully created.'
    end
    redirect_to polymorphic_url(helpers.stacked_parents)
  end
  
  def update
    @time_unit = TimeUnit.find(params[:id])
    @time_unit.update(time_unit_params)
    if @time_unit.save
      flash[:notice] = 'Date successfully updated.'
    end
    redirect_to polymorphic_url(helpers.stacked_parents)
  end
  
  def new_form
    date_model = params[:date_model]
    @time_unit = TimeUnit.new
    # These two attributes are necessary for setting the time_unit[calendar_id]
    # and time_unit[is_range] fields in the _edit partial.
    @time_unit.calendar_id = date_model.constantize.new.calendar_id
    @time_unit.is_range = date_model.constantize.new.is_range
    if @time_unit.is_range
      @time_unit.start_date = ComplexDate.new
      @time_unit.end_date = ComplexDate.new
    else
      @time_unit.date = ComplexDate.new
    end
    @date_table = date_model.tableize
    # renders new_form.js.erb
  end
  
  protected
  
  def parent_association
    parent_object.time_units # ResourceController needs this for the parent association
  end
  
  def collection
    if parent?
      @collection = TimeUnit.where(['dateable_id = ? AND dateable_type = ?', parent_object.id, parent_object.class.base_class.to_s]).page(params[:page])
    else
      @collection = TimeUnit.page(params[:page])
    end
  end  
  
  private
  def time_unit_params
    date_attributes = [:year_end, :minute_certainty_id, :year, :day_of_week_certainty_id, :season_certainty_id,
    :hour_end, :month, :day_end, :season_end_id, :hour_certainty_id, :day_certainty_id, :year_certainty_id,
    :hour, :day, :minute_end, :time_of_day_end_id, :day_of_week_id, :time_of_day_certainty_id,
    :time_of_day_id, :month_certainty_id, :month_end, :day_of_week_end_id, :season_id, :minute,
    :calendrical_certainty_id, :rabjung_certainty_id, :element_certainty_id, :animal_id, :intercalary_day_id,
    :intercalary_month_end_id, :intercalary_day_end_id, :gender_certainty_id, :element_id, :rabjung_id,
    :rabjung_end_id, :animal_certainty_id, :calendrical_id, :gender_id, :intercalary_month_id]
    
    params.require(:time_unit).permit(:is_range, :is_range, :calendar_id, :frequency_id, :date_attributes,
    :end_date_attributes, :start_date_attributes, :start_date_id, :end_date_id, :date_id, :dateable_type, :dateable_id,
    date_attributes: date_attributes, end_date_attributes: date_attributes, start_date_attributes: date_attributes)
  end
end
