$Breadcrumbs
<section id="products">
  <div class="container">
    <div class="row">
	<div class="col-md-6 product-gallery-container">
	<% if $Images.exists %>
        <div class="product-gallery" itemscope itemtype="http://schema.org/ImageGallery">
		<% loop $SortedImages %>
          <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject"> <a href="$URL" itemprop="contentUrl" data-size="{$Width}x{$Height}"> <img src="$URL" itemprop="thumbnail" alt="" /> </a>
            <figcaption itemprop="caption description"></figcaption>
          </figure>
		<% end_loop %>
        </div>
	<% end_if %>
        
        <!-- Root element of PhotoSwipe. Must have class pswp. -->
        <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true"> 
          
          <!-- Background of PhotoSwipe. 
         It's a separate element, as animating opacity is faster than rgba(). -->
          <div class="pswp__bg"></div>
          
          <!-- Slides wrapper with overflow:hidden. -->
          <div class="pswp__scroll-wrap"> 
            
            <!-- Container that holds slides. PhotoSwipe keeps only 3 slides in DOM to save memory. --> 
            <!-- don't modify these 3 pswp__item elements, data is added later on. -->
            <div class="pswp__container">
              <div class="pswp__item"></div>
              <div class="pswp__item"></div>
              <div class="pswp__item"></div>
            </div>
            
            <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
            <div class="pswp__ui pswp__ui--hidden">
              <div class="pswp__top-bar"> 
                
                <!--  Controls are self-explanatory. Order can be changed. -->
                
                <div class="pswp__counter"></div>
                <button class="pswp__button pswp__button--close" title="بستن (Esc)"></button>
                <button class="pswp__button pswp__button--share" title="به اشتراک گذاردن"></button>
                <button class="pswp__button pswp__button--fs" title="تمام صفحه"></button>
                <button class="pswp__button pswp__button--zoom" title="بزرگ‌نمایی/کوچک‌نمایی"></button>
                
                <div class="pswp__preloader">
                  <div class="pswp__preloader__icn">
                    <div class="pswp__preloader__cut">
                      <div class="pswp__preloader__donut"></div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                <div class="pswp__share-tooltip"></div>
              </div>
              <button class="pswp__button pswp__button--arrow--left" title="قبلی"> </button>
              <button class="pswp__button pswp__button--arrow--right" title="بعدی"> </button>
              <div class="pswp__caption">
                <div class="pswp__caption__center"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- /product-gallery-container -->
	  
      <div class="col-md-6">
        <div class="row">
          <div class="col-md-12 text-center">
            <h3 class="sub-title">$Title</h3>
            <ul class="list-unstyled product-specification">
              <% if $Dimension %><li>سایز محصول: $Dimension </li><% end_if %>
			  <% if $Material %><li>نوع جنس: $Material </li><% end_if %>
			  <% if $BaseColor %><li>رنگ: $BaseColor </li><% end_if %>
              <% if $Designer %><li>طراح: $Designer </li><% end_if %>
              <% if $StockID %><li>مدل محصول: $StockID </li><% end_if %>
            </ul>
            <div class="product-description">
              $Content
			  <div class="form">
                $Form
            </div>
            </div>
            <!-- /product-description --> 
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<%-- Related Products: Only loaded when added through the CMS --%>
<% if $RelatedProducts.exists %>
<section class="related-products-container">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
	  <h2><%t Catalogue.RelatedProducts "Related Products" %></h2>
	  
	  <div class="row">
	  <% loop $RelatedProducts %>
	  <div class="col-md-4 related-product-box">
	  <h3><a href="$Link">$Title</a></h3>
	  <a href="$Link">$SortedImages.First.CroppedImage(800,800)</a>
	  <% if $StockID %><p>مدل محصول: $StockID </p><% end_if %>
	  </div>
	  <% end_loop %>
	  </div>
	  
      </div>
    </div>
  </div>
</section>
<% end_if %>