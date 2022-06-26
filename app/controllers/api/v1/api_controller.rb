class Api::V1::ApiController < ApplicationController
  rescue_from ActiveRecord::ActiveRecordError, with: :return_500
  rescue_from ActiveRecord::RecordInvalid, with: :return_422
  rescue_from ActiveRecord::RecordNotFound, with: :return_404
  rescue_from ActiveRecord::ConnectionNotEstablished, with: :return_503

  private
  def return_404
    render status: 404, json: { "error": "Object not found" }
  end
 
  def return_422(exception)
    render status: 422, json: { "error": exception }
  end

  def return_503
    render status: 503, json: { "error": "Connection Refused" }
  end

  def return_500
    render status: 500, json: { "error": "Something went wrong" }
  end
end