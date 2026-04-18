<?php

namespace App\Rules;

use Closure;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Support\Facades\Http;

class Recaptcha implements ValidationRule
{
    /**
     * SSL verify option for Guzzle: true, false, or path to cacert.pem.
     * Windows/XAMPP often lacks a system CA bundle (cURL error 60); we ship bootstrap/cacert.pem.
     */
    protected function sslVerify(): bool|string
    {
        $path = config('services.recaptcha.ca_bundle');
        if (is_string($path) && $path !== '' && is_readable($path)) {
            return $path;
        }

        $bundled = base_path('bootstrap/cacert.pem');
        if (is_readable($bundled)) {
            return $bundled;
        }

        return true;
    }

    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        $secret = config('services.recaptcha.secret');
        if (empty($secret)) {
            return;
        }

        $response = Http::withOptions(['verify' => $this->sslVerify()])
            ->asForm()
            ->post('https://www.google.com/recaptcha/api/siteverify', [
                'secret' => $secret,
                'response' => $value,
                'remoteip' => request()->ip(),
            ]);

        if (! $response->successful() || ! ($response->json('success') ?? false)) {
            $fail(__('The reCAPTCHA verification failed. Please try again.'));
        }
    }
}
