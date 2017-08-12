<?php
/*
 * Script to check SoYouStart availability  based on http://www.tienle.com/2014/09-03/script-check-soyoustart-availability.html
 * to help see http://www.richzendy.org/2014/10/05/script-php-para-chequear-y-notificar-disponibilidad-de-servidores-en-soyoustart.html
 */
define('CHECK_URL',                     'http://ws.ovh.com/dedicated/r2/ws.dispatcher/getAvailability2');
define('NOTIFICATION_EMAILS',   'james@unetworks.org');
define('SYSTEM_EMAIL',                  '1'); // 1 = enabled local smtp system
define('MANDRILL',                  '0'); // 1 = enable email trought mandrill api, require an account on https://mandrillapp.com/
define('MANDRILL_API',                  '');
define('TEMP_PREVIOUS_MSG_FILE',        dirname(__FILE__). '/sys-avail-cache.txt');
 
$f = file_get_contents(CHECK_URL);
 
$a = json_decode($f);
$avail = $a->answer->availability;
 
$str_avai = '';
$zone_to_check = array('143sys13','E3-SSD-2'); //Replace with your choices
 
foreach($avail as $s) {
  if( in_array($s->reference, $zone_to_check)) {
    $z = $s->zones;
    foreach($z as $zone) {
// Please check your best zone here http://proof.ovh.net/
      if($zone->availability!=='unavailable' && strtolower($zone->zone) == 'bhs' || $zone->availability!=='unavailable' && strtolower($zone->zone) == 'gra' || $zone->availability!=='unavailable' && strtolower($zone->zone) == 'rbx' || $zone->availability!=='unavailable' && strtolower($zone->zone) == 'sbg')
        {
        $str_avai .= $s->reference . " is " . $zone->availability . " in " . $zone->zone . "\n";
      }
    }
  }
}
 
//-- write to cache file to avoid repeated notifications
$previous_message = @file_get_contents(TEMP_PREVIOUS_MSG_FILE);
 
if ($str_avai != ''){
    if ($str_avai != $previous_message){
        if (defined(NOTIFICATION_EMAILS)){
                $emails = explode(',',NOTIFICATION_EMAILS);
        foreach ($emails as $email)
                        sendNotificationEmail($email, $str_avai);
        }
    $ff = fopen(TEMP_PREVIOUS_MSG_FILE, "w");
        fwrite($ff, $str_avai);
        fclose($ff);
    }
}else {
        $ff = fopen(TEMP_PREVIOUS_MSG_FILE, "w");
        fwrite($ff, '-');
        fclose($ff);
}
 
/**
 * Send email via MANDRILL APP
 */
function sendNotificationEmail($to, $msg){
       
if (defined('MANDRILL_API') && MANDRILL == 1) {
        require dirname(__FILE__) . '/vendor/autoload.php';
        $mandrill = new Mandrill(MANDRILL_API);
 
        $date = new DateTime('now', new DateTimeZone('America/Caracas')); // replace your timezone here
 
        $message = new stdClass();
        $message->text = $msg;
        $message->subject = $date->format('Y-m-d H:i:s') . " -  SoYouStart Availability";
        $message->from_email = "no'reply@example.com";
        $message->from_name  = "NO REPLY";
        $message->to = array(array("email" => $to));
        $message->track_opens = true;
 
        $response = $mandrill->messages->send($message);
}
if ( SYSTEM_EMAIL == 1 ) {
        $mail = mail($to, $message->subject, $msg);
}
        return ;
}