<html>
    <head>
        <title>Adopt Blaze</title>
        <link rel="stylesheet" href="../css/navi.css">
        <link rel="stylesheet" href="adoptcats.css">
        <link href='https://fonts.googleapis.com/css?family=Allura' rel='stylesheet'>
    </head>
    <body>
        <span>
            <header>
                <div class="bg-div">
                    <img id="logo" src="../mainImg/logo.png" alt="logo">
                    <nav id="navibar">
                      <a>Welcome,<%=(String)session.getAttribute("uname")%></a>
                      <a href="../adopt.jsp">ADOPT</a>
                      <a href="donate.jsp">DONATE</a>
                      <a class="active" href="../index.jsp">HOME</a>
                    </nav>
                </div>
            </header>
        </span>
        <h1>About Blaze</h1>
        <img class="catimg" src="../adot/blaze.jpg" alt="Blaze">
        <br><br>
        <div>
            <p class="details"><b>Age:</b> Young</p>
            <p class="details"><b>Gender:</b> Male</p>
            <p class="details"><b>Sterilized:</b> No</p>
            <p id="ceil">He is best friends with Aslan and nothing can break them apart! He is a loving and playful kitten who isn&#39;t really cool with other cats but loves his best friend to the moon and back. He spends his day eating, playing/annoying Aslan, running away from hoomans when it&#39;s medicine time (multi-vitamins) and sleeping/cuddling with Aslan. If you haven&#39;t realized by now they are a package deal and wherever Blaze goes, Aslan follows.</p>
        </div>
        <form method="get" action="../wel.jsp">
          <input type="hidden" name="catname" value="blaze">
          <button type="submit" id="but"><p id="adopt">ADOPT ME!</p></button><br><br></form>
    </body>
    <jsp:include page="../footer.jsp" />
</html>
