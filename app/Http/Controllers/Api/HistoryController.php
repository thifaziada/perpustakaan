<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\BookResource;
use App\Models\Detail;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class HistoryController extends Controller
{
    public function index(Request $request)
    {
        // Mendapatkan nomor KTP (noktp) dari request
        $noktp = $request->input('noktp');

        // Lakukan join antara tabel transactions dan transaction_details
        $history = DB::table('transactions')
            ->join('details', 'transactions.idtransaksi', '=', 'details.idtransaksi')
            ->join('books', 'details.idbuku', '=', 'books.idbuku')
            ->select('books.judul', 'transactions.tgl_pinjam', 'details.tgl_kembali')
            ->where('transactions.noktp', $noktp);

        // Filter berdasarkan status buku (dipinjam, selesai, lewat tanggal kembali)
        $status = $request->input('status'); // Ini harus dikirim sebagai parameter pada request

        if ($status === 'dipinjam') {
            $history->whereNull('details.tgl_kembali');
        } elseif ($status === 'selesai') {
            $history->whereNotNull('details.tgl_kembali');
        } elseif ($status === 'lewat_tgl_kembali') {
            $history->where('details.tgl_kembali', '<', now());
        }

        $history = $history->paginate(5);

        // return collection of history as a resource
        return new BookResource(true, 'List Data Transaksi', $history);
    }

//    /**
//      * index
//      * 
//      * @return void
//      */
//     public function index(Request $request)
//     {
//         // Mendapatkan nomor KTP (noktp) dari request
//         $noktp = $request->input('noktp');

//         // Lakukan join antara tabel transactions dan transaction_details
//         $history = DB::table('transactions')
//             ->join('details', 'transactions.idtransaksi', '=', 'details.idtransaksi')
//             ->join('books', 'details.idbuku', '=', 'books.idbuku')
//             ->select('books.judul', 'transactions.tgl_pinjam', 'details.tgl_kembali')
//             ->where('transactions.noktp', $noktp)
//             ->paginate(5);

//         // return collection of history as a resource
//         return new BookResource(true, 'List Data Transaksi', $history);
//     }
//     /**
//      * show
//      *
//      * @param Transaction $transaction
//      * @return void
//      */
//     public function show(Transaction $transaction)
//     {
//         // Mengambil riwayat transaksi beserta detail terkait
//         $historyall = Transaction::with('details')->where('noktp', $transaction->noktp)->get();

//         if ($historyall->isEmpty()) {
//             return response()->json(['message' => 'Data Riwayat Transaksi Tidak Ditemukan'], 404);
//         }

//         return new BookResource(true, 'Data Riwayat Transaksi ditemukan!', $historyall);
//     }
//     /**
//      * store
//      * 
//      * @param mixed $request
//      * @return void
//      */
//     public function store(Request $request)
//     {
//         //define validation rules
//         $validator = Validator::make($request->all(), [
//             'idtransaksi' => 'required',
//             'noktp' => 'required',
//             'tgl_pinjam' =>  'required',
//             'idpetugas' => 'required',
//             'idbuku' => 'required',
//             'tgl_kembali' => 'required',
//         ]);
//         //check if validation fails
//         if ($validator->fails()){
//             return response()->json($validator->errors(), 422);
//         }

//         $transaction = new Transaction([
//             'idtransaksi' => $request->idtransaksi,
//             'noktp' => $request->noktp, 
//             'tgl_pinjam' => now(),
//             'idpetugas' => $request->idpetugas
//         ]);
//         $transaction->save();

//         $detail = new Detail([
//             'idbuku' => $request->idbuku, 
//             'idtransaksi' => $request->idtransaksi,
//             'tgl_kembali' => $request->tgl_kembali,
//             'denda' => $request->denda,
//             'idpetugas' => $request->idpetugas
//         ]);
//         $detail->save();

//         return new BookResource(true, 'Peminjaman Buku berhasil ditambahkan', [
//             'transaction' => $transaction,
//             'detail' => $detail
//         ]);
//     }
}
