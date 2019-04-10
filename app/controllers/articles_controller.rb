class ArticlesController < ApplicationController
  def show
    # Itemモデルのfindメソッドを使用して、パラメータの値に一致するidのデータを検索している
    # 取得したデータを@itemというインスタンス変数にセットする
    @articles = Article.find(params[:id])
  end
  def index
    @articles = Article.all
  end  

  def new
    @articles = Article.new
  end

  def create
    @articles = Article.new(articles_params)

    # 上の行はインスタンスを作っただけ。saveメソッドで保存しないと、消える。
    @articles.save

    # saveの後にshow(商品詳細ページ)に飛ぶ設定をします。
    # これを設定しないと、プログラムが行き場をなくしてエラーが起きます。
    redirect_to @articles

    # redirect_to "/items"
    # だとindexページにリダイレクトする
  end

private
  def article_params
    params.require(:articles).permit(:name, :price, :seller, :description, :email, :image_url)
  end
end  