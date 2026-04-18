<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Receipt #{{ $booking->id }} — Booking</title>
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f5f6f8; color: #222; }
        .receipt-wrap { max-width: 640px; margin: 2rem auto; }
        .receipt-card {
            background: #fff;
            border: 1px solid #e0e4ea;
            border-radius: 8px;
            padding: 2rem;
            box-shadow: 0 2px 12px rgba(0,0,0,.06);
        }
        .receipt-header { border-bottom: 2px solid #343a40; padding-bottom: 1rem; margin-bottom: 1.5rem; }
        .receipt-brand { font-size: 1.35rem; font-weight: 700; letter-spacing: .02em; }
        .receipt-meta { font-size: .875rem; color: #6c757d; }
        .receipt-row { display: flex; justify-content: space-between; padding: .5rem 0; border-bottom: 1px solid #eee; }
        .receipt-row:last-of-type { border-bottom: none; }
        .receipt-label { color: #6c757d; font-size: .9rem; }
        .receipt-total {
            margin-top: 1.25rem;
            padding-top: 1rem;
            border-top: 2px dashed #dee2e6;
            font-size: 1.25rem;
            font-weight: 600;
        }
        .no-print { margin-bottom: 1rem; }
        .receipt-qr { text-align: center; margin-top: 1.5rem; padding-top: 1.25rem; border-top: 1px dashed #dee2e6; }
        .receipt-qr svg { max-width: 180px; height: auto; }
        @media print {
            body { background: #fff; }
            .no-print { display: none !important; }
            .receipt-card { box-shadow: none; border: none; }
            .receipt-wrap { margin: 0; max-width: 100%; }
        }
    </style>
</head>
<body>
    <div class="container receipt-wrap">
        <div class="no-print">
            <a href="{{ route('bookings.all') }}" class="btn btn-outline-secondary btn-sm">&larr; Back to bookings</a>
            <button type="button" class="btn btn-primary btn-sm" onclick="window.print()">Print receipt</button>
        </div>

        <div class="receipt-card">
            <div class="receipt-header">
                <div class="receipt-brand">Vacation Rental</div>
                <div class="receipt-meta mt-2">Payment / booking receipt</div>
            </div>

            <p class="mb-3">
                <strong>Receipt #{{ str_pad((string) $booking->id, 6, '0', STR_PAD_LEFT) }}</strong><br>
                <span class="receipt-meta">Issued {{ now()->format('F j, Y g:i A') }}</span>
            </p>

            <div class="receipt-row">
                <span class="receipt-label">Guest name</span>
                <span>{{ $booking->name }}</span>
            </div>
            <div class="receipt-row">
                <span class="receipt-label">Email</span>
                <span>{{ $booking->email ?? '—' }}</span>
            </div>
            <div class="receipt-row">
                <span class="receipt-label">Phone</span>
                <span>{{ $booking->phone_number ?? '—' }}</span>
            </div>
            <div class="receipt-row">
                <span class="receipt-label">Hotel</span>
                <span>{{ $booking->hotel_name }}</span>
            </div>
            <div class="receipt-row">
                <span class="receipt-label">Room</span>
                <span>{{ $booking->room_name }}</span>
            </div>
            <div class="receipt-row">
                <span class="receipt-label">Check-in</span>
                <span>{{ $booking->check_in }}</span>
            </div>
            <div class="receipt-row">
                <span class="receipt-label">Check-out</span>
                <span>{{ $booking->check_out }}</span>
            </div>
            <div class="receipt-row">
                <span class="receipt-label">Nights</span>
                <span>{{ $booking->days }}</span>
            </div>
            <div class="receipt-row">
                <span class="receipt-label">Status</span>
                <span>{{ $booking->status }}</span>
            </div>

            <div class="receipt-total d-flex justify-content-between align-items-center">
                <span>Amount paid</span>
                <span>${{ number_format((float) $booking->price, 2) }}</span>
            </div>

            <div class="receipt-qr">
                <span class="receipt-label d-block mb-2">Scan for booking summary &amp; receipt link</span>
                {!! $qrSvg !!}
            </div>

            <p class="receipt-meta mt-4 mb-0 small">
                This document confirms the booking details on file. For questions, contact the property using the details on your confirmation email.
            </p>
        </div>
    </div>
</body>
</html>
