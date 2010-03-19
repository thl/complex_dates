class TimeUnitsController < ApplicationController
  
  def index
    @time_units = GregorianDate.find(:all)
  end
  
  def show
    @time_unit = TimeUnit.find(params[:id])
    if @time_unit.point_range == "Point"
      @date = @time_unit.get_point_date
      render :template => "time_units/show_specific_date"
    else
      @dates = @time_unit.get_range_dates
      render :template => "time_units/show_range_dates"
    end
  end
  
  def new
    @time_unit = TimeUnit.new
  end
  
  def edit
    @time_unit = TimeUnit.find(params[:id])
    if @time_unit.point_range == "Point"
      @date = @time_unit.get_point_date
      @partial = @time_unit.date_type == "Tibetan" ? "time_units/tibetan_point" : "time_units/gregorian_point"
    else
      @date = @time_unit.get_range_date
      @partial = @time_unit.date_type == "Tibetan" ? "time_units/tibetan_range" : "time_units/gregorian_range"
    end  
    render :template => "time_units/edit"
  end
  
  def create
    @time_unit = TimeUnit.new(params[:time_unit])
        respond_to do |format|
          if @time_unit.save 
            if params[:type] == 'tibetan_point'
            @time_unit.create_tibetan_date(params[:tibetan_date])
            @time_unit.save
            elsif params[:type] == 'gregorian_point'
              @time_unit.create_gregorian_date(params[:gregorian_date])
              @time_unit.save
            elsif params[:type] == 'tibetan_range'
              @time_unit.tibetan_range_dates.create(params[:tibetan_range_start])
              @time_unit.tibetan_range_dates.create(params[:tibetan_range_end].merge!({:start_range => false}))
              @time_unit.save
            else
              @time_unit.gregorian_range_dates.create(params[:start_date])
              @time_unit.gregorian_range_dates.create(params[:end_date].merge!({:start_range => false}))
              @time_unit.save
            end
            flash[:notice] = 'Project was successfully created.'
            format.html { redirect_to(@time_unit) }
            format.xml  { render :xml => @time_unit, :status => :created, :location => @time_unit }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => @time_unit.errors, :status => :unprocessable_entity }
          end
        end
      
  end
  
  def update
    @time_unit = TimeUnit.find(params[:id])
    render :text => @time_unit.to_json and return
    @time_unit.attributes = params[:time_unit]

    if @time_unit.save
      flash[:notice] = "Time Unit was successfully updated"
      redirect_to :action => "show", :id => @time_unit
    else
      #render :text => 'error'
    end
  end
  
  def get_date
    if params[:date_type] == 'Tibetan' and params[:point_range] == 'Point'
      render :update do |page|
        page.replace_html  'dates', :partial => 'tibetan_point'
        page['submit_button'].show()
      end
    elsif params[:date_type] == 'Tibetan' and params[:point_range] == 'Period'
      render :update do |page|
       page.replace_html  'dates', :partial => 'tibetan_range'
       page['submit_button'].show()
      end
    elsif params[:date_type] == 'Gregorian' and params[:point_range] == 'Point'
      render :update do |page|
       page.replace_html 'dates', :partial => 'gregorian_point'
       page['submit_button'].show()
      end
    elsif params[:date_type] == 'Gregorian' and params[:point_range] == 'Period'
      render :update do |page|
       page.replace_html 'dates', :partial => 'gregorian_range'
       page['submit_button'].show()
      end
    end
    
  end
  
end
