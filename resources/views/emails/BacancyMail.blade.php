@component('mail::message')
<h2>Hello JLT,</h2>
<p>{{ $body['message'] }}</p>

 
<img src="{{ $message->embed($body['image']) }}">

Best wishes,<br>
JLT Architechtural Design
@endcomponent