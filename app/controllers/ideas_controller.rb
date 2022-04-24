class IdeasController < ApplicationController
  def index
    ideas = Idea.all
    render json: ideas, each_serializer: IdeaSerializer, include: [:category]
  end

  def create
    category = Category.new(category_params)
    idea = Idea.new(idea_params)
    if Category.exists?(name: params[:category][:name])
      idea_body.save
    else
      render json: ideas
    end
  end

  def idea_params
    params.require(:idea).permit(:body)
  end
end
