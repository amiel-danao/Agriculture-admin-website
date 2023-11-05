<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use App\Models\Crop;
use Illuminate\Support\Facades\Log;
use App\Models\Variation;

class CropController extends Controller
{
    public function store(Request $request)
{
    $request->validate([
        'name' => 'required|string',
        'description' => 'nullable|string',
        'count' => 'required|integer',
        'variations' => 'array', // Assuming 'variations' is submitted as an array
    ]);

    // Create a new crop instance
    $crop = new Crop([
        'name' => $request->input('name'),
        'description' => $request->input('description'),
        'count' => $request->input('count'),
    ]);

    // Save the crop to the database
    $crop->save();

    // Associate variations with the crop
    $variations = $request->input('variations');

    if ($variations) {
        foreach ($variations as $variationName) {
            $variation = new Variation(['name' => $variationName]);
            $crop->variations()->save($variation);
        }
    }

    // You can then return a response or redirect to another page.
    return redirect()->route('crops.index')->with('success', 'Crop added successfully');
}

    public function index()
    {
        $crops = Crop::all(); // Fetch all crops from the database

        return view('pages.crops', ['crops' => $crops]);
    }

    public function all(Request $request)
    {
        $query = $request->input('name');

        // Check if the 'name' query parameter is provided
        if ($query) {
            $crops = Crop::where('name', 'like', '%' . $query . '%')->get();
        } else {
            // If 'name' query parameter is not provided, fetch all crops
            $crops = Crop::all();
        }

        return response()->json($crops);
    }

    public function destroy($id)
    {
        Log::info("Received ID in destroy method: $id");
        $crop = Crop::findOrFail($id);
        $crop->delete();

        return response()->json(['message' => 'Crop deleted successfully']);
    }

    public function edit($id)
    {
        try {
            // Find the crop by ID
            $crop = Crop::findOrFail($id);

            // Get the variations that match the crop_id
            $variations = Variation::where('crop_id', $id)->get();

            return view('pages.edit', ['crop' => $crop, 'variations' => $variations]);
        } catch (ModelNotFoundException $e) {
            // Handle the case where the crop with the given ID is not found
            return response()->json(['error' => 'Crop not found'], 404); // Customize the response as needed
        }
    }

public function update(Request $request, $id)
{
    try {
        // Attempt to find the crop by ID
        $crop = Crop::findOrFail($id);

        // Validate the request data
        $request->validate([
            'name' => 'required|string',
            'description' => 'nullable|string',
            'count' => 'required|integer',
            'variations' => 'array', // Assuming 'variations' is submitted as an array
        ]);

        // Update the crop attributes
        $crop->name = $request->input('name');
        $crop->description = $request->input('description');
        $crop->count = $request->input('count');

        // Save the updated crop to the database
        $crop->save();

        // Handle variations
        $variations = $request->input('variations');

        // First, remove all existing variations associated with the crop
        $crop->variations()->delete();

        // Then, add the new variations
        if ($variations) {
            foreach ($variations as $variationName) {
                $variation = new Variation(['name' => $variationName]);
                $crop->variations()->save($variation);
            }
        }

        // Redirect to the crop index page with a success message
        return redirect()->route('crops.index')->with('success', 'Crop updated successfully');
    } catch (ModelNotFoundException $e) {
        // Handle the case where the crop with the given ID is not found
        return response()->json(['error' => 'Crop not found'], 404);
    } catch (\Exception $e) {
        // Handle other exceptions (e.g., validation errors)
        return response()->json(['error' => $e->getMessage()], 400);
    }
}
        public function addVariation(Request $request, $cropId)
        {
            // Validate the request data
        
            $variation = new Variation([
                'name' => $request->input('name'),
                // Add other attributes for your variations
            ]);
        
            $crop = Crop::find($cropId);
        
            $crop->variations()->save($variation);
        
            // You can then return a response or redirect as needed
        }
        
    
}



