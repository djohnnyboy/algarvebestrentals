<?php

namespace App\Providers;

use App;
use Illuminate\Support\Facades\View;   
use Illuminate\Support\ServiceProvider;
use Laravel\Dusk\DuskServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        if ($this->app->environment('local', 'testing')) {
            $this->app->register(DuskServiceProvider::class);
        }
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $locale =  str_replace('_', '-', app()->getLocale());
        App::setLocale($locale);
        session()->put('locale', $locale);
    }
}
