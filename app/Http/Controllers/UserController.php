<?php

namespace App\Http\Controllers;

use App\Http\Requests\EditUserRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        // $users = User::all();
        // Log::debug($users);
        // die;
        $searchKey = $request->searchKey;
        $users = User::query()->select(
            'id',
            'username',
            'fullname',
            'age',
            'gender',
            'email',
            'password'
        );
        if ($searchKey) {
            $users = $users->where(function ($q) use ($searchKey) {
                $q->where('users.username', 'LIKE', '%' . $searchKey . '%')
                    ->orWhere('users.fullname', 'LIKE', '%' . $searchKey . '%')
                    ->orWhere('users.id', '=', $searchKey );
            });
        }
        $users = $users->get();
        return response()->json([
            'users' => $users
        ], 201);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
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
    public function update(EditUserRequest $request, $id)
    {
        //
        // Log::debug($request);
        // die;
        $user = User::find($id);
        if (!$user) { 
            return response()->json([
                'message' => 'Người dùng không tồn tại'
            ], 404);
        }

        $user->username = $request->username;
        $user->fullname = $request->fullname;
        $user->email = $request->email;
        $user->age = $request->age;
        $user->gender = $request->gender;
        $user->password = bcrypt($request->password);
        $user->save();

        return response()->json([
            'message' => 'User successfully updated',
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
        $user = User::find($id);
        if (!$user) { 
            return response()->json([
                'message' => 'user not found'
            ], 404);
        }
        $user->delete();    
        return response()->json([
            'message' => 'user successfully delete',
        ], 201);
    }
}
