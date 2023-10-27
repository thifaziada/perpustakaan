<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Member;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    // /**
    //  * index
    //  * 
    //  * @return void
    //  */
    // public function index()
    // {
    //     //get books
    //     $members = Member::latest()->paginate(5);

    //     //return collection of books as a resource
    //     return new RegisterResource(true, 'List Data Anggota', $members);
    // }

    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        //define validation rules
        $validator = Validator::make($request->all(), [
            'noktp'=> 'required',
            'nama' => 'required',
            'email' => 'required|email|unique:members',
            'password' => 'required|min:6',
            'alamat' => 'required',
            'kota' => 'required',
            'no_telp' => 'required',
            'file_ktp' => 'required|file|mimes:jpeg,png,jpg,gif,svg,pdf|max:2048'
        ]);
        //check if validation fails
        if ($validator->fails()){
            return response()->json($validator->errors(), 422);
        }

        //upload ktp
        $file_ktp = $request->file('file_ktp');
        $file_ktp->storeAs('public/members', $file_ktp->hashName());

        //Buat anggota baru
        $member = Member::create([
            'noktp' => $request->noktp,
            'nama' => $request->nama,
            'email' => $request->email,
            'password' =>bcrypt($request->password),
            'alamat' => $request->alamat,
            'kota' => $request->kota,
            'no_telp' => $request->no_telp,
            'file_ktp' => $file_ktp->hashName(),
        ]);

        //return response JSON user is created
        if($member) {
            return response()->json([
                'success' => true,
                'member'    => $member,  
            ], 201);
        }

        //return JSON process insert failed 
        return response()->json([
            'success' => false,
        ], 409);
    }
}
