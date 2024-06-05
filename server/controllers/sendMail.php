<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $data = json_decode(file_get_contents("php://input"), true);

    $emails = $data["emails"];
    $subject = $data["subject"];
    $body = $data["body"];

    if (!isset($data["emails"]) || !isset($data["subject"]) || !isset($data["body"])) {
        echo json_encode(["error" => "invalid input"]);
        http_response_code(400);
        exit;
    }

    $mail = new PHPMailer(true);

    try {
        // Server Settings
        $mail -> SMTPDebug = SMTP::DEBUG_SERVER;
        $mail -> isSMTP();
        $mail -> Host = "smtp.gmail.com";
        $mail -> SMTPAuth = true;
        $mail -> Username = $_ENV['SMTP_EMAIL'];
        $mail -> Password = $_ENV['SMTP_PASS'];
        $mail -> SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
        $mail -> Port = 465;

        // Sender
        $mail -> setFrom("pajunar0@gmail.com", "Mailer");
    
        // Recipients
        foreach ($emails as $email) {
            $mail -> addAddress($email);
        }
    
    
        // Content
        $mail -> isHTML(true);
        $mail -> Subject =  $subject;
        $mail -> Body = $body;
        $mail -> AltBody = "This is the body in lpain text for non HTML mail clients.";
    
        $mail -> send();
        echo json_encode(["message" => "Message has been sent"]);
    } catch (Exception $e) {
        echo "Message could not be sent. Mailer Error: {$mail -> ErrorInfo}";
    }
}

