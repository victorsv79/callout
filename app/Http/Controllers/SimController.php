<?php

namespace App\Http\Controllers;

use App\Models\Sim;
use Illuminate\Http\Request;
//use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class SimController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $q = Sim::orderBy('id', 'asc');
        if($request->tarif_id) {
            $q->where('tarif_id', $request->tarif_id);
        }
        $sims = $q->get()->toArray();

        return response()->json($sims);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        Sim::create([
            'imei' => $request->imei,
            'fio' => $request->fio,
            'phone' => $request->phone,
            'tarif_id' => $request->tarif_id,
            'date_reg' => $request->date_reg,
        ]);

        return response()->json('Sim created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $sim = Sim::find($id);

        return response()->json($sim);
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
        $sim = Sim::find($id);

        $sim->update($request->all());

        return response()->json('Sim updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $sim = Sim::find($id);
        $sim->delete();

        return response()->json('Sim deleted successfully.');
    }
}
