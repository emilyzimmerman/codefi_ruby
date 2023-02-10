class BlogsController < ApplicationController
    def index
        @blogs = Blog.all
    end

    def new
        @blog = Blog.new
    end

    def edit 
        #localhost:3000/blogs/:id?edit

        @blog = Blog.find(params[:id])
    end

    def create
        @blog = Blog.new(title: params[:blog][:title], description: params[:blog][:description])

        if @blog.save
            flash[:message] = "Blog was successfully saved"
            redirect_to blogs_path
            #if blog was saved then redirect to index page
        else
            render :new, status: :unprocessable_entity
        end
        #otherwise re-render edit
    end

    def show
        @blog = Blog.find(params[:id])
    end

    def update
       @blog = Blog.find(params[:id])

       if @blog.update(title: params[:blog][:title], description: params[:blog][:description])
        
        flash[:message] = "Blog was succesfully saved"
        redirect_to blog_path(@blog)

       else 

        render :edit, status: :unprocessable_entity
       end
    end

    def destroy
        #delete blog
       @blog = Blog.find(params[:id])

       @blog.destroy

       redirect_to blogs_path
    end

end