@extends('frontend.layouts.master')
@section('main-content')
@section('title','Contact')


    <!-- Map Begin -->
    <div class="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.863926013346!2d105.74382421087363!3d21.038129987375783!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454b9739f199f%3A0xc810aaa208b3e02e!2zQ2FvIMSQ4bqzbmcgQW5oIFF14buRYyBCVEVDIEZQVA!5e0!3m2!1svi!2s!4v1691624047518!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></ifrsrc=>" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" height="500" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
    </div>
    <!-- Map End -->

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="contact__text">
                        <div class="section-title">
                            <h2>Contact KSHOP</h2>
                            <p>Support from 9:00 to 21:00</p>
                        </div>
                        <ul>
                            @php
                                $settings=DB::table('settings')->get();
                            @endphp
                            @foreach($settings as $key=>$setting)
                            <li>
                                <h4>Email: {{$setting->email}}</h4>
                                <h4>Phone: {{$setting->phone}}</h4>
                                <h4>Address: {!! $setting->address!!}</h4>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="contact__form">
                        <form action="{{route('contact.submit')}}" method="POST">
                            @csrf
                            <div class="row">
                                <div class="col-lg-6">
                                    <input type="text" name="name" placeholder="Your full name">
                                </div>
                                <div class="col-lg-6">
                                    <input type="text" name="subject" placeholder="Topic">
                                </div>
                                <div class="col-lg-6">
                                    <input type="text" name="email" placeholder="Email">
                                </div>
                                <div class="col-lg-6">
                                    <input type="text" name="phone" placeholder="Phone">
                                </div>
                                <div class="col-lg-12">
                                    <textarea name="message" placeholder="Content you want to send"></textarea>
                                    <button type="submit" class="site-btn">Send to KSHOP</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->
@endsection
