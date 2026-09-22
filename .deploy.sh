#!/bin/bash
# Menghentikan script langsung jika ada perintah yang error
set -e 

# ==========================================
# 1. KONFIGURASI (Ubah sesuai dengan server Anda)
# ==========================================
APP_NAME="dongworld"
GIT_REPO="https://github.com/ImLosss/dongworld.git" # Gunakan URL Git Repo Anda
BRANCH="react"

BASE_DIR="/home/react/web/react.websiteku.space/public_html"
RELEASES_DIR="$BASE_DIR/releases"
SHARED_DIR="$BASE_DIR/shared"
CURRENT_DIR="$BASE_DIR/current"

# Format nama folder berdasarkan waktu (Contoh: 20260922_203015)
RELEASE_NAME=$(date +"%Y%m%d_%H%M%S")
NEW_RELEASE_DIR="$RELEASES_DIR/$RELEASE_NAME"

echo "🚀 Memulai Deployment: $RELEASE_NAME"

# ==========================================
# 2. PERSIAPAN FOLDER
# ==========================================
mkdir -p "$RELEASES_DIR"
mkdir -p "$SHARED_DIR"

# ==========================================
# 3. CLONE KODE TERBARU
# ==========================================
echo "📦 Mengunduh kode terbaru dari $BRANCH..."
git clone -b "$BRANCH" "$GIT_REPO" "$NEW_RELEASE_DIR"

# ==========================================
# 4. TAUTKAN FILE .ENV DARI FOLDER SHARED
# ==========================================
if [ -f "$SHARED_DIR/.env" ]; then
    echo "🔗 Menautkan file konfigurasi (.env)..."
    ln -s "$SHARED_DIR/.env" "$NEW_RELEASE_DIR/.env"
else
    echo "⚠️ Peringatan: File $SHARED_DIR/.env tidak ditemukan! Lewati..."
fi

# ==========================================
# 5. INSTALL & BUILD (Background Process)
# ==========================================
echo "⚙️ Membangun aplikasi (User di website tidak akan terganggu)..."
cd "$NEW_RELEASE_DIR"
npm install
npm run build

# ==========================================
# 6. SWITCH SYMLINK (Zero Downtime)
# ==========================================
echo "🔄 Mengalihkan lalu lintas (traffic) ke versi terbaru..."
ln -sfn "$NEW_RELEASE_DIR" "$CURRENT_DIR"

# ==========================================
# 7. RELOAD PM2
# ==========================================
echo "♻️ Me-reload server PM2..."
cd "$CURRENT_DIR"

if pm2 describe "$APP_NAME" > /dev/null 2>&1; then
    # Menggunakan reload dengan memperbarui cwd ke folder current terbaru
    pm2 reload "$APP_NAME" --cwd "$CURRENT_DIR" --update-env
else
    # Jika belum pernah didaftarkan sama sekali
    pm2 start npm --name "$APP_NAME" -- start
fi

# ==========================================
# 8. BERSIHKAN RILIS LAMA (Simpan 3 terakhir)
# ==========================================
echo "🧹 Membersihkan rilis usang..."
cd "$RELEASES_DIR"
ls -1t | tail -n +4 | xargs -r rm -rf

echo "✅ Deployment $RELEASE_NAME Berhasil!"