<?php

namespace App\Http\Controllers;

use Stripe;
use App\User;
use App\Carro;
use App\Quote;
use Validator;
use App\Company;
use App\Reserva;
use App\Setting;
use App\Library\Precos;
use App\Mail\BookingMail;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\BookingFormRequest;

class ReservaController extends Controller
{

    protected $start;
    protected $end;  
    protected $epMedia;
    protected $epAlta;
    protected $epMediaAlta;
    protected $epBaixa;
    protected $data;
    protected $date;
    protected $dateAux;
    protected $birthDateIndex;

    public function __construct(){
        $this->data = date("Y-m-d");
        $this->date = date('Y-m-d', strtotime($this->data  . ' + 1 days'));
        $this->dateAux = date('Y-m-d', strtotime($this->data  . ' + 4 days'));
        $this->birthDateIndex = date("Y-m-d", strtotime($this->data . ' - 23 years'));
        $this->epMedia = 0;
        $this->epAlta = 0;
        $this->epMediaAlta = 0;
        $this->epBaixa = 0;    
    }

    public function index(Request $request,Carro $carro,Quote $quote,Setting $setting) 
    { 
        $settings = Setting::findOrFail(1);
        $cars = Carro::where('active', 1)->orderBy('epocaBaixa','asc')->get();
        if (empty($request->all())) {   

            return view('booking-form.index',[
                        'date' => $this->date, 
                        'dateAux' => $this->dateAux, 
                        'birthDateIndex' => $this->birthDateIndex,
                        'carId' => "null",
                        'pickUpPlace' => 0,
                        'dropOffPlace' => 0,
                        'checked' => "null",
                        'settings' => $settings,
                        'cars' => $cars
                        ]);

        }elseif ($request->input('bookingStore') == "ourFleet") {

            $carro = Carro::findOrFail($request->input('carId'));

            return view('booking-form.index',[
                'carId' => $carro->id,
                'pickUpPlace' => 0,
                'date' => $this->date,
                'dropOffPlace' => 0,
                'dateAux' => $this->dateAux,
                'birthDateIndex' => $this->birthDateIndex,
                'checked' => "null",
                'settings' => $settings,
                'cars' => $cars
            ]);
        }elseif ($request->input('bookingStore') == "bookingBasic") {
            $carro = Carro::findOrFail($request->input('carId'));
            $quote = Quote::findOrFail($request->input('quoteId'));
            
            return view('booking-form.index', [
                'carId' => $carro->id,
                'quoteId' => $quote->id,
                'pickUpPlace' => 0,
                'date' => $quote->pickUpDate,
                'dropOffPlace' => 0,
                'dropOffDate' => $quote->dropOffDate,
                'dateAux' => $this->dateAux,
                'birthDateIndex' => $this->birthDateIndex,
                'checked' => "null",
                'settings' => $settings,
                'cars' => $cars
            ]);
        }else{
            $carro = Carro::findOrFail($request->input('carId'));
            $quote = Quote::findOrFail($request->input('quoteId'));
            
            return view('booking-form.index', [
                'carId' => $carro->id,
                'pickUpPlace' => 0,
                'date' => $quote->pickUpDate,
                'dropOffPlace' => 0,
                'dropOffDate' => $quote->dropOffDate,
                'dateAux' => $this->dateAux,
                'birthDateIndex' => $this->birthDateIndex,
                'checked' => $carro->seguro,
                'settings' => $settings,
                'cars' => $cars
            ]);
        } 
    }
    
    public function fetch(Request $request, Carro $carro){
        
        $carroEdit = $request->get('carroEdit');
        $car = $request->get('carroIndex');   
                    
        if ($car !== null) {          
             $carroIndex = Carro::findOrFail($car);        
             $carroIndex->imagem = Storage::url($carroIndex->imagem);
             return response()->json($carroIndex, 200);          
        }else{
            $carro = Carro::findOrFail($carroEdit);
            $carro->imagem = Storage::url($carro->imagem);
            return response()->json($carro, 200); 
        }         
    }

