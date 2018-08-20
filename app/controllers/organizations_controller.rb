# frozen_string_literal: true

class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = current_user.organizations
  end

  # rubocop:disable Style/EmptyMethod
  # GET /organizations/1
  # GET /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end
  # rubocop:enable Style/EmptyMethod

  # POST /organizations
  # POST /organizations.json
  # This method smells of :reek:DuplicateMethodCall
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  # This method smells of :reek:DuplicateMethodCall
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @organization = Organization.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def organization_params
    permited_params = params.require(:organization).permit(:name,
                                                           :organization_form_id,
                                                           activities_attributes: %i[id activity_type_id taxation_form_id _destroy])
    permited_params['activities_attributes'].transform_values! do |activity_attributes|
      activity_attributes.merge(user_id: current_user.id)
    end
    permited_params
  end
end
