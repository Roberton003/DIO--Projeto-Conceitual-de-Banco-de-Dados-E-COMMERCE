show table;
describe cliente;
-- Cliente: Nome;CPF;veiculo.
insert into cliente (Nome,CPF,veiculo)
		values  ( ' Leornado Paiva ' ,  12345000000  , ' Polo'),
				( ' Leornado Coinmbra ' ,  12345000220  , ' Scania'),
                ( ' Leornado Flavio' ,  12345030000  , ' Toro'),
				( ' Leornado Costa ' ,  12345003300  , ' Ferrari');

describe Veiculos;
-- Veiculos: Categoria ENUM( 'Passeio', 'Carga', 'Transporte'), Modelo, Chassi, tipo_de_serviço ),
insert into Veiculos (Categoria, Modelo, Chassi ,Tipo_de_Serviço)
		values	( ' Passeio' , ' hatch ' , ' fG2342GTY2223' , 'Conserto', 'revisão periódica' ),
				( ' Carga' , ' 3T ' , ' AC2342GTY2244' , 'revisão periódica' ),
				( ' Passeio' , ' SUV ' , ' JT2342GTY3388' , 'revisão periódica' ),
                ( ' Passeio' , ' Conversível ' , ' FF2342FFF1234' , 'revisão periódica' );
select  *  from cliente;
select  *  from Veiculos;

desc Ordem_de_Serviço;
-- Ordem de Serviço: Data_OS, Veiculo,Data_de_entrega,valor , Status_OS
insert into Ordem_de_Serviço(Data_OS, Veiculo,Data_de_entrega,valor , Status_OS)
			values	( 2022-10-25, 'Polo',2022-11-1, 2300, 'Em execução'),
					( 2022-10-20, 'Polo',2022-10-3, 5300, 'Revisão'),
					( 2022-10-23, 'Polo',2022-10-27, 5600, ' Entregue '),
					( 2022-10-28, 'Polo',2022-11-3, 8300, 'Em execução');
describe Equipes;
-- Equipes: Especialidade, funcionário
insert into equipe (Especialidade, funcionário)
		values	( ' Elétrica ' , ' Antônio Rocha '),
				( ' Motor ' , 'João Arruda'),
				( ' Pintura ' , ' Marco Rocha '),
				( ' Estofado ' , 'João Miguel');

select  *  from Ordem_de_Serviço;
select  *  from Equipes;


desc Funcionarios;
-- Funcionarios: Numero_carteira; Data_adesão; Valor_em_conta; Valor_de_cashback;
insert into Funcinarios (Nome, Endereço, Especialidade )
		values	( ' Antônio Rocha ' , ' Rua 47, Flores ' , ' Elétrica ' ),
				( ' João Arruda ' , ' Rua nova, Pizon ' , ' Motor  ' , ),
				( ' Marco Rocha ' , ' Rua 17, Flores ' , ' Pintura ' ,),
				( ' João Miguel' , ' Rua Antiga, Pizon ' , ' Estofado'  )
                
describe Estoque_de_Pecas;
-- Estoque de Peças: Quantidade; nome da peça ; preço ; marca; modelo
insert into Estoque_de_Pecas(Quantidade, nome_da_peça , preco , marca, modelo )
		values  ( 10 , ' para-choque ' , 2300, ' WV' , ' WV-201 ' ),
				( 14 , ' vidro dianteiro ' , 1300, ' Fiat' , ' F-002'),
				( 05 , ' porta-direita ' , 1100, ' Fiat' , ' F-565 ' ),
				( 14 , ' cabo de freio ' , 300, ' Ferrari' , ' FI-012'),
				;

select  *  from equipe;
select  *  from Funcinarios;
select  *  from Estoque_de_Pecas;

describe Serviços;
-- Serviços: tipo ; Tipo de Serviço; Tempo para conclusão; valor;
insert into Serviços(Tipo de Serviço, Tempo para conclusão, valor) 
		values 	( ' Lanternagem  ', ' 6h ' , 2400 ),
				( ' Regulagem de motor ', ' 8h ' , 1300 ),
                ( ' Ajuste de Amortecedores  ', ' 1h ' , 500 ),
				( ' Revisão ', ' 3h ' , 1700 )
                ;


describe Tabela_de_Serviços;
-- Tabela de Serviços: Tipo de Serviços, peças, especialidade;
insert into Tabela_de_Serviços (Tipo_de_Serviços, Numeros_pecas, especialidade)
		values	( 'Revisão' , 5 , 'Mecânica'),
				( 'Manutenção corretiva' , 8 , 'Mecânica'),
                ( 'Manutenção preventiva' , 6 , 'Mecânica e elétrica'),
                ( 'Regulagem mecânica', 2 , 'Mecânica'),
                ( 'Revisão' , 3 , 'elétrica');
				
-- Contando o numero de clientes cadastrados
select  count(*) from cliente;

-- Recuperando os dados dos clientes queerriando
select  * from serviços
where  Tipo_de_Serviços
order by Tipo_de_Serviços;

select  *  from Estoque_de_Pecas
			where  Quantidade > 3
            order by preco

