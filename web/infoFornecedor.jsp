<%-- 
    Document   : infoFornecedor
    Created on : 24/09/2016, 19:13:11
    Author     : Thiago
--%>

<%@page import="model.dao.TelefoneFornecedorDAO"%>
<%@page import="model.bean.TelefoneFornecedor"%>
<%@page import="model.dao.FornecedorDAO"%>
<%@page import="model.bean.Fornecedor"%>

<%
    Fornecedor obFornecedor = new Fornecedor();
    FornecedorDAO obFornecedorDAO = new FornecedorDAO();
    obFornecedor = obFornecedorDAO.buscarCodigo(Integer.parseInt(request.getParameter("codigo")));

    TelefoneFornecedor obTelefoneFornecedor = new TelefoneFornecedor();
    TelefoneFornecedorDAO obTelefoneFornecedorDAO = new TelefoneFornecedorDAO();

%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Informações Fornecedor</title>
        <%@include file="importsCSS.jsp" %>
    </head>
    <body>
        
        <!-- =========== Modal =========== -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Exclusão</h4>
                    </div>
                    <div class="modal-body">
                        Deseja realmente excluir?
                    </div>
                    <div class="modal-footer padding-top-0em padding-bottom-0em">
                        <form method="POST" action="ControllerFornecedor">

                            <div class="col-sm-8 col-md-8"></div>
                            <div class="col-xs-6 col-sm-2 col-md-2">
                                <button type="button" class="btn btn-default btn-block" data-dismiss="modal"><i class="glyphicon glyphicon-thumbs-down"></i> Não</button>
                            </div>
                            <div class="col-xs-6 col-sm-2 col-md-2">
                                <input type="hidden" name="inCodigo2" value="<%=obFornecedor.getFornecedorCodigo()%>">
                                <input type="hidden" name="pagina" value="exclFornecedor">
                                <button type="submit" name="btnExcluir" class="btn btn-danger btn-block"><i class="glyphicon glyphicon-thumbs-up"></i> Sim</button>
                            </div>
                        </form>
                    </div>
                </div>  <!--modal-content =============-->
            </div>      <!--modal-dialog ==================-->
        </div>          <!--model fade==========-->

        <!--=========== Menus-->
        <div>
            <%@include file="menus.jsp" %>
        </div>
        <!--Menu =================-->

        <!--================ div logo-->
        <div class="col-xs-12 col-md-4 logo-fix hide-for-small-only hide-for-medium-only">
            <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
        </div>
        <!--div logo =================-->

        <div><!-- Div Conteiner-->
            <form action="ControllerFornecedor" method="POST">

                <!--============== Painel -->
                <div class="col-xs-12 col-md-7 max-640px-margin-top-1em min-640px-margin-top-2em">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                            <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                            <h4>Informações do Fornecedor</h4></div>
                        <div class="fix-panel-body panel-body">
                            <!--======== Area dos Campos-->            

                            <div class="col-xs-12">
                                <span id="sprytextfield2">
                                    <label for="inNome">Nome Fantasia:</label>
                                    <input type="text" name="inNome" id="inNome" value="<%=obFornecedor.getFornecedorNomeFantasia()%>" readonly="">
                                    <!--<span class="textfieldRequiredMsg">Um valor é necessário.</span>-->
                                </span>
                            </div>


                            <div class="col-xs-12">
                                <span id="sprytextfield13">
                                    <label>Razão Social  </label>
                                    <input type="text" name="inRazaoSocial" id="inRazaoSocial" value="<%=obFornecedor.getFornecedorRazaSocial()%>" readonly="">
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-5">
                                <span id="sprytextfield1">
                                    <label for="inCNPJ">CNPJ:</label>
                                    <input type="text" name="inCNPJ" id="inCNPJ" value="<%=obFornecedor.getFornecedorCnpj()%>" readonly="">
                                </span>
                            </div>


                            <div class="row">
                                <div class="col-xs-12 col-sm-6">
                                    <span id="sprytextfield3" >
                                        <label for="inEmail">@ E-mail:</label>
                                        <input type="email" name="inEmail" id="inEmail" value="<%=obFornecedor.getFornecedorEmail()%>" readonly="">
                                    </span>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-12">

                                    <span id="sprytextarea1">
                                        <label>Comentários
                                            <textarea name="taComentarios" id="taComentarios" cols="45" rows="3" readonly=""><%=obFornecedor.getFornecedorComentarios()%>
                                            </textarea>
                                    </span>
                                </div>
                            </div>

                            <fieldset><legend>Endereço:</legend>
                                <div class="row">
                                    <div class="col-xs-8 col-sm-10">
                                        <span id="sprytextfield4">
                                            <label class="fix-fielset-label" for="inRua">Rua:</label>
                                            <input type="text" name="inRua" id="inRua" value="<%=obFornecedor.getFornecedorEndRua()%>" readonly="">
                                        </span>
                                    </div>

                                    <div class="col-xs-4 col-sm-2">
                                        <span id="sprytextfield6">
                                            <label class="fix-fielset-label" for="inNumero">Nº:</label>
                                            <input type="text" name="inNumero" id="inNumero" value="<%=obFornecedor.getFornecedorEndNumero()%>" readonly="">

                                        </span> 
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-9">
                                    <span id="sprytextfield5">
                                        <label for="inBairro">Bairro:</label>
                                        <input type="text" name="inBairro" id="inBairro" value="<%=obFornecedor.getFornecedorEndBairro()%>" readonly="">

                                    </span>
                                </div>

                                <div class="col-xs-6 col-sm-3">
                                    <span id="sprytextfield7">
                                        <label for="inCep">CEP:</label>
                                        <input type="text" name="inCep" id="inCep" value="<%=obFornecedor.getFornecedorEndCep()%>" readonly="">
                                    </span>
                                </div>
                            </fieldset>
                            <div class="row">
                                <fieldset><legend>Telefones:</legend>
                                    <div class="col-xs-4 col-sm-2">
                                        <span id="sprytextfield8">
                                            <label class="fix-fielset-label" for="inDddFixo">DDD:</label>
                                            <input type="text" name="inDddFixo" id="inDddFixo">
                                        </span>
                                    </div>

                                    <div class="col-xs-8 col-sm-3">
                                        <span id="sprytextfield9">
                                            <label class="fix-fielset-label" for="inTelefoneFixo"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> Fixo:</label>
                                            <input type="text" name="inTelefoneFixo" id="inTelefoneFixo">
                                        </span>
                                    </div>

                                    <div class="col-xs-4 col-sm-2">
                                        <span id="sprytextfield10">
                                            <label class="fix-fielset-label" for="inDddCelular">DDD:</label>
                                            <input type="text" name="inDddCelular" id="inDddCelular" >
                                        </span>
                                    </div>
                                    <div class="col-xs-8 col-sm-3">
                                        <span id="sprytextfield11">
                                            <label class="fix-fielset-label" for="inTelefoneCelular"><span class="glyphicon glyphicon-phone" aria-hidden="true"></span> Celular:</label>
                                            <input type="text" name="inTelefoneCelular" id="inTelefoneCelular" >
                                        </span>
                                    </div>
                                </fieldset>
                            </div>
                            <!--Fim dos Campos ===================-->

                            <!--=========== Area dos botoes -->
                            <div class="row margin-top-1em">  
                                <div class="col-xs-6 col-sm-3">
                                    <button type="button" class="btn btn-default btn-block "><span class="glyphicon glyphicon-grain"></span>Ração</button>
                                </div>
                                <div class="col-xs-6 col-sm-3">
                                    <button type="button" class="btn btn-default btn-block "><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> Fornecimentos</button>
                                </div>
                                <div class="col-xs-6 col-sm-3">
                                    <button type="button" class="btn btn-default btn-block " onclick="location = 'alteFornecedor.jsp?codigo=<%=obFornecedor.getFornecedorCodigo()%>'"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Alterar</button>
                                </div>
                                <div class="col-xs-6 col-sm-3">
                                    <button type="button" class="btn btn-default btn-block" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-trash"></span> Excluir</button>   
                                </div> 
                            </div>
                            <!--Area dos botoes ==============-->

                        </div> <!--  Painel Body===========-->
                    </div><!--panel default =================-->
                </div><!--  Painel ==================-->

            </form>
        </div>
        <%@include file="importsJS.jsp" %>
    </body>
</html>
