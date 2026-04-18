
@extends('layouts.app')

@section('content')

<div class="hero-wrap js-fullheight" style="margin-top: -25px; background-image: url('{{ asset('assets/images/room-1.jpg') }}');">
    <div class="overlay"></div>
    <div class="container">
      <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
        <div class="col-md-12 ftco-animate">
            <h1 style="margin-left: 200px; " class="subheading">You Booked this Room Successfully</h1>
            <h1 class="mb-4"></h1>
          <p><a href="{{ route('home') }}" class="btn btn-primary">Go Home</a></p>
        </div>
      </div>
    </div>
  </div>
</div>

@endsection