    public function store(BookingFormRequest $request, Reserva $reserva, Quote $quote,Carro $carro)
    {   
            $diasQ = new Precos();
            $pickUp = $request->input('pickUpDate');
            $dropOff = $request->input('dropOffDate');
          //  $diasQ->quotePeriod($dropOff, $pickUp);
            
            $dias = explode(" ", $diasQ->quotePeriod($pickUp, $dropOff));

            if ($dias[1] < 3 && url()->current() == "http://localhost:8000/booking-form") {
                return redirect('booking-form');    
            }
            if ($dias[1] > 30 && url()->current() == "http://localhost:8000/booking-form") {
                return redirect('booking-form');
            }

            if ($dias[1] < 3 && url()->previous() == "http://localhost:8000/booking-form") {
                return redirect('booking-form');    
            }
            if ($dias[1] > 30 && url()->previous() == "http://localhost:8000/booking-form") {
                return redirect('booking-form');
            }
            
            if($dias[0] == "epocaMedia"){
                $this->epMedia = $dias[1];
            }elseif($dias[0] == "epocaAlta"){
                $this->epAlta = $dias[1];
            }elseif($dias[0] == "epocaMediaAlta"){
                $this->epMediaAlta = $dias[1];
            }else{
                $this->epBaixa = $dias[1];
            }
            
            $precoSeguro = 0;
            $carro = $request->input('carros');
            if ($request->input('fullInsurance') == "on") {       
                $carSeguro = Carro::findOrFail($carro);
                $precoSeguro = $dias[1] * $carSeguro->seguro;
            }
            $settings = Setting::findOrFail(1);
            $precoXDriver = 0;
            if ($request->input('extraDriver') > 1) {
                $XDriver = $request->input('extraDriver');
                $precoXDriver = ($XDriver * $settings->extraDriver) - $settings->extraDriver;
            }      
            $precoTodlerSeat = 0;
            if($request->input('babySeat') > 0){
                $todlerSeat = $request->input('babySeat');
                $precoTodlerSeat = $todlerSeat * $settings->todlerSeat;
            }   
            $precoInfantSeat = 0;
            if($request->input('infantSeat') > 0){
                $infantSeat = $request->input('infantSeat');
                $precoInfantSeat = $infantSeat * $settings->infantSeat;
            }
            $precoBoosterSeat = 0;
            if($request->input('boosterSeat') > 0){
                $boosterSeat = $request->input('boosterSeat');
                $precoBoosterSeat = $boosterSeat * $settings->boosterSeat;
            }

            $pickUpPlace = $request->input('pickUpPlace');   
         
            $dropOffPlace = $request->input('dropOffPlace');

            $spainInsurance = $request->input('spainInsurance');

            if($spainInsurance == null){
                $spainInsurance = 0;
            }else{
                $spainInsurance = $settings->spainInsurance;
            }
            $gps = $request->input('gps');
            if($gps == null){
                $gps = 0;
            }else{
                $gps = $settings->gps;
            }
            
            $carId = Carro::findOrFail($carro); 
            $preco = ($carId->epocaBaixa * $this->epBaixa) + ($carId->epocaMedia * $this->epMedia) 
                        + ($carId->epocaAlta * $this->epAlta) + ($carId->epocaMediaAlta * $this->epMediaAlta) 
                        + $this->findPricePlace($pickUpPlace) + $this->findPricePlace($dropOffPlace)  
                        + $precoSeguro + $spainInsurance + $gps + $precoXDriver 
                        + $precoTodlerSeat + $precoInfantSeat + $precoBoosterSeat;
            $carCompanyEmail = Company::findOrFail($carId->company_id);
            $ua = $request->server('HTTP_USER_AGENT');

            $reservaIndex = Reserva::create([
                'visitor' => $this->getUserIP(),
                'device' => $ua,
                'name' => $request->input('name'),
                'email' => $request->input('email'),
                'phone' => $request->input('phone'),
                'dateOfBirth' => $request->input('dateOfBirth'),
                'drivinglicence' => $request->input('drivinglicence'),
                'car_id' => $request->input('carros'),
                'pickUpPlace' => $this->findPricePlace($request->input('pickUpPlace')),
                'pickUpLocality' => $request->input('pickUpLocality'),
                'pickUpDate' => $request->input('pickUpDate'),
                'pickUpTime' => $request->input('pickUpTime'),
                'dropOffPlace' => $this->findPricePlace($request->input('dropOffPlace')),
                'dropOffLocality' => $request->input('dropOffLocality'),
                'dropOffDate' => $request->input('dropOffDate'),
                'dropOffTime' => $request->input('dropOffTime'),
                'flightNumber' => $request->input('flightNumber'),
                'fullInsurance' => $precoSeguro,
                'spainInsurance' => $request->input('spainInsurance'),
                'gps' => $request->input('gps'),
                'extraDriver' => $precoXDriver,
                'childTodlerSeats' => $precoTodlerSeat,
                'childInfantSeats' => $precoInfantSeat,
                'childBoosterSeats' => $precoBoosterSeat,
                'textArea' => $request->input('textArea'),
                'age' => 23,
                'termsAndConditions' => $request->input('termsAndConditions'),
                'preco' => $preco,
                'commission' => ceil($preco * 0.18),
                'quote_id' => $request->input('quoteId'),
            ]);  
            
            if($reservaIndex){
                $dataUser = [
                    'name'           => $request->input('name'),
                    'email'          => $request->input('email'),
                    'phone'          => $request->input('phone'),
                    'dateOfBirth'    => $request->input('dateOfBirth'),
                    'drivinglicence' => $request->input('drivinglicence'),
                    'carro'          => $carId->groupType,
                    'carroMarca'     => $carId->marca,
                    'carroImg'       => $carId->imagem,
                    'pickUpPlace'    => $request->input('pickUpPlace'),
                    'pickUpLocality' => $request->input('pickUpLocality'),
                    'dropOffPlace'   => $request->input('dropOffPlace'),
                    'dropOffLocality' => $request->input('dropLocality'),
                    'pickUpDate'     => $request->input('pickUpDate'),
                    'dropOffDate'    => $request->input('dropOffDate'),
                    'pickUpTime'     => $request->input('pickUpTime'),
                    'dropOffTime'    => $request->input('dropOffTime'),
                    'flightNumber'   => $request->input('flightNumber'),
                    'fullInsurance'  => $precoSeguro,
                    'spainInsurance' => $request->input('spainInsurance'),
                    'gps'            => $request->input('gps'),
                    'extraDriver'    => $precoXDriver,
                    'babySeat'       => $precoTodlerSeat,
                    'infantSeat'     => $precoBoosterSeat,
                    'boosterSeat'    => $precoInfantSeat,
                    'textArea'       => $request->input('textArea'),
                    'preco'          => $preco,

                    'subject'        => 'Car rental booking',
                    'from'           => 'from@example.com',
                    'from_name'      => 'algarvebestrentals.pt',
                ];
                
                $tax = intval(number_format(ceil($preco * 0.18) * 10000));
                $tax = $tax . 00;

                \Stripe\Stripe::setApiKey('sk_test_51I3l1CDUU5l8U0qtXldEJop81zKG2hKtVsxzqWDK3BPyvtGIDRqD9xkr1jMQhbYZg4rP2Kydf1Z7WpPS8mtuM75I00Mm3GMuff');
                try{ 
                    $intent = Stripe\PaymentIntent::create([
                    'amount' => $tax,
                    'currency' => 'eur',
                    'description' => 'rent a car',
                    'payment_method' => 'pm_card_visa',
                    'payment_method_types' => ['card'],
                    'confirmation_method' => 'automatic',
                    'receipt_email' => $request->input('email'),
                    ]);
                    
                        Reserva::where('id', $reservaIndex->id)->update([
                            'paymentId' => $intent->id
                        ]);

                        $user = User::findOrFail(1);
                        session(['dataUser' => $dataUser]);

                        return view('payment.index', [
                            'intent' => $intent->client_secret , 
                            'userEmail' => $request->input('email'), 
                            'adminEmail' => $user->email, 
                            'carOwnerEmail' => $carCompanyEmail->email,
                            'price' => $preco, 
                            ]);

                    }catch(\Stripe\Exception\CardException $e){ 
                        // verificar card exceptions
                        echo 'Status is:' . $e->getHttpStatus() . '\n';
                        echo 'Type is:' . $e->getError()->type . '\n';
                        echo 'Code is:' . $e->getError()->code . '\n';
                        // param is '' in this case
                        echo 'Param is:' . $e->getError()->param . '\n';
                        echo 'Message is:' . $e->getError()->message . '\n';
                        // return back()->withInput()->with('errors', 'Payment Declined');
                    } catch (\Stripe\Exception\RateLimitException $e) {
                        // Too many requests made to the API too quickly
                        dd($e);
                    } catch (\Stripe\Exception\InvalidRequestException $e) {
                        // Invalid parameters were supplied to Stripe's API 
                        dd($e);
                    } catch (\Stripe\Exception\AuthenticationException $e) {
                        // Authentication with Stripe's API failed
                        // (maybe you changed API keys recently)       
                        //return back()->withInput()->with('message', $e->message);
                        dd($e);
                    } catch (\Stripe\Exception\ApiConnectionException $e) {
                        // Network communication with Stripe failed
                        dd($e);
                    } catch (\Stripe\Exception\ApiErrorException $e) {
                        // Display a very generic error to the user, and maybe send
                        // yourself an email
                        dd($e);
                    } catch (Exception $e) { 
                        dd($e);
                        // Something else happened, completely unrelated to Stripe
                    }
                }
                return back()->withInput()->with('errors', 'Booking Error'); 
    } # end function

