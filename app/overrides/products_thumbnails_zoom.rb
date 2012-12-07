# <a class="zoomThumbActive" href="javascript:void(0);" rel="{gallery: 'gal1', smallimage: './imgProd/SMALLIMAGE1.jpg',largeimage: './imgProd/LARGEIMAGE1.jpg'}">
#   <img src="imgProd/thumbs/THUMBIMG1.jpg">
# </a>                      
Deface::Override.new(:virtual_path => "spree/products/_thumbnails",
                      :name => 'replace-thumbnail-link-with-joom-link',
                      :replace => "code[erb-loud]:contains('link_to')") do
                        "<div id='product_info_thumbnails'><a href=\"<%= @product.images.first.attachment.url(:large) %>\" rel=\"{gallery: 'product-gallery', smallimage: '<%= i.attachment.url(:large) %>', largeimage: '<%= i.attachment.url(:large) %>'}\" class=\"<%= (i.id == @product.images.first.id) ? 'zoomThumbActive' : '' %> \" > <%= image_tag(i.attachment.url(:small), :class => 'product_info_thumbnail') %></a></div>"
                      end