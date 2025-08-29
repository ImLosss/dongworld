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

        // Store to public/videos with a hashed filename
    $path = $file->store('videos', 'public');
    $url = asset('storage/' . $path);

        return response()->json([
            'message' => 'Uploaded successfully',
            'path' => $path,
            'url' => $url,
            'name' => $file->getClientOriginalName(),
            'size' => $file->getSize(),
            'mime' => $file->getClientMimeType(),
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
