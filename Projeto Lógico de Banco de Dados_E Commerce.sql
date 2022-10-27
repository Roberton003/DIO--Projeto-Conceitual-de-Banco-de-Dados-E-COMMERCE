-- criação do banco de dados para E-commerce

create database E-commerce ;
use E-commerce;

-- criar tabela cliente
create  table cliente  (
		idCliente int auto_increment primary key,
        Nome_Completo varchar ( 45 ),
        CPF char ( 11 ) not null ,
        constraint unique_cpf_cliente unique(CPF),
        Data_de_nascimento date not null ,
		Telefone char ( 11 ) not null ,
        
);
desc cliente;

-- criar tabela produto
create table produto (
		idProduto int auto_increment primary key,
        Categoria ENUM( ' Eletrônicos ' , ' Automotivo ' , ' Beleza e Perfumaria ' ,
						' Brinquedos ' , ' Celular e Smartphone ' , ' Decoração ' , ' Eletrodomésticos ' ,
                        ' Esporte e Lazer ' , ' Ferramentas ' , ) not null ,
		Descricao varchar ( 200 ) not null ,
        valor float não null ,
        Dimensões varchar ( 10 )
);
-- criar tabela pedido
create table  pedido (
		idPedidos int auto_increment primary key ,
        idCliente int ,
        Status_do_pedido enum( ' Cancelado ' , ' Em andamento ' , ' Processando ' , ' Enviado ' , ' Entregue ' ) default ' Processando ' ,
        Descricao varchar ( 120 ) not null ,
        Data_do_pedido date  not null ,
        frete float
        constraint fk_pedido_cliente foreign key (idPedidoCliente) references cliente(idCliente),
        constraint fk_pedido_entrega foreign key (idPedidoEntrega) references entrega(idEntrega),
        constraint fk_pedido_formas_pagamento foreign key (idPedidoFormas_pagamento) references formas_pagamento(idFormas_pagamento)
);

desc pedidos;

-- Criar tabela de Formas de Pagamento
create table  formas_pagamento (
		idFormas_pagamento int auto_increment primary key ,
        idFormas_pagamento_cliente int ,
        idFormas_pagamento_pagamento_cartao int ,
	    Pix varchar ( 45 ),
        Deposito varchar ( 255 ),
        Cartão varchar ( 255 ),
        constraint fk_Formas_pagamento_cliente foreign key (idFormas_pagamento_cliente) references cliente(idCliente),
        constraint fk_Formas_pagamento_cartao foreign key (idFormas_pagamento_pagamento_cartao) references pagamento_cartao(idPagamento_cartao),
        
);
-- criar tabela Estoque
create table  estoque (
		idEstoque int auto_increment primary key ,
        Localidade varchar ( 45 ) not null ,
        Quantidade varchar ( 45 ) not null ,
        
);

-- criar tabela Fornecedor
create table  fornecedor  (
		idFornecedor int auto_increment primary key ,
        Razao_social varchar ( 45 ) not null ,
        CNPJ char ( 14 ) not null ,
        constraint unique_cpf_cliente unique(CNPJ)
        Endereço varchar ( 100 ),
        Telefone char ( 11 ) not null ,
        constraint unique_fornecedor unique(CNPJ)
);
desc Fornecedor;

-- criar tabela Terceiro - Vendedor
create table  Terceiro_vendedor  (
		idTerceiro_Vendedor int auto_increment primary key ,
        Razao_social varchar ( 45 ) não nulo ,
        Nome_fantasia varchar ( 45 ),
        CNPJ char ( 15 ) not null ,
        CPF char ( 9 ) not null ,
        -- restrição unique_vendedor único (CPF_CNPJ),
        Local_vendedor varchar ( 45 ),
        Nome_vendedor varchar ( 45 ) not null ,
        Email varchar ( 45 ) not null ,
        Telefone char ( 11 ) not null ,
        constraint unique_cnpj_vendedor unique(CNPJ),
        constraint unique_cpf_vendedor unique(CPF)
);


-- criar  tabela  produto_vendedor
create table produto_vendedor (
		idTerceiro_Vendedor int ,
        idProdutos int ,
        Quantidade_produto int default 1 ,
        primary key (idTerceiro_Vendedor, idProdutos),
        constraint fk_produto_vendedor foreign key (idTerceiro_Vendedor) references vendedor(idTerceiro_Vendedor),
        constraint fk_produto_produto foreign key (idProdutos) references produto(idProdutos)
);

desc produto_vendedor;

-- criar tabela produto_pedido
	create table  produto_pedido (
		idProdutos int ,
        idPedidos int ,
        Quantidade_produto int default 1 ,
        Status_produtos ENUM( ' Disponivel ' , ' Sem estoque ' ) default ' Disponivel '  not null ,
        primary key (idPeProduto, idPedido),
        constraint fk_produto_pedido foreign key (idProdutos) references produto(idProdutos),
        constraint fk_produto_produto foreign key (idPedidos) references pedido(idPedidos)
        );
-- cria tabela Entrega
create table  entrega (
		idEntrega int auto_increment primary key ,
        idEntregaTransporte_Frete int ,
        Cod_rastreio varchar ( 45 ) not null ,
        Status_entrega ENUM( ' Em Separação' ,' Na rota de entrega ' , ' Entregue ' ) not null ,
        Prazo_entrega date  not null ,
        Empresa_Responsavel varchar(30) not null ,
        constraint fk_Transporte_Frete foreign key (idEntregaTransporte_Frete) references Transporte_Frete(idTransporte_Frete)
);