module Api
    module V1
        class ChallengesController < ApplicationController
            # GET /api/v1/challenges
            def index
                # show all challenges
                @challenges = Challenge.all
                render json: @challenges
            end

            # POST /api/v1/challenges
            def create
                # create single challenges
                challenge = Challenge.new(challenge_params)
                if challenge.save
                    render json: {
                        message: "Challenge added successfully",
                        data: challenge
                    }
                else
                    render json: {
                        message: "Failed to add challenge",
                        data: challenge.errors                        
                    }, status: :internal_server_error
                end
            end

            # GET /api/v1/challenges/:id
            def show
                # show single challenges
                @challenge = Challenge.find_by(id: params[:id]) 
                if @challenge
                    render json: {
                        message: "challenge found",
                        data: @challenge
                    } 
                else
                    render json: {
                        message: "Challenge not found",
                    }, status: :not_found    
                end     
            end

            # PUT/PATCH /api/v1/challenges/:id
            def update
                # update single challenges
                @challenge = Challenge.find(params[:id])
                if @challenge.update(challenge_params)
                    render json: {
                        message: "Challenge update succesfully",
                        data: @challenge
                    } 
                else
                    render json: {
                        message: "Failed to update Challenge",
                    }, status: :internal_server_error   
                end   
            end

            # DELETE /api/v1/challenges/:id
            def destroy
                # delete single challenges
                @challenge = Challenge.find(params[:id])
                if @challenge.destroy
                    render json: {
                        message: "Challenge delete succesfully",
                    } 
                else
                    render json: {
                        message: "Failed to delete Challenge",
                    }, status: :internal_server_error
                end
            end

            private

            def challenge_params
                params.require(:challenge).permit(:title, :description, :start_date, :end_date)
            end
        end
    end
end