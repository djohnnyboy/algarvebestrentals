<?php

namespace App\Http\Controllers;

use App\Carro;
use App\Quote;
use App\Reservas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {  
        $quotesMes = array();
        $ano = date('Y');
        $query = $request->input('ano');

        if(empty($query)){

            for ($i=1; $i <= 12; $i++) { 
                $quotes = DB::table('quotes')->whereMonth('pickUpDate',$i)
                            ->whereYear('pickUpDate', date('Y'))->count();                 
                $quotesMes[$i] = $quotes;               
            }

            $reservasMes = array();

            for ($i=1; $i <= 12; $i++) { 
                $reservas = DB::table('reservas')->whereMonth('pickUpDate',$i)
                            ->whereYear('pickUpDate', date('Y'))->count();   
                $reservasMes[$i] = $reservas;    
            }

            $carros = DB::table('carros')->get(); 
            $reservasPrecoTotal = 0; 

            foreach ($carros as $key ) {
                $reservas = DB::table('reservas')->where('car_id',$key->id)->count();
                $reservasPreco = DB::table('reservas')->where('car_id',$key->id)
                                    ->whereYear('pickUpDate', date('Y'))->sum('preco');
                $reservasPrecoTotal += $reservasPreco;
                $carUpdate = Carro::where('id', $key->id)->update([
                    'numeroReservas' => $reservas
                ]);
            } 

           return view('home',['quotesMes' => $quotesMes, 'reservasMes' 
                        => $reservasMes,'reservasPrecoTotal' => $reservasPrecoTotal]); 
       
        }else{

            for ($i=1; $i <= 12; $i++) { 
                $quotes = DB::table('quotes')->whereMonth('pickUpDate',$i)
                            ->whereYear('pickUpDate',$query )->count();   
                $quotesMes[$i] = $quotes;    
            }

            $reservasMes = array();

            for ($i=1; $i <= 12; $i++) { 
                $reservas = DB::table('reservas')->whereMonth('pickUpDate',$i)
                                ->whereYear('pickUpDate',$query )->count();   
                $reservasMes[$i] = $reservas;    
            }

            $carros = DB::table('carros')->get(); 
            $reservasPrecoTotal = 0;    

            foreach ($carros as $key ) {
                $reservas = DB::table('reservas')->where('car_id',$key->id)->count();
                $reservasPreco = DB::table('reservas')->where('car_id',$key->id)
                                    ->whereYear('pickUpDate',$query )->sum('preco');
                $reservasPrecoTotal += $reservasPreco;
                $carUpdate = Carro::where('id', $key->id)->update([
                    'numeroReservas' => $reservas
                ]);
            }  

           return view('home',['quotesMes' => $quotesMes, 'reservasMes' 
                            => $reservasMes,'reservasPrecoTotal' => $reservasPrecoTotal]); 
       
        }     
    }
}
