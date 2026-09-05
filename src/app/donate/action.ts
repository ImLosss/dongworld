"use server";

// Fungsi 1: Membuat Transaksi QRIS
export async function createQrisTransaction(data: { amount: number }) {
    try {
        const orderId = `DW-DON-${Date.now()}`;
        
        const project = process.env.PAKASIR_PROJECT || "depodomain"; 
        const apiKey = process.env.PAKASIR_API || "API_KEY_ANDA";

        const response = await fetch('https://app.pakasir.com/api/transactioncreate/qris', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                project: project,
                order_id: orderId,
                amount: data.amount,
                api_key: apiKey
            })
        });

        const result = await response.json();

        if (response.ok && result.payment) {
            return { success: true, payment: result.payment };
        } else {
            return { success: false, error: result.message || "Gagal membuat QRIS" };
        }

    } catch (error: any) {
        return { success: false, error: "Terjadi kesalahan server." };
    }
}

// Fungsi 2: Mengecek Status & Hit Webhook
export async function checkTransactionStatus(data: { 
    order_id: string, 
    amount: number, 
    supporter: string, 
    email: string, 
    message: string, 
    total_payment: number 
}) {
    try {
        const project = process.env.PAKASIR_PROJECT!; 
        const apiKey = process.env.PAKASIR_API!;

        const url = new URL('https://app.pakasir.com/api/transactiondetail');
        url.searchParams.append('project', project);
        url.searchParams.append('amount', data.amount.toString());
        url.searchParams.append('order_id', data.order_id);
        url.searchParams.append('api_key', apiKey);

        const checkRes = await fetch(url.toString(), { method: 'GET' });
        const checkData = await checkRes.json();

        if (checkRes.ok && checkData.transaction) {
            
            // Jika sukses, eksekusi Webhook ke server Bot Telegram Anda
            if (checkData.transaction.status === 'completed') {
                const webhookPayload = {
                    supporter: data.supporter,
                    amount: data.total_payment, 
                    message: data.message,
                    email: data.email,
                    currency: 'IDR'
                };

                // Kirim ke endpoint express secara diam-diam dari server
                await fetch('http://212.85.25.245:2050/sociabuzz', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'sb-webhook-token': 'sbwhook-lwatbodiymchocuj2fdbt1qs'
                    },
                    body: JSON.stringify(webhookPayload)
                }).catch(err => console.error("Gagal mengirim webhook:", err));
            }

            return { status: checkData.transaction.status };
        }

        return { status: "pending" };

    } catch (error: any) {
        return { status: "error", message: error.message };
    }
}