  public function show(Reserva $reserva,Carro $carro, $booking_form)
    {
       if (View::exists('errors.404')) {
           return view('errors.404');
       }
    } 

    public function findPricePlace ($value){
        switch ($value) {
            case 'Armação de Pêra':
                return 0;
                break;
            case 'Alvôr':
                return 0;
                break;
            case 'Portimão':
                return 0;
                break;
            case 'Praia da Rocha':
                return 0;
                break;
            case 'Praia do Carvoeiro':
                return 0;
                break;
            case 'Lagos':
                return 20;
                break;
            case 'Aljezur':
                return 30;
                break;
            case 'Airport Faro':
                return 0;
                break;
            case 'Monte Gordo':
                return 20;
                break;
            case 'Vila Nova de Cacela':
                return 20;
                break;
            case 'Vila Real de Santo Antonio':
                return 20;
                break;
            default:
                break;
        }
    }

    protected function getUserIP(){
        // Get real visitor IP behind CloudFlare network
        if (isset($_SERVER["HTTP_CF_CONNECTING_IP"])) {
                $_SERVER['REMOTE_ADDR'] = $_SERVER["HTTP_CF_CONNECTING_IP"];
                $_SERVER['HTTP_CLIENT_IP'] = $_SERVER["HTTP_CF_CONNECTING_IP"];
        }
        $client  = @$_SERVER['HTTP_CLIENT_IP'];
        $forward = @$_SERVER['HTTP_X_FORWARDED_FOR'];
        $remote  = $_SERVER['REMOTE_ADDR'];

        if(filter_var($client, FILTER_VALIDATE_IP)){
            $ip = $client;
        }elseif(filter_var($forward, FILTER_VALIDATE_IP)){
            $ip = $forward;
        }else{
            $ip = $remote;
        }
        return $ip;
    }

} # end controller reserva
