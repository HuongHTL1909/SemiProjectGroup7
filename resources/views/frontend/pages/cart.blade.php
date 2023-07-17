@extends('frontend.layouts.master')
@section('title', 'Cart')
@section('main-content')

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Cart</h4>
                        <div class="breadcrumb__links">
                            <a href="{{ route('home') }}">Home Page</a>
                            <a href="{{route('product-grids')}}">Shop</a>
                            <span>Your cart</span>
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
                                    <th>Product Name</th>
                                    <th>Quantity</th>
                                    <th>Into money</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <form action="{{ route('cart.update') }}" method="POST">
                                    @csrf
                                    @if (Helper::getAllProductFromCart())
                                        @foreach (Helper::getAllProductFromCart() as $key => $cart)
                                            <tr>
                                                @php
                                                    $photo = explode(',', $cart->product['photo']);
                                                @endphp
                                                <td class="product__cart__item">
                                                    <div class="product__cart__item__pic">
                                                        <img src="{{ $photo[0] }}" style="height: 100px"
                                                            alt="{{ $photo[0] }}">
                                                    </div>
                                                    <div class="product__cart__item__text">
                                                        <h6>{{ $cart->product['title'] }}</h6>
                                                        <h5>{{ number_format($cart['price']),2 }}$</h5>
                                                    </div>
                                                </td>
                                                <td class="quantity__item">
                                                    <div class="quantity">
                                                        <div class="pro-qty-2">
                                                            <input type="text" name="quant[{{ $key }}]"
                                                                value="{{ $cart->quantity }}">
                                                            <input type="hidden" name="qty_id[]"
                                                                value="{{ $cart->id }}">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="cart__price">{{ number_format($cart['amount']), 2 }}$</td>
                                                <td class="cart__close"><a
                                                        href="{{ route('cart-delete', $cart->id) }}"><i
                                                            class="fa fa-close" style="height: 40px"></i></a></td>
                                            </tr>
                                        @endforeach
                                    @endif

                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn">
                                <a href="{{ route('product-grids') }}">Continue shopping</a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn update__btn">
                                <button class="primary-btn" type="submit">Update Cart</button>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="cart__discount">
                        <h6>Discount code</h6>
                        <form action="{{ route('coupon-store') }}" method="POST">
                            @csrf
                            <input type="text" name="code" placeholder="Enter discount code">
                            <button type="submit">Apply</button>
                        </form>
                    </div>
                    <div class="cart__total">
                        <h6>Add shopping cart</h6>
                        <ul>
                            @php
                                $total_amount = Helper::totalCartPrice();
                                if (session()->has('coupon')) {
                                    $total_amount = $total_amount - Session::get('coupon')['value'];
                                }
                            @endphp
                            <li data-price="{{ Helper::totalCartPrice() }}">Provisional
                                <span>{{ number_format(Helper::totalCartPrice()),2 }}$</span></li>
                            @if (session()->has('coupon'))
                                <li class="coupon_price" data-price="{{ Session::get('coupon')['value'] }}">Sale
                                    <span>{{ number_format(Session::get('coupon')['value']),2 }}$</span></li>
                            @endif
                            @if (session()->has('coupon'))
                                <li>Total payment <span>{{ number_format($total_amount), 2 }}$</span></li>
                            @else
                                <li>Total payment <span>{{ number_format($total_amount), 2 }}$</span></li>
                            @endif
                        </ul>
                        <a href="{{ route('checkout') }}" class="primary-btn">Pay</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
@endsection
@push('scripts')
    <script src="{{ asset('frontend/js/nice-select/js/jquery.nice-select.min.js') }}"></script>
    <script src="{{ asset('frontend/js/select2/js/select2.min.js') }}"></script>
    <script>
        $(document).ready(function() {
            $("select.select2").select2();
        });
        $('select.nice-select').niceSelect();
    </script>
    <script>
        $(document).ready(function() {
            $('.shipping select[name=shipping]').change(function() {
                let cost = parseFloat($(this).find('option:selected').data('price')) || 0;
                let subtotal = parseFloat($('.order_subtotal').data('price'));
                let coupon = parseFloat($('.coupon_price').data('price')) || 0;
                // alert(coupon);
                $('#order_total_price span').text('$' + (subtotal + cost - coupon).toFixed(2));
            });

        });
    </script>
@endpush
