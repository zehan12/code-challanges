module Api
    module V1
        class ChallengesController < ApplicationController
            before_action :set_challenge, only: [:show, :update, :destroy]

            # GET /api/v1/challenges
            def index
                # show all challenges
                @challenges = Challenge.all
                render json: @challenges
            end

            # POST /api/v1/challenges
            def create
                # create single challenge
                @challenge = Challenge.new(challenge_params)
                if @challenge.save
                    render json: {
                        message: "Challenge added successfully",
                        data: @challenge
                    }
                else
                    render json: {
                        message: "Failed to add challenge",
                        data: @challenge.errors
                    }, status: :unprocessable_entity
                end
            end

            # GET /api/v1/challenges/:id
            def show
                # show single challenge
                if @challenge
                    render json: {
                        message: "Challenge found",
                        data: @challenge
                    }
                else
                    render json: {
                        message: "Challenge not found"
                    }, status: :not_found
                end
            end

            # PUT/PATCH /api/v1/challenges/:id
            def update
                # update single challenge
                if @challenge.update(challenge_params)
                    render json: {
                        message: "Challenge updated successfully",
                        data: @challenge
                    }
                else
                    render json: {
                        message: "Failed to update challenge",
                        data: @challenge.errors
                    }, status: :unprocessable_entity
                end
            end

            # DELETE /api/v1/challenges/:id
            def destroy
                # delete single challenge
                if @challenge.destroy
                    render json: {
                        message: "Challenge deleted successfully"
                    }
                else
                    render json: {
                        message: "Failed to delete challenge",
                        data: @challenge.errors
                    }, status: :unprocessable_entity
                end
            end

            private

            def set_challenge
                @challenge = Challenge.find_by(id: params[:id])
                unless @challenge
                    render json: {
                        message: "Challenge not found"
                    }, status: :not_found
                end
            end

            def challenge_params
                params.require(:challenge).permit(:title, :description, :start_date, :end_date)
            end
        end
    end
end
