<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header ">

            <!--============== Botão quando desktop-->
            <a id="btn-navTopMenu" class="show-for-medium toggle-menu menu-left">
                <i class="fa fa-navicon fa-2x navbar-brand-principal"></i>
            </a>
            <!--Botão quando desktop =============-->
        </div>
        <!-- /.navbar-header -->


        <div class="dashboard show-for-medium">
            <!-- ====================== Area de Trabalho-->
            <ul class="nav navbar-nav text-center">
                <li class="active bold">
                    <a href="principal.jsp">
                        Área de Trabalho
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
                    <!--Aqui e para importar a tela de notificações-->
                    <%--<%@include file="notificacoes.jsp"%>--%>
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



            <!--==================== Area de Uusário-->
            <li class="dropdown">
                <a class="dropdown-toggle hide-for-small-only bold" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i> Usuário
                </a>
                <a class="dropdown-toggle show-for-small-only" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
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

            <!--=============== Botão quando celular-->
            <button type="button" class="navbar-toggle toggle-menu menu-left" data-toggle="collapse" data-target=".navbar-collapse" id="btn-navTopMenu">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!--Botão quando celular ======================-->

        </ul>
        <!-- /.navbar-top-links -->




















        <!--======================== Menu Lateral-->
        <div class="navbar-default sidebar cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" role="navigation">
            <!--<div class="navbar-default sidebar" role="navigation">-->
            <div class="sidebar-nav navbar-collapse bold">
                <ul class="nav" id="side-menu">
                    <li><a><i class="fa fa-pagelines"></i> Alimentar Gaiola</a></li>

                    <li>
                        <a href="#"><span class="glyphicon glyphicon-plus-sign"></span> Vendas<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li onclick="location = '#'" >
                                <a><span class="glyphicon glyphicon-plus-sign"></span> Realizar Venda</a>
                            </li>
                            <li onclick="location = '#'">
                                <a><span class="glyphicon glyphicon-search"></span> Pesquisar</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>

                    <li onclick="location='registrarEntradaRacaoPesqRacao.jsp'"><a><i class="fa fa-pagelines"></i> Registrar Entrada Ração</a></li>
                    
                    
                    <li onclick="location='biometriaPesqGaiola.jsp'"><a><i class="fa fa-refresh"></i> Realizar Biometria</a></li>

                    <li>
                        <a href="#"><i class="fa fa-archive"></i> Entrada de Peixes<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li onclick="location = 'regeEntrLoteDePeixesPesqGaiolaDisponiveis.jsp'">
                                <a><i class="fa fa-archive"></i> Registar Entrada</a>
                            </li>
                            <li onclick="location = 'regeEntrLoteDePeixesLotesAtivos.jsp'">
                                <a><span class="glyphicon glyphicon-search"></span> Pesquisar</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-male"></i> Cliente<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li onclick="location = 'cadaCliente.jsp'">
                                <a><i class="fa fa-male"></i> Cadastrar Novo</a>
                            </li>
                            <li onclick="location = 'pesqCliente.jsp'">
                                <a><span class="glyphicon glyphicon-search"></span> Pesquisar</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-pagelines"></i> Ração<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li onclick="location = 'cadaRacao.jsp'">
                                <a><i class="fa fa-pagelines"></i> Cadastrar Nova</a>
                            </li>
                            <li onclick="location = 'pesqRacao.jsp'">
                                <a><i class="fa fa-archive"></i> Estoque</a>
                            </li>

                        </ul>
                        <!-- /.nav-second-level -->
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-users"></i> Fornecedor<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li onclick="location = 'cadaFornecedor.jsp'">
                                <a><i class="fa fa-users"></i> Cadastrar Novo</a>
                            </li>
                            <li onclick="location = 'pesqFornecedor.jsp'">
                                <a><span class="glyphicon glyphicon-search"></span> Pesquisar</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-object-group"></i> Gaiola<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li onclick="location = 'cadaGaiola.jsp'">
                                <a><i class="fa fa-object-group"></i> Cadastrar Nova</a>
                            </li>
                            <li onclick="location = 'pesqGaiolaV2.jsp'">
                                <a><span class="glyphicon glyphicon-search"></span> Pesquisar</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>


                    <li>
                        <a href="#"><i class="fa fa-building"></i> Relatórios<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li onclick="location = 'pesqRacao.jsp'">
                                <a><i class="fa fa-building"></i> Controle de Gaiolas</a>
                            </li>
                            <li onclick="location = 'RelCodRegistro.jsp'" >
                                <a><i class="fa fa-building"></i> Registros de Lotes</a>
                            </li>
                            <li onclick="location = 'cadaRacao.jsp'">
                                <a><i class="fa fa-building"></i> Controle de Vendas</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>




                    <li>
                        <a href="#"><i class="fa fa-user"></i> Funcionário<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li onclick="location = 'cadaFuncionario.jsp'">
                                <a><i class="fa fa-user"></i> Cadastrar Novo</a>
                            </li>
                            <li onclick="location = 'pesqFuncionario.jsp'">
                                <a><span class="glyphicon glyphicon-search"></span>     Pesquisar</a>
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

    <!--<button id="btn-back" class="btn btn-default margin-top-0em hide-for-small-only">Voltar</button>-->


</div>