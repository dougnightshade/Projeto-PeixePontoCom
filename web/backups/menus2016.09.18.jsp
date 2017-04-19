<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header ">

            <!--=============== Botão quando celular-->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse" id="btn-navTopMenu">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!--Botão quando celular ======================-->

            <!--============== Botão quando desktop-->
            <a id="btn-navTopMenu" class="hide-for-small-only">
                <i class="fa fa-navicon fa-2x navbar-brand-principal"></i>
            </a>
<!--            <a id="btn-navTopMenu" class="hide-for-small-only toggle-menu menu-left">
                <i class="fa fa-navicon fa-2x navbar-brand-principal"></i>
            </a>-->
            <!--Botão quando desktop =============-->
        </div>
        <!-- /.navbar-header -->


        <div class="dashboard">
            <!-- ====================== Area de Trabalho-->
            <ul class="nav navbar-nav text-center">
                <li class="active">
                    <a href="principal.jsp">
                        Dashboard
                    </a>
                </li>
            </ul>
        </div>


        <ul class="nav navbar-top-links navbar-right">

            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-messages">
                    <li>
                        <a href="#">
                            <div>
                                <strong>John Smith</strong>
                                <span class="pull-right text-muted">
                                    <em>Yesterday</em>
                                </span>
                            </div>
                            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <strong>John Smith</strong>
                                <span class="pull-right text-muted">
                                    <em>Yesterday</em>
                                </span>
                            </div>
                            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <strong>John Smith</strong>
                                <span class="pull-right text-muted">
                                    <em>Yesterday</em>
                                </span>
                            </div>
                            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>Read All Messages</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-messages -->

                <!--===================== Area do controle de gaiolas-->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-tasks">
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>Task 1</strong>
                                    <span class="pull-right text-muted">40% Complete</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                        <span class="sr-only">40% Complete (success)</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>Task 2</strong>
                                    <span class="pull-right text-muted">20% Complete</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                        <span class="sr-only">20% Complete</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>Task 3</strong>
                                    <span class="pull-right text-muted">60% Complete</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        <span class="sr-only">60% Complete (warning)</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>Task 4</strong>
                                    <span class="pull-right text-muted">80% Complete</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                        <span class="sr-only">80% Complete (danger)</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>See All Tasks</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-tasks -->
            </li>
            <!-- /.dropdown -->















            <!--==================== Alertas--> 
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-comment fa-fw"></i> New Comment
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                <span class="pull-right text-muted small">12 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-envelope fa-fw"></i> Message Sent
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-tasks fa-fw"></i> New Task
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>See All Alerts</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-alerts -->
            </li>
            <!-- /.dropdown -->












            <!--==================== Area de Uusário-->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i> Usuário
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->




















        <!--======================== Menu Lateral-->
        <!--<div class="navbar-default sidebar cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" role="navigation">-->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li><a>Alimentar Gaiola</a></li>


                    <li>
                        <a href="#">Vendas<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li onclick="location = '#'">
                                <a><i class="fa fa-archive"></i> Realizar Venda</a>
                            </li>
                            <li onclick="location = '#'">
                                <a>Pesquisar</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>

                    <li><a>Realizar Biometria</a></li>

                    <li>
                        <a href="#">Entrada de Peixes<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li onclick="location = '3'">
                                <a><i class="fa fa-archive"></i> Registar Entrada</a>
                            </li>
                            <li onclick="location = '#'">
                                <a>Pesquisar</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>

                    <li>
                        <a href="#">Cliente<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li onclick="location = 'cadaCliente.jsp'">
                                <a><i class="fa fa-archive"></i> Cadastrar Novo</a>
                            </li>
                            <li onclick="location = 'pesqCliente.jsp'">
                                <a>Pesquisar</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>

                    <li>
                        <a href="#">Ração<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li onclick="location = 'cadaRacao.jsp'">
                                <a>Cadastrar Nova</a>
                            </li>
                            <li onclick="location = 'pesqRacao.jsp'">
                                <a><i class="fa fa-archive"></i> Estoque</a>
                            </li>

                        </ul>
                        <!-- /.nav-second-level -->
                    </li>

                    <li>
                        <a href="#">Fornecedor<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li onclick="location = 'cadaFornecedor.jsp'">
                                <a><i class="fa fa-archive"></i> Cadastrar Novo</a>
                            </li>
                            <li onclick="location = 'pesqFornecedor.jsp'">
                                <a>Pesquisar</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>

                    <li>
                        <a href="#">Gaiola<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li onclick="location = 'cadaGaiola.jsp'">
                                <a><i class="fa fa-archive"></i> Cadastrar Nova</a>
                            </li>
                            <li onclick="location = 'pesqGaiola.jsp'">
                                <a>Pesquisar</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>


                    <li>
                        <a href="#">Relatórios<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li onclick="location = 'pesqRacao.jsp'">
                                <a><i class="fa fa-archive"></i>Controle de Gaiolas</a>
                            </li>
                            <li onclick="location = 'cadaRacao.jsp'">
                                <a>Controle de Vendas</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>


                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>