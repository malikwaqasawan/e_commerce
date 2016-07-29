class ProductsController < ApplicationController

	before_action :set_product, only: [:show, :edit, :update, :destroy]

	def index
		@products = Product.all
	end

	def show
	end

	def edit
	end

	def update
		if @product.update_attributes(product_params)
			alert(:success, 'Product Updated Successfully')
			redirect_to products_path
		else
			render 'edit'
		end
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)

		if @product.save
		  alert(:success,'Product Created Successfully')
			redirect_to products_path
		else
			render 'new'
		end
	end

	def destroy
		@product.destroy
		alert(:success,'Product Deleted Successfully')
		redirect_to products_path
	end

	private

	def set_product
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:name, :quantity, :price, images_attributes: [:photo, :id, :_destroy])
	end

end