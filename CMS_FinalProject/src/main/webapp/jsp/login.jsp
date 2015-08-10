  <!-- DROPDOWN LOGIN STARTS HERE  -->
    <div class="col-md-6"> 
        <ul id="signInDropdown" class="nav navbar-nav navbar">
            <li class="dropdown">
                <button type="button" id="dropdownMenu1" data-toggle="dropdown" class="btn btn-default navbar-btn dropdown-toggle"><i class="glyphicon glyphicon-user color-blue"></i>Login <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li style="width: 250px;">
                        <form class="navbar-form form" role="form">
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                    <!--EMAIL ADDRESS-->
                                    <input id="emailInput" placeholder="email address" class="form-control" oninvalid="setCustomValidity('Please enter a valid email address!')" onchange="try {
                                                setCustomValidity('')
                                            } catch (e) {
                                            }" required="" type="email">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock color-blue"></i></span>
                                    <!--PASSWORD-->
                                    <input id="passwordInput" placeholder="password" class="form-control" oninvalid="setCustomValidity('Please enter a password!')" onchange="try {
                                                setCustomValidity('')
                                            } catch (e) {
                                            }" required="" type="password">
                                </div>
                            </div>
                            <!--  BASIC ERROR MESSAGE
                            <div class="form-group">
                            <label class="error-message color-red">*Email &amp; password don't match!</label>
                            </div>
                            -->
                            <div class="form-group">
                                <!--BUTTON-->
                                <button type="submit" class="btn btn-primary form-control">Login</button>
                            </div>
                            <div class="form-group">
                                <!--RESET PASSWORD LINK-->
                                <span class="pull-right"><a href="#">Forgot Password?</a></span>
                            </div>
                        </form>
                    </li>
                </ul>
            </li>
        </ul>  
    </div><!-- DROPDOWN LOGIN ENDS HERE  -->