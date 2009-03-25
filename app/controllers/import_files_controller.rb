class ImportFilesController < ApplicationController

  def index
    @import_files = ImportFile.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @import_files }
    end
  end

  def show
    @import_file = ImportFile.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @import_file }
    end
  end

  def new
    @import_file = ImportFile.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @import_file }
    end
  end

  def edit
    @import_file = ImportFile.find(params[:id])
  end

  def create
    @import_file = ImportFile.new(params[:import_file])
    respond_to do |format|
      if @import_file.save
        flash[:notice] = 'ImportFile was successfully created.'
        format.html { redirect_to(@import_file) }
        format.xml  { render :xml => @import_file, :status => :created, :location => @import_file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @import_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @import_file = ImportFile.find(params[:id])
    respond_to do |format|
      if @import_file.update_attributes(params[:import_file])
        if @import_file.update_hook_param
          if @import_file.make_lead and @import_file.save
            flash[:notice] = " Inserted #{ @import_file.leads.length } new leads! "
          else
            flash[:warning] = "Unable to insert leads. Please check formatting of CSV file"
          end
        end
        format.html { redirect_to(@import_file) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @import_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @import_file = ImportFile.find(params[:id])
    @import_file.destroy
    respond_to do |format|
      format.html { redirect_to(import_files_url) }
      format.xml  { head :ok }
    end
  end
end
