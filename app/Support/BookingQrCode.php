<?php

namespace App\Support;

use App\Models\Booking\Booking;
use Endroid\QrCode\Builder\Builder;
use Endroid\QrCode\ErrorCorrectionLevel;
use Endroid\QrCode\Writer\SvgWriter;

final class BookingQrCode
{
    /**
     * SVG markup for embedding in the receipt (scannable summary + link to this receipt).
     */
    public static function receiptSvg(Booking $booking): string
    {
        $receiptNo = str_pad((string) $booking->id, 6, '0', STR_PAD_LEFT);
        $payload = implode("\n", [
            'Vacation Rental — Booking receipt',
            'Receipt #'.$receiptNo,
            $booking->hotel_name.' / '.$booking->room_name,
            'Guest: '.$booking->name,
            'Total: $'.number_format((float) $booking->price, 2),
            route('bookings.receipt', $booking->id, true),
        ]);

        $result = (new Builder(writer: new SvgWriter()))->build(
            data: $payload,
            size: 180,
            margin: 4,
            errorCorrectionLevel: ErrorCorrectionLevel::Medium,
            writerOptions: [
                SvgWriter::WRITER_OPTION_EXCLUDE_XML_DECLARATION => true,
            ],
        );

        return $result->getString();
    }
}
