<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use App\Traits\ApiResponser; // Bổ sung dòng này

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests , ApiResponser;
}
