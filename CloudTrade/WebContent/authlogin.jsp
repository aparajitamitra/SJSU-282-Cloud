<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
  <title>Login</title>
  <link rel="stylesheet" type="text/css" href="/css/bootstrap.css"/>
  <link rel="stylesheet" type="text/css" href="/css/jquery.growl.css"/>
  <script src="http://code.jquery.com/jquery.js"></script>
  <script src="https://cdn.auth0.com/js/lock/10.15/lock.min.js"></script>
  <script src="/js/jquery.growl.js" type="text/javascript"></script>
</head>
<body>
  <div class="container">
    <script type="text/javascript">
      $(function () {
        $.growl({title: "Welcome!", message: "Please log in"});
      });

      $(function () {
        var lock = new Auth0Lock('vy2Wy0RiVJphZUke5Z6Fsec9IPy7snMM', 'cloudrangers.auth0.com', {
          auth: {
            params: {
              state: '${state}',
              // change scopes to whatever you like, see https:///scopes
              // claims are added to JWT id_token - openid profile gives everything
              scope: 'openid user_id name nickname email picture'
            },
            responseType: 'code',
            redirectUrl: '${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}', 
          }
        });
        lock.show();
      });
    </script>
  </div>
  
</body>
</html>