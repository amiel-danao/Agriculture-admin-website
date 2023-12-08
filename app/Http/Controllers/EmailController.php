<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\BacancyMail;

class EmailController extends Controller
{
    public function sendEmail(Request $request)
    {
        // Validate request data
        $request->validate([
            'email' => 'required|email',
            'message' => 'required',
            'image' => 'required|string', // Assuming image is received as a base64 string
        ]);

        // Send email
        $email = $request->input('email');
        // $subject = $request->input('subject');
        $message = $request->input('message');
        $imageData = $request->input('image');

        $body = [
            'message'=>$message,
            'image'=>$imageData
        ];
 
        Mail::to($email)->send(new BacancyMail($body));

        // Mail::send([], [], function (Message $mail) use ($email, $subject, $message, $imageData) {
        //     $mail->to($email)
        //         ->subject($subject)
        //         ->html($this->composeEmailBody($message, $imageData), 'text/html')
        //         ->getHeaders() // Access the headers
        //         ->addTextHeader('Content-Transfer-Encoding', 'quoted-printable'); // Set the charset in the header
        // });

        return response()->json(['message' => 'Email sent successfully']);
    }

    private function composeEmailBody($message, $imageData)
    {
        // $imageSrc = 'data:image/png;base64,' . $imageData; // Change the mime type accordingly
        $embeddedImage = '<img src="' . $imageData . '" alt="Embedded Image">';

        return '<html><head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"></head><body>' . $message . '<br>' . $embeddedImage . '</body></html>';
    }
}