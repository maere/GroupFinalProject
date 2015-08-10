<link href="${pageContext.request.contextPath}/css/navBar.css" rel="stylesheet">

<div class="navbar">
    <ul class="nav navbar-nav">
        <li role="presentation"  class="active"><a href="${pageContext.request.contextPath}/home">Home</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/about">About</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/createPost">Create post</a></li>
    </ul>    

    <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
    </form>
