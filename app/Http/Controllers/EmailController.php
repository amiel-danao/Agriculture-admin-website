<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class EmailController extends Controller
{
    public function sendEmail(Request $request)
    {
        // Validate request data
        $request->validate([
            'email' => 'required|email',
            'subject' => 'required',
            'message' => 'required',
            'image' => 'required|string', // Assuming image is received as a base64 string
        ]);

        // Send email
        $email = $request->input('email');
        $subject = $request->input('subject');
        $message = $request->input('message');
        $imageData = $request->input('image');

        Mail::send([], [], function ($mail) use ($email, $subject, $message, $imageData) {
            $mail->to($email)
                ->subject($subject)
                ->html($this->composeEmailBody($message, $imageData), 'text/html');
        });

        return response()->json(['message' => 'Email sent successfully']);
    }

    private function composeEmailBody($message, $imageData)
    {
        // $imageSrc = 'data:image/png;base64,' . $imageData; // Change the mime type accordingly
        $embeddedImage = '<img src="' . $imageData . '" alt="Embedded Image">';

        return $message . '<br>' . $embeddedImage;
    }
}
