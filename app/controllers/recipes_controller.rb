class RecipesController < ApplicationController
    include Rails.application.routes.url_helpers;

    def index
        @recipes = Recipe.unscoped.order("id ASC").all;
    end

    def create
        @recipeName = params[:recipe][:recipe_name];
        @prepTime = params[:recipe][:prep_time];
        @cookTime = params[:recipe][:cook_time];
        @img = params[:recipe][:image];
        @steps = '';
        @ingredients = '';

        for parameter in params[:recipe] do
            paramStringS = parameter.to_s;
            if paramStringS =~ /Step_/
                paramSplit = paramStringS.split(',');
                instructions = paramSplit[1].tr('"]', '');
                instructions[0] = '';
                if !instructions.blank?
                    @steps = @steps + instructions + ", ";
                end
            end
        end

        for parameter in params[:recipe] do
            paramStringI = parameter.to_s;
            # puts paramString;
            if paramStringI =~ /Ingredient_/
                paramSplit = paramStringI.split(',');
                items = paramSplit[1].tr('"]', '');
                items[0] = '';
                if !items.blank?
                    @ingredients = @ingredients + items + ", ";
                end
            end
        end

        puts @img;

        @recipe = Recipe.new(name: @recipeName, p_time: @prepTime, c_time: @cookTime, steps: @steps, ingredients: @ingredients, image: @img);
        @recipe.save();

        redirect_to @recipe;
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
        @recipeName = params[:recipe][:name];
        @prepTime = params[:recipe][:p_time];
        @cookTime = params[:recipe][:c_time];
        @img = params[:recipe][:image];
        @steps = '';
        @ingredients = '';

        for parameter in params[:recipe] do
            paramStringS = parameter.to_s;
            if paramStringS =~ /Step_/
                paramSplit = paramStringS.split(',');
                instructions = paramSplit[1].tr('"]', '');
                instructions[0] = '';
                if !instructions.blank?
                    @steps = @steps + instructions + ", ";
                end
            end
        end

        for parameter in params[:recipe] do
            paramStringI = parameter.to_s;
            # puts paramString;
            if paramStringI =~ /Ingredient_/
                paramSplit = paramStringI.split(',');
                items = paramSplit[1].tr('"]', '');
                items[0] = '';
                if !items.blank?
                    @ingredients = @ingredients + items + ", ";
                end
            end
        end
        @recipe.update(name: @recipeName, p_time: @prepTime, c_time: @cookTime, steps: @steps, ingredients: @ingredients, image: @img);
        redirect_to @recipe;
    end

    def destroy
        @recipe = Recipe.find(params[:id]);
        @recipe.destroy;
        redirect_to recipes_path;
    end

end
