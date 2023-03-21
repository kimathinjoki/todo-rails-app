class TodosController < ApplicationController
    # protect_from_forgery with: :null_session


    


    def todos
        email = session[:email]
        if email 
        render json: Todo.all
        else
            render json: {messadge: "Not authorized"}, status: :not_found
        end
    end

    def create 
        # add todo in DB.

        todo = Todo.create(todo_params)
        if todo.valid?
            render json: todo
        else
            render json: todo.errors
        end

    end

    def update
        todo = Todo.find_by(id: params[:id])
        todo.update(todo_params)


    end

    def destroy
        todo = Todo.find_by(id: params[:id])
        todo.destroy
        head :no_content
    end

    private

    def todo_params
        params.permit(:title, :description, :priority, :status)
    end


end
