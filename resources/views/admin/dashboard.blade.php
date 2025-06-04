@extends('admin.layout')

@section('main')
<?php 
    $service_ids = Session::get('service_ids');
?>

<div class="main" ng-controller="dashboardCtrl">
</div>
@endsection


@section('footer_scripts')
    <?php $version = "0.0.3"; ?>    
    <script type="text/javascript" src="{{url('assets/scripts/core/client_ctrl.js?v='.$version)}}" ></script>

    
@endsection
