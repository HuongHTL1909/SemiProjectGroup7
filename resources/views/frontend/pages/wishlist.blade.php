@extends('frontend.layouts.master')
@section('title', 'Favourite')
@section('main-content')
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Favorite products</h4>
                        <div class="breadcrumb__links">
                            <a href="{{ route('home') }}">Home Page</a>
                            <a href="{{ route('product-grids') }}">Shop</a>
                            <span>Favorite products</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if (Helper::getAllProductFromWishlist())
                                    @foreach (Helper::getAllProductFromWishlist() as $key => $wishlist)
                                        @php
                                            $photo = explode(',', $wishlist->product['photo']);
                                        @endphp
                                        <tr>
                                            <td class="product__cart__item">
                                                <div class="product__cart__item__pic">
                                                    <img src="{{$photo[0]}}"
                                                        alt="{{$photo[0]}}" style="height:10em">
                                                </div>
                                            </td>
                                            <td>{{$wishlist->product['title']}}</td>
                                            <td class="cart__price">${{number_format($wishlist['amount']),2}} </td>
                                            <td class="cart__close"><a href="{{route('wishlist-delete',$wishlist->id)}}"><i
                                                class="fa fa-close" style="height: 40px"></i></a></td>
                                        </tr>
                                    @endforeach
                                    @else
                                    <h3> No data</h3>
                                @endif
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
