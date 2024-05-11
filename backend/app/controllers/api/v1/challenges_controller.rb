module Api
    module V1
        class ChallengesController < ApplicationController
            # GET api/v1/challenges
            def index
                # show all challenges
                @challenges = Challenge.all
                render json: @challenges
            end

            def create
                # create single challenges
            end

            def show
                # show single challenges
            end

            def update
                # update single challenges
            end

            def destroy
                # delete single challenges
            end
    
        end
    end
end