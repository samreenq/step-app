<!DOCTYPE html>
<html>
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <title>{!! $app_name !!}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
    .form-gap {
        padding-top: 70px;
    }
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>
<body>
<div class="form-gap"></div>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="text-center">
                        <h3><i class="fa fa-home fa-4x"></i></h3>
                        <h2 class="text-center">Activate Acount</h2>
                      {{--  <p>Welcome to Step-App</p>--}}
                        <div class="panel-body">

                            @if($is_error)
                                <div class="alert alert-danger">{!! $error !!}</div>
                                @else
                                <h5>Dear {!! $user['first_name'].' '.$user['last_name'] !!}</h5>
                                    Congratulation your account has been activated.
                                Please login to the application and learn new things. Stay in touch!
                                @endif

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>