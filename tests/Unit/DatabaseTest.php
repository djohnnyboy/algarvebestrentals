<?php

namespace Tests\Unit;

use App\User;
use App\Blog;
use App\Carro;
use App\Company;
use App\Contact;
use App\Quote;
use App\Reserva;
use App\Setting;
use Tests\TestCase;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithoutMiddleware;

class DatabaseTest extends TestCase
{
    use RefreshDatabase;
    /**
     * A basic unit test example.
     *
     * @return void
     */

    public function testUserDatabase()
    {
        $user = factory(User::class)->create();

        $this->assertDatabaseHas('users', [
            'name' => $user->name,
            'email' => $user->email,
            'password' => $user->password,
        ]);
    }

    public function testBlogDatabase()
    {
        $blog = factory(Blog::class)->create();
        
        $this->assertDatabaseHas('blogs', [
            'title' => $blog->title,
            'image' => $blog->image,
            'body' => $blog->body,
            'coordinates' => $blog->coordinates,
        ]);
    }
    
    public function testCarroDatabase()
    {
        $carro = factory(Carro::class)->create();
       
        $this->assertDatabaseHas('carros', [
            'groupType' => $carro->groupType,
            'marca' => $carro->marca,
            'epocaBaixa' => $carro->epocaBaixa,
            'epocaMedia' => $carro->epocaMedia,
            'epocaMediaAlta' => $carro->epocaMediaAlta,
            'epocaAlta' => $carro->epocaAlta,
            'seguro' => $carro->seguro,
            'transmissao' => $carro->transmissao,
            'lugares' => $carro->lugares,
            'bagagemGr' => $carro->bagagemGr,
            'bagagemPq' => $carro->bagagemPq,
            'combustivel' => $carro->combustivel,
            'arCondicionado' => $carro->arCondicionado,
            'imagem' => $carro->imagem,
            'numeroReservas' => $carro->numeroReservas,
        ]); 
    }

    public function testCompanyDatabase()
    {
        $company = factory(Company::class)->create();

        $this->assertDatabaseHas('companies', [
            'name' => $company->name,
            'email' => $company->email,
            'phone' => $company->phone,
            'nif' => $company->nif,
        ]);
    }

    public function testContactDatabase()
    {
        $contact = factory(Contact::class)->create();

        $this->assertDatabaseHas('contacts', [
            'name' => $contact->name,
            'email' => $contact->email,
            'message' => $contact->message,
        ]);
    }

    public function testQuoteDatabase()
    {
        $quote = factory(Quote::class)->create();
        
        $this->assertDatabaseHas('quotes', [
            'pickUpDate' => $quote->pickUpDate,
            'dropOffDate' => $quote->dropOffDate,
            'age' => $quote->age,
            'carros' => $quote->carros,
            'days' => $quote->days,
        ]);
    } 

    public function testReservaDatabase()
    {
        $reserva = factory(Reserva::class)->create();
        //dd($reserva);
        $this->assertDatabaseHas('reservas', [
            'visitor' => $reserva->visitor,
            'device' => $reserva->device,
            'name' => $reserva->name,
            'email' => $reserva->email,
            'phone' => $reserva->phone,
            'dateOfBirth' => $reserva->dateOfBirth,
            'drivinglicence' => $reserva->drivinglicence,
            'pickUpPlace' => $reserva->pickUpPlace,
            'pickUpDate' => $reserva->pickUpDate,
            'pickUpTime' => $reserva->pickUpTime,
            'dropOffPlace' => $reserva->dropOffPlace,
            'dropOffDate' => $reserva->dropOffDate,
            'dropOffTime' => $reserva->dropOffTime,
            'flightNumber' => $reserva->flightNumber,
            'fullInsurance' => $reserva->fullInsurance,
            'spainInsurance' => $reserva->spainInsurance,
            'gps' => $reserva->gps,
            'extraDriver' => $reserva->extraDriver,
            'childTodlerSeats' => $reserva->childTodlerSeats,
            'childInfantSeats' => $reserva->childInfantSeats,
            'childBoosterSeats' => $reserva->childBoosterSeats,
            'textArea' => $reserva->textArea,
            'age' => $reserva->age,
            'termsAndConditions' => $reserva->termsAndConditions,
            'commission' => $reserva->commission,
            'paymentId' => $reserva->paymentId,
        ]);
    } 

    public function testSettingsDatabase()
    {
        $setting = factory(Setting::class)->create();
        
        $this->assertDatabaseHas('settings', [
            'email' => $setting->email,
            'spainInsurance' => $setting->spainInsurance,
            'gps' => $setting->gps,
            'extraDriver' => $setting->extraDriver,
            'todlerSeat' => $setting->todlerSeat,
            'infantSeat' => $setting->infantSeat,
            'boosterSeat' => $setting->boosterSeat,
        ]);
    } 
}
