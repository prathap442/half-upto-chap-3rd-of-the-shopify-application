class DashboardController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
	# Load past results in reverse order
	@contests = Contest.order("created_at desc")
	# Instantiate a new Contest so the form loads properly
	@contest = Contest.new
  end

  def create_contest
    @contest = Contest.new(contest_params)
    @contest.name = ("a".."z").to_a.sample(5).join("")
    #binding.pry
    # Store the name of the product for easier readability
      if contest_params[:product_id].present?
         @contest.product_id = contest_params[:product_id] 
      end
      respond_to do |format|
        if @contest.save
          # Pick a winner
          candidates = Order.candidate_list(params)
          binding.pry
          contest_results = ContestResults.new(candidates)

          # Save the winner        
          #@contest.update_attribute(:order_id, contest_results.results)

          format.html { redirect_to root_path, notice: "Contest Winner: <a href='#{order_path(@contest.order)}'>#{@contest.order.email}</a>" }
          format.json { render action: 'show', status: :created, location: @contest }

        else
          format.html { redirect_to root_path, alert: "Unable to create a Contest #{@contest.errors.full_messages.to_s}" }
          format.json { render json: @contest.errors, status: :unprocessable_entity }
        end
      binding.pry  
    end
   end
    private 
	def contest_params
     params[:contest] = params
     params[:name] = ("a".."z").to_a.sample(5).join("")
	   params.require(:contest).permit(:product_id, :start_date, :end_date, :max_results, :order_id)
	end
end
