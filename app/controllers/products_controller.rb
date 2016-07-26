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
			redirect_to products_path, notice: "Product Updated Successfully"
		else
			render "edit"
		end
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)

		if @product.save
			redirect_to products_path, notice: "Product Created Successfully"
		else
			render "new"
		end
	end

	def destroy
		@product.destroy

		redirect_to products_path, notice: "Product Deleted Successfully"
	end


	private

	def set_product
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:name, :quantity, :price, images_attributes: [:photo, :id, :_destroy])
	end
end
