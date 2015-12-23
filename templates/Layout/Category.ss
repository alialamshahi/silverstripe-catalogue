
<% if Level(2) %>
$Breadcrumbs
<% end_if %>
<section class="jumbotron">
  <div class="container">
    <% with $MainPhoto %>
    <div class="col-md-12 jumbotron-bg" style="background-image:url($URL)">
      <% end_with %>
      <div class="row">
        <div class="col-md-6 col-md-offset-1">
          <h1>$Title</h1>
          $Introduction </div>
      </div>
    </div>
  </div>
</section>
<section id="products">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
        <h3 class="sub-title">محصولات این دسته</h3>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 text-center">
        <% if $EnabledChildren.exists %>
        <div class="catalogue-list"> <p>
          پالایش محصولات براساس
          </p>
          <div class="row">
            <div class="col-md-8 col-md-offset-2">
              <ul class="nav nav-pills">
                <% loop $EnabledChildren %>
                <li role="presentation"><a href="$Link">$Title</a></li>
                <% end_loop %>
              </ul>
            </div>
          </div>
        </div>
        <% end_if %>
      </div>
    </div>
    <% if $PaginatedAllProducts(9).exists %>
    <div class="row">
      <div class="grid">
        <% loop $PaginatedAllProducts(9) %>
        <div class="grid-item col-md-4 col-sm-6 <% if $FeaturedType.exists %><% if $FeaturedType=Popular %>popular<% end_if %><% if $FeaturedType=Discount %>sale<% end_if %><% if $FeaturedType=New %>new<% end_if %><% end_if %>"> <a href="$Link">
          <div class="item-content caption-normal">
            <% if $FeaturedType.exists %>
            <span class="ribbon"><i class="prowall-<% if $FeaturedType=Popular %>heart<% end_if %><% if $FeaturedType=Discount %>discount<% end_if %><% if $FeaturedType=New %>new<% end_if %>"></i></span>
            <% end_if %>
            <figure>
            <% with $SortedImages.First.CroppedImage(800,800) %>
            <img src="$URL" width="$Width" height="$Height" alt="" class="img-responsive" />
            <% end_with %>
            <figcaption class="purple">
              <h3>$Title</h3>
              <span>$StockID</span> </figcaption>
          </div>
          </a> </div>
        <% end_loop %>
      </div>
    </div>
    <% with $PaginatedAllProducts(9) %>
    <% if $MoreThanOnePage %>
    <div class="row">
      <div class="col-md-8 col-md-offset-2 pagination-container">
        <nav>
          <ul class="pagination">
            <% if $NotFirstPage %>
            <li> <a href="$PrevLink" aria-label="Previous"> <span aria-hidden="true">&laquo;</span> </a> </li>
            <% end_if %>
            <% loop $Pages %>
            <% if $CurrentBool %>
            <li><a href="$Link">$PageNum</a></li>
            <% else %>
            <% if $Link %>
            <li><a href="$Link">$PageNum</a></li>
            <% else %>
            <li><a href="#">...</a></li>
            <% end_if %>
            <% end_if %>
            <% end_loop %>
            <% if $NotLastPage %>
            <li> <a href="$NextLink" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a> </li>
            <% end_if %>
          </ul>
        </nav>
      </div>
    </div>
    <% end_if %>
    <% end_with %>
    <% end_if %>
  </div>
</section>