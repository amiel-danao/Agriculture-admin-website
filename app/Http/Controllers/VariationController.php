<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Variation;

class VariationController extends Controller
{
    public function index(Request $request)
    {
        $cropId = $request->input('crop_id');

        if ($cropId) {
            $variations = \App\Models\Variation::where('crop_id', $cropId)->get();
            return response()->json($variations, 200);
        }

        return response()->json(['message' => 'Please provide a crop_id in the query parameter.'], 400);
    }
}
