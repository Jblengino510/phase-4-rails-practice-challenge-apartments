class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        lease = lease.create!(lease_params)
        render json: lease, status: :created
    end

    def destroy
        lease = find_lease
        lease.destroy
        head :no_content
    end

    private

    def find_lease
        Lease.find(params[:id])
    end

    def lease_params
        params.permit(:rent)
    end
    
    def render_not_found_response
        render json: { error: "Student not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
