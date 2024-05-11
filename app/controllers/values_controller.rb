class ValuesController < ApplicationController
  before_action :set_value, only: %i[ show edit update destroy ]

  # GET /values or /values.json
  def index
    @values = Value.all
  end

  def set_value
    @value = Value.find(params[:id])
  end

  # GET /values/1 or /values/1.json
  def show
  end

  # GET /values/new
  def new
    @value = Value.new
  end

  def set_range_value
    image_id = params[:values][:image_id]
    value = params[:values][:value]
    id = Value.select('id').where(image_id: image_id, user_id: current_user.id)
    if id.empty?
      @value = Value.new(image_id: image_id, user_id: current_user.id, value: value)
      @value.save
    else
      Value.update(id, value: value)
    end
    Image.refresh_value(image_id)
    redirect_to work_url(image: 0, counter: params[:values][:counter], theme: params[:values][:theme])
  end

  # GET /values/1/edit
  def edit
  end

  # POST /values or /values.json
  def create
    @value = Value.new(value_params)

    respond_to do |format|
      if @value.save
        format.html { redirect_to value_url(@value), notice: "Value was successfully created." }
        format.json { render :show, status: :created, location: @value }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /values/1 or /values/1.json
  def update
    respond_to do |format|
      if @value.update(value_params)
        format.html { redirect_to value_url(@value), notice: "Value was successfully updated." }
        format.json { render :show, status: :ok, location: @value }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /values/1 or /values/1.json
  def destroy
    @value.destroy!

    respond_to do |format|
      format.html { redirect_to values_url, notice: "Value was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def value_params
      params.require(:value).permit(:user_id, :image_id, :value)
    end
end
