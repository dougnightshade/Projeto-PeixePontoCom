<script src="link">
    
    $(document).ready(function() {
    $("#clique ul").hide();
});
</script> 

<!--<span class="opacity" style="display: block;"></span>-->
<!-- ======================== Left menu element-->
<!--<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left">-->
    <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left">
        <ul>
            <li class="menu-cabecalho" onclick="location = '#'"><h4>Alimentar Gaiola</h4></li>
            <li class="menu-cabecalho" id="clique"><h4>Vendas</h4>
                <ul>
                    <li onclick="location = '#'">Realizar Venda</li>
                    <li onclick="location = '#'">Pesquisar</li>
                </ul>
            </li>
            <li class="menu-cabecalho" ><h4>Biometria</h4>
                <ul class="dropdown">
                    <li onclick="location = '#'">Realizar Biometria</li>
                    <li onclick="location = '#'">Pesquisar</li>
                </ul>
            </li>
            <li class="menu-cabecalho"><h4>Entrada de Peixes</h4>
                <ul>
                    <li onclick="location = '#'">Registar Entrada em um Gaiola</li>
                    <li onclick="location = '#'">Pesquisar</li>
                </ul>
            </li>
            <li class="menu-cabecalho"><h4>Gaiolas</h4>
                <ul>
                    <li onclick="location = '#'">Cadastrar Nova Gaiola</li>
                    <li onclick="location = '#'">Pesquisar</li>
                </ul>
            </li>
            <li class="menu-cabecalho"><h4>Ração</h4>
                <ul>
                    <li onclick="location = '#'">Registrar Entrada no Estoque</li>
                    <li onclick="location = '#'">Estoque</li>
                    <li onclick="location = 'cadaRacao.jsp'">Cadastrar Nova Ração</li>
                    <li onclick="location = 'pesqRacao.jsp'">Pesquisar</li>
                </ul>
            </li>
            <li class="menu-cabecalho"><h4>Clientes</h4>
                <ul>
                    <li onclick="location = '#'">Cadastrar Novo Cliente</li>
                    <li onclick="location = '#'">Pesquisar</li>
                </ul>
            </li>
            <li class="menu-cabecalho"><h4>Fornecedores</h4>
                <ul>
                    <li onclick="location = '#'">Cadastrar Novo Fornecedor</li>
                    <li onclick="location = '#'">Pesquisar</li>
                </ul>
            </li>
            <li class="menu-cabecalho"><h4>Relatórios</h4>
                <ul>
                    <li onclick="location = '#'">Controle de Gaiolas</li>
                    <li onclick="location = '#'">Registro de Entrada de Peixes</li>
                </ul>
            </li>
        </ul>
    </nav>
