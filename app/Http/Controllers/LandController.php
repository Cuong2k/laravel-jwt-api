<?php

namespace App\Http\Controllers;

use File;
use Image;
use Illuminate\Http\Request;
use App\Models\Land;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class LandController extends Controller
{
    /**
     * Display a listing of the resource.
     *s
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $searchKey = $request->searchKey;

        $lands = DB::table('lands')
        ->join('users', 'lands.user_id', '=', 'users.id')
        ->select('lands.*', 'users.username');
        if($searchKey) {
            $lands = $lands->where(function ($q) use ($searchKey) {
                $q->where('lands.name', 'LIKE', '%' . $searchKey . "%")
                ->orWhere('users.id', '=', $searchKey)
                ->whereJsonContains('users.id', '^[0-9]+$');
            });
        }
        
        $lands = $lands->get();

        return response()->json([
            'lands' => $lands
        ], 201);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        //
        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
        //
        // $user = auth()->user();
        // Log::debug($request);
        // die;
        
        if(!$request->hasFile("image")) {
            return response()->json(['message' => 'upload_file_not_found'], 400);
        }
    
        $allowedfileExtension=['jpg', 'JPG','png', 'PNG'];
        $file = $request->image;
        
        $extension = $file->getClientOriginalExtension();
        $check = in_array($extension,$allowedfileExtension);

        if (!$check) {
            return response()->json(['message' => 'invalid images format'], 422);
        }
        
         // generate a new filename. getClientOriginalExtension() for the file extension
         $filename = 'land-photo-' . time() . '.' . $file->getClientOriginalExtension();
     
         // save to storage/app/photos as the new $filename
        $path = $file->storeAs('images', $filename);

        $land = Land::create([
            'name' => $request->name,
            'detail' => $request->detail,
            'images' => $path,
            'price' => $request->price,
            'user_id' => $request->user_id
        ]);

        return response()->json([
            'message' => 'Land successfully created',
            // 'land' => $land
        ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $land = DB::table('lands')
        ->join('users', 'lands.user_id', '=', 'users.id')
        ->select('lands.*', 'users.username')
        ->where('lands.id', '=', $id)
        ->get();

        return response()->json([
            'land' => $land
        ], 201);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        
        // $user = auth()->user();
        $land = Land::find($id);
        if (!$land) { 
            return response()->json([
                'message' => 'Land not found'
            ], 404);
        }

        if(!$request->hasFile("image")) {
            return response()->json(['message' => 'up load file not found'], 400);
        }

        //Delete old file
        Storage::delete($land->images);
    
        $allowedfileExtension=['jpg', 'JPG','png', 'PNG'];
        $file = $request->file('image');
        
        $extension = $file->getClientOriginalExtension();
        $check = in_array($extension,$allowedfileExtension);

        if (!$check) {
           return response()->json(['message' => 'invalid file format'], 422);
        }
        
        // Log::debug($request->image);
        // die;

        // generate a new filename. getClientOriginalExtension() for the file extension
        $filename = 'land-photo-' . time() . '.' . $file->getClientOriginalExtension();
    
        // save to storage/app/photos as the new $filename
        $path = $file->storeAs('images', $filename);

        $land->name = $request->name;
        $land->detail = $request->detail;
        $land->images = $path;
        $land->price = $request->price;
        $land->user_id = $request->user_id;
        $land->save();

        return response()->json([
            'message' => 'Land successfully updated',
            // 'land' => $land
        ], 201);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        // $user = auth()->user();
        $land = Land::find($id);
        if (!$land) { 
            return response()->json([
                'message' => 'Land not found'
            ], 404);
        }
        $land->delete();    
        return response()->json([
            'message' => 'Land successfully delete',
            'land' => $land
        ], 201);

    }
}
