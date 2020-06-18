class TenantsController < ApplicationController
  
  set :views, "app/views/tenants"

  # display list of all tenants
  get '/tenants' do
      @tenants = Tenant.all
      erb :index
  end

  # create a tenant form
  get '/tenants/new' do
      @apartments = Apartment.all
      erb :new
  end

  # display a tenant
  get '/tenants/:id' do 
      @tenant = current_tenant
      erb :show
  end 

  #form for editing an existing apartment
  get '/tenants/:id/edit' do
      @apartments = Apartment.all
      @tenant = current_tenant
      erb :edit
  end

  #updating a tenant
  patch '/tenants/:id' do
      tenant = current_tenant
      tenant.assign_attributes(name: params[:name], apartment_id: params[:apartment_id])

      unless params[:apartment][:address].empty?
        new_apartment = Apartment.create(params[:apartment])
        tenant.apartment_id = new_apartment.id
 
      end
      tenant.save

      redirect "/tenants/#{tenant.id}"
  end

  # create a tenant
  post "/tenants" do
      tenant = Tenant.new(params[:tenant])

      unless params[:apartment][:address].empty?
          new_apartment = Apartment.create(params[:apartment])

          tenant.apartment_id = new_apartment.id
          # tenant.apartment = new_apartment
      end
      tenant.save

      redirect "/tenants/#{tenant.id}"
  end

  # finding an existing tenant
  def current_tenant
      Tenant.find(params[:id])
  end

end