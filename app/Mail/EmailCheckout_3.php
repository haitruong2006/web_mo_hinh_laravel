<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class EmailCheckout_3 extends Mailable
{
    use Queueable, SerializesModels;
    public $sentData;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($sentData)
    {
        //
        $this->sentData = $sentData;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from('truongngo.050902@gmail.com', 'From Truong')->subject('Thông tin đơn hàng của bạn - TRUMMOHINH.COM')->replyto('truongngo.050902@gmail.com', 'Hai Truong')->view('users.layout.page.emails.EmailCheckout_3', ['sentData' => $this->sentData]);
    }
}
