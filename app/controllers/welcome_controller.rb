class WelcomeController < ApplicationController
  require 'barby'
  require 'chunky_png'
  require 'barby/barcode/code_128'
  require 'barby/outputter/png_outputter'

  def index
    @posts = Post.all
  end

  def editor

  end

  def bar_code

  end

  def generate_bar_code
    barcode = Barby::Code128B.new('nazrul').to_png(margin: 3, height: 50)
    @barcode_image = Base64.encode64(barcode.to_s).gsub(/\s+/, "")
  end

end
