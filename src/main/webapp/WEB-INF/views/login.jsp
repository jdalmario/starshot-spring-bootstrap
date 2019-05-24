<html>
<head>
    <title>Login Page</title>
    <link rel='stylesheet' href='webjars/bootstrap/3.4.1/css/bootstrap.min.css'>
    <link rel='stylesheet' href='assets/css/login.css'>

    <script type='text/javascript' src='webjars/jquery/1.11.1/jquery.min.js'></script>
    <script type='text/javascript' src='webjars/bootstrap/3.4.1/js/bootstrap.min.js'></script>
</head>
<body>

<div class="container">
    <form class="form-signin" action="login" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label class="sr-only">Username</label>
        <input name="name" class="form-control" placeholder="Username" required autofocus value="developer">
        <label class="sr-only">Password</label>
        <input name="password" type="password" class="form-control" placeholder="Password" required value="devpassword">
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form>
</div>

</body>
</html>