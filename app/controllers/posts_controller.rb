class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: "DESC")
    # @post = Post.find(1)
    # @post = "これはコントローラーで定義したインスタンス変数を確認するための文字列です"
  end



  def create
    # Post.create(content: params[:content]) 
    # ここの（）括弧って引数の括弧だったのね
    # redirect_to action: :index
    post = Post.create(content: params[:content], checked: false)
    render json:{ post: post }
  end

 def checked
  post = Post.find(params[:id])
  if post.checked 
    post.update(checked: false)
  else
    post.update(checked: true)
  end

  item = Post.find(params[:id])
  render json: { post: item }
 end
end