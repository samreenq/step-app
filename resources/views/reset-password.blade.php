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
                        <h3><i class="fa fa-lock fa-4x"></i></h3>
                        <h2 class="text-center">Reset Password?</h2>
                        <p>You can reset your password here.</p>
                        <div class="panel-body">

                            @if($is_error)
                                <div class="alert alert-danger">{!! $error !!}</div>
                                @else
                                @if($is_user_error)
                                    <div class="alert alert-danger">{!! $error !!}</div>
                                    @elseif($message != '')
                                      <div class="alert alert-success">{!! $message !!}</div>
                                @endif
                            <form id="register-form" role="form" autocomplete="off" class="form" method="post">

                                <input type="hidden" name="reset_token" name="reset_token" value="{!! $user['reset_token'] !!}" />
                                <input type="hidden" name="_token" value="{!! csrf_token() !!}" />
                                <input type="hidden" name="do_post" value="1" />

                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock color-blue"></i></span>
                                        <input id="new_password" name="new_password" placeholder="New Password" required class="form-control"  type="password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock color-blue"></i></span>
                                        <input id="confirm_password" name="confirm_password" placeholder="Confirm Password" required class="form-control"  type="password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Submit" type="submit">
                                </div>

                                <input type="hidden" class="hide" name="token" id="token" value="">
                            </form>
                                @endif

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>