@extends('layouts.admin')

@section('content')


<div class="row">
    <div class="col-md-4">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Hotels</h5>
          <!-- <h6 class="card-subtitle mb-2 text-muted">Bootstrap 4.0.0 Snippet by pradeep330</h6> -->
          <p class="card-text">number of hotels: {{ $hotelsCount }}</p>
         
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Rooms</h5>
          
          <p class="card-text">number of rooms: {{ $roomsCount }}</p>
          
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Admins</h5>
          
          <p class="card-text">number of admins: {{ $adminsCount }}</p>
          
        </div>
      </div>
    </div>
  </div>

  <div class="row mt-3">
    <div class="col-md-6">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Bookings</h5>
          <p class="card-text mb-2">Total bookings: {{ $bookingsCount }}</p>
          <a href="{{ route('bookings.all') }}" class="btn btn-primary btn-sm">Manage bookings</a>
          <p class="card-text small text-muted mb-0 mt-2">Open a booking and use <strong>Receipt</strong> to view or print a payment receipt.</p>
        </div>
      </div>
    </div>
  </div>

  @endsection