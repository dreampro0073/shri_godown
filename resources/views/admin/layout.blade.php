<?php 
    $version = env('JS_VERSION'); 
    $host = env('APP_ENV'); 
    $service_ids = Session::get('service_ids');
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Aadhyasri Web Solutions</title>

    <link rel="icon" sizes="32x32" type="image/x-icon" href="{{url('assets/img/favicon.png')}}" >

    @if($host == 'local')
        <link rel="stylesheet" type="text/css" href="{{url('bootstrap3/css/bootstrap.min.css')}}">
        <link rel="stylesheet" type="text/css" href="{{url('assets/font-awesome/css/font-awesome.min.css')}}">
        <link rel="stylesheet" type="text/css" href="{{url('plugins/bootstrap-datepicker/css/datepicker3.css')}}">
        <link href="{{url('assets/css/selectize.css')}}" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="{{url('assets/css/custom.css?v='.$version)}}">
    @else
        <link rel="stylesheet" type="text/css" href="{{url('assets/dist/web.min.css?v='.$version)}}">
    @endif
</head>
<body  ng-app="app">
	<div id="wrapper">
        <div class="container-fluid">
            <div id="content" style="display: flex;">
                <div class="ul" style="width:250px;background-color: #ececec59;position: fixed;top: 0;left: 0;height: calc(100vh - 67px);overflow-y: scroll;padding:0;">
                    <div style="padding:16px;">
                        <span style="font-size: 18px;font-weight: bold">
                            {{Session::get('client_name')}}
                        </span>
                    </div>
                    <ul class="nav nav-pills nav-stacked">
                        @if(Auth::user()->priv !=5 && Auth::user()->priv !=1)
                            <li class="@if(isset($sidebar)) @if($sidebar == 'dashboard') active @endif @endif">
                                <a href="{{url('/admin/dashboard')}}"><i class="fa fa-home"></i>Dashboard</a>
                            </li>
                                               
                            @if(in_array(3, $service_ids) || Auth::user()->priv == 1)
                                @if(Auth::user()->priv == 2 || Auth::user()->priv == 1)
                                  
                                    
                                    <li class="@if(isset($sidebar)) @if($sidebar == 'cant_items') active @endif @endif">
                                        <a href="{{url('/admin/godown-canteen/items')}}"><i class="fa fa-cutlery" aria-hidden="true"></i>Canteen Items</a>
                                    </li>
                                    
                                @endif
                                <li class="@if(isset($sidebar)) @if($sidebar == 'daily_entries') active @endif @endif">
                                    <a href="{{url('/admin/godown-canteen/daily-entries')}}">
                                        <i class="fa fa-shopping-bag" aria-hidden="true"></i>Daily Entries
                                    </a>
                                </li>
                            
                            @endif

                            
                            <li class="@if(isset($sidebar)) @if($sidebar == 'shift') active @endif @endif">
                                <a href="{{url('/admin/shift/current')}}"><i class="fa fa-industry" aria-hidden="true"></i>Shift Status</a>
                            </li>

                           
                            @if(Auth::user()->priv == 2)
                                <li class="@if(isset($sidebar)) @if($sidebar == 'users') active @endif @endif">
                                    <a href="{{url('/admin/users')}}"><i class="fa fa-users" aria-hidden="true"></i>Users</a>
                                </li>
                            @endif

                            <li class="@if(isset($sidebar)) @if($sidebar == 'change_pass') active @endif @endif">
                                <a href="{{url('/admin/reset-password')}}"><i class="fa fa-key" aria-hidden="true"></i>Reset Password</a>
                            </li>
                            

                        @endif

                        

                        
                        @if(Auth::user()->priv == 1)
                            <li class="@if(isset($sidebar)) @if($sidebar == 'dashboard') active @endif @endif">
                                <a href="{{url('/superAdmin/dashboard')}}"><i class="fa fa-home"></i>Dashboard</a>
                            </li>

                            <li class="@if(isset($sidebar)) @if($sidebar == 'clients') active @endif @endif">
                                <a href="{{url('/superAdmin/clients')}}"><i class="fa fa-users"></i>Clients</a>
                            </li>
                        @endif

                        <li>
                            <a href="{{url('/logout')}}"><i class="fa fa-sign-out"></i>Logout</a>
                        </li>
                        
                    </ul>
                    
                </div>
                <div class="" style="padding-left:250px;width: 100%;">
                    <div style="text-align:right;padding-top:8px;padding-bottom: 8px;padding-right:24px;margin: 0 -15px;background: #fff;box-shadow:0 0 2px rgba(0,0,0,0.5);"><strong> {{Auth::user()->name}}</strong> <a href="{{url('logout')}}"><b>Logout</b></a> </div>
                    <div style="padding:0 20px;padding-bottom: 80px;"> 
                        @yield('main')
                    </div>
                </div>
             
            </div>
        </div>

        <span style="position: fixed;bottom:0;left:0;width: 100%;padding:8px;display: block;text-align: center;background: #fff;border-top: 1px solid #a6a6a67d;">
            <img src="{{url('assets/img/aadh1.png')}}" style="height:50px;width: auto;">
            <!-- <a href="mailto:aadhyasriwebsolutions@gmail.com">aadhyasriwebsolutions@gmail.com</a> -->

        </span>
		
    </div>
    
    <!-- <div ng-controller="checkoutAlertCtrl">
        
    </div> -->
    <script type="text/javascript">
        var base_url = "{{url('/')}}";
        var CSRF_TOKEN = "{{ csrf_token() }}";
        var auto_alert_status = "{{Session::get('auto_alert_status')}}";
        var authCheck = "{{Auth::user()->is_auto_alert_access}}";
        var api_key = "{{Auth::user()->api_key}}";
    </script>

    @if($host == 'local')
        <script type="text/javascript" src="{{url('assets/scripts/jquery.min.js')}}"></script>
        <script type="text/javascript" src="{{url('bootstrap3/js/bootstrap.min.js')}}"></script>
        <script type="text/javascript" src="{{url('plugins/bootstrap-datepicker/js/bootstrap-datepicker.js')}}"></script>
        <script type="text/javascript" src="{{url('assets/scripts/selectize.min.js')}}" ></script>
        <script type="text/javascript" src="{{url('assets/scripts/angular.min.js')}}" ></script>
        <script type="text/javascript" src="{{url('assets/scripts/ng-file-upload.min.js')}}" ></script>
        <script type="text/javascript" src="{{url('assets/scripts/angular-selectize.js')}}" ></script>
        <script type="text/javascript" src="{{url('assets/scripts/jcs-auto-validate.js')}}" ></script>
        <script type="text/javascript" src="{{url('assets/scripts/core/custom.js')}}"></script>
        <script type="text/javascript" src="{{url('assets/scripts/core/app.js')}}" ></script>
        <script type="text/javascript" src="{{url('assets/scripts/core/services.js')}}" ></script>
        <script type="text/javascript" type="text/javascript" src="{{url('assets/scripts/core/controller.js?v='.$version)}}"></script>
        <script type="text/javascript" type="text/javascript" src="{{url('assets/scripts/core/gcanteen_ctrl.js?v='.$version)}}"></script>
        <!-- <script type="text/javascript" type="text/javascript" src="{{url('assets/scripts/core/checkout_alert.js?v='.$version)}}"></script> -->
    @else
        <script type="text/javascript" type="text/javascript" src="{{url('assets/dist/plugins.min.js?v='.$version)}}"></script>
        <script type="text/javascript" type="text/javascript" src="{{url('assets/dist/web.min.js?v='.$version)}}"></script>
        
    @endif

    @yield('footer_scripts')

    <script>
      angular.module("app").constant("CSRF_TOKEN", "{{ csrf_token() }}");
    </script>
</body>
</html>