<?php

namespace App\Http\Middleware;

use Closure,Auth,Session,DB;

use App\Models\User;

class CheckGCanteen
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $service_ids = User::getServiceIds();

        if(!in_array(11,$service_ids)){
            return redirect('/error');
        }
        return $next($request);
    }

}