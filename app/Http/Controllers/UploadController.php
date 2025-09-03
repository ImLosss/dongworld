<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class UploadController extends Controller
{
    /**
     * Handle a normal file upload to local storage.
     * Stores the uploaded video under public/videos and returns basic info.
     */
    public function store(Request $request)
    {
        $request->validate([
            'file' => 'required|file|mimetypes:video/*',
        ]);

        $file = $request->file('file');

        // Kirim file langsung sebagai multipart (tanpa menyimpan di Laravel)
        $resp = Http::withHeaders([
            'sb-webhook-token' => 'sbwhook-lwatbodiymchocuj2fdbt1qs',
        ])->timeout(0) // opsional: biar nggak timeout untuk file besar
        ->attach(
            'file',
            fopen($file->getRealPath(), 'r'),
            $file->getClientOriginalName()
        )->post('http://153.92.4.128:2050/upload', [
            'name' => $file->getClientOriginalName(),
            'mime' => $file->getClientMimeType(),
            'size' => $file->getSize(),
            'kind' => 'video_upload',
        ]);

        return response()->json([
            'message'    => 'Forwarded to Node',
            'name'       => $file->getClientOriginalName(),
            'size'       => $file->getSize(),
            'mime'       => $file->getClientMimeType(),
            'forwarded'  => $resp->successful(),
            'forwardMsg' => $resp->json() ?? null,
        ]);
    }

    public function proxy(Request $request)
    {
        $request->validate([
            'file' => 'required|file|mimetypes:video/*',
            'target' => 'required|url',
        ]);

        $file = $request->file('file');
        $target = $request->input('target');

        try {
            $response = Http::timeout(300)
                ->attach('file', fopen($file->getRealPath(), 'r'), $file->getClientOriginalName())
                ->post($target);

            return response($response->body(), $response->status())
                ->withHeaders(['Content-Type' => $response->header('Content-Type', 'application/json')]);
        } catch (\Throwable $e) {
            Log::error('Upload proxy failed: ' . $e->getMessage());
            return response()->json(['message' => 'Upload proxy error', 'error' => $e->getMessage()], 502);
        }
    }
}
