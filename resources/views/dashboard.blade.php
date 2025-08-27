@extends('layouts.admin-layout')
@section('title')
    - Dashboard
@endsection
@section('breadcrumb')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark"
                    @role('admin')href="{{ route('home') }}"@endrole>Home</a></li>
        </ol>
        <h5 class="font-weight-bolder mb-0">Dashboard</h5>
    </nav>
@endsection
@section('content')
    <div class="row mb-3">
        <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-body p-3">
                    <div class="row">
                        <div class="col-8">
                            <div class="numbers">
                                <p class="text-sm mb-0 text-capitalize font-weight-bold">Total Pemasukan</p>
                                <h5 class="font-weight-bolder mb-0">
                                    Rp34
                                    <span class="text-success text-sm font-weight-bolder">543</span>
                                </h5>
                            </div>
                        </div>
                        <div class="col-4 text-end">
                            <div class="icon icon-shape bg-gradient-primary shadow text-center border-radius-md">
                                <i class="ni ni-money-coins text-lg opacity-10" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div id="chartPemasukan"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-body p-3">
                    <div class="row">
                        <div class="col-8">
                            <div class="numbers">
                                <p class="text-sm mb-0 text-capitalize font-weight-bold">Total keuntungan</p>
                                <h5 class="font-weight-bolder mb-0">
                                    34
                                    <span class="text-success text-sm font-weight-bolder">+Rp23</span>
                                </h5>
                            </div>
                        </div>
                        <div class="col-4 text-end">
                            <div class="icon icon-shape bg-gradient-primary shadow text-center border-radius-md">
                                <i class="fa-solid fa-hand-holding-dollar text-lg opacity-10" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div id="chartProfit"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-body p-3">
                    <div class="row">
                        <div class="col-8">
                            <div class="numbers">
                                <p class="text-sm mb-0 text-capitalize font-weight-bold">Staff</p>
                                <h5 class="font-weight-bolder mb-0">
                                    2
                                </h5>
                            </div>
                        </div>
                        <div class="col-4 text-end">
                            <div class="icon icon-shape bg-gradient-primary shadow text-center border-radius-md">
                                <i class="fa-solid fa-users text-lg opacity-10"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
@endsection
