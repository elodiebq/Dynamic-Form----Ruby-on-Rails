class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def new
		 @product = Product.new(product_type_id: params[:product_type_id])
	end

	def create
    	@product = Product.new(product_params)
	    if @product.save
	      redirect_to @product, notice: 'Product was successfully created.'
	    else
	      render 'new'
	    end
  	end



  	def show
  		@product = Product.find(params[:id])
  	end

  	def edit
  		@product = Product.find(params[:id])
  		#render plain: @product.inspect

  	end

  	def update
  		@product = Product.find(params[:id])
	    if @product.update_attributes(product_params)
	      redirect_to @product, notice: 'Product was successfully updated.'
	    else
	      render 'edit'
	    end
  	end

  	def destroy
	    @product = Product.find(params[:id])
	    @product.destroy
	    redirect_to products_path
  	end

	private
	        def product_params
	            params.require(:product).permit!#(:name, :price, :product_type_id, product_type_attributes: [fields: []])
	        end



end
