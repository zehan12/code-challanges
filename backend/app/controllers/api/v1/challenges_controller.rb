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
                challenge = Challenge.new(challenges_params)
                if challenge.save
                    render json: {
                        message: "Challenge added successfully",
                        data: challenge
                    }
                else
                    render json: {
                        message: "Failed to add challenge",
                        data: challenge.errors                        
                    }
                end
            end

            # GET /api/v1/challenges/:id
            def show
                # show single challenges
            end

            # PUT/PATCH /api/v1/challenges/:id
            def update
                # update single challenges
            end

            # DELETE /api/v1/challenges/:id
            def destroy
                # delete single challenges
            end

            private

            def challenges_params
                params.require(:challenge).permit(:title, :description, :start_date, :end_date)
            end
        end
    end
end