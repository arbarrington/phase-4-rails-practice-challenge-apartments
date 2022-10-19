class TenantsController < ApplicationController
    before_action :set_tenant, only: [:show, :update, :destroy]

    def index
        render json: Tenant.all, status: :ok
    end

    def show
        render json: @tenant, status: :ok
    end
    
    private

    def set_tenant
        @tenant = Tenant.find(params[:id])
    end

    def tenant_params
        params.permit(:name, :age)
    end
end
