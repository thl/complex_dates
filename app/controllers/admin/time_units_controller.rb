class Admin::TimeUnitsController < ResourceController::Base
  
  belongs_to :altitude, :category_feature, :description, :feature_geo_code, :feature_name, :feature_object_type, :feature_relation, :feature, :shape
  
  before_filter :collection

  destroy.wants.html { redirect_to polymorphic_url([:admin, object.dateable]) }
 
  def index
    @time_units = TimeUnit.find(:all)
  end
  
  def show
    @time_unit = TimeUnit.find(params[:id])
  end
  
  def new
    @time_unit = @parent_object.time_units.new
  end
  
  def edit
    @time_unit = TimeUnit.find(params[:id])
  end
  
  def create
    @time_unit = TimeUnit.new(params[:time_unit])
    if @time_unit.is_range
      @time_unit.start_date.save
      @time_unit.end_date.save
    else
      @time_unit.date.save
    end
    if @time_unit.save
      flash[:notice] = 'Date successfully created.'
    end
    redirect_to polymorphic_url([:admin, @time_unit.dateable, @time_unit])
  end
  
  def update
    @time_unit = TimeUnit.find(params[:id])
    @time_unit.update_attributes params[:time_unit]
    if @time_unit.save
      flash[:notice] = 'Date successfully updated.'
    end
    redirect_to polymorphic_url([:admin, @time_unit.dateable, @time_unit])
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
    render :partial => "admin/#{date_model.tableize}/edit"
  end
  
  protected
  
  def parent_association
    @parent_object ||= parent_object
    parent_object.time_units # ResourceController needs this for the parent association
  end
  
  def collection
    @parent_object ||= parent_object
    if parent?
      TimeUnit.send(:with_scope, :find=>{:conditions=>['dateable_id = ? AND dateable_type = ?', @parent_object.id, @parent_object.class.base_class.to_s]}) do
        @collection = TimeUnit.search(params[:filter], :page=>params[:page])
      end
    else
      @collection = TimeUnit.search(params[:filter], :page=>params[:page])
    end
  end  
  
end