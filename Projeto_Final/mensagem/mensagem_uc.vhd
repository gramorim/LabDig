
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity mensagem_uc is
	port(	clock, start, pronto, reset					: in  std_logic;
			mensagem									: in std_logic_vector (2 downto 0);
			jogada										: in std_logic_vector (13 downto 0);
			o_ascii										: out std_logic_vector (6 downto 0);
			endereco									: out std_logic_vector (2 downto 0);
			o_pronto, o_transmite, o_write				: out std_logic);
end mensagem_uc;

architecture mensagem_uc_arc of mensagem_uc is
	type estado is (inicio, transmite, verifica, espera_t, epronto, escreve1, escreve2);
	signal sreg, snext 	: estado;
	
begin
	process(clock, reset)
	begin
		if clock'event and clock = '1' then
			if reset = '1' then 	sreg <= inicio;
			else						sreg <= snext;
			end if;
		end if;
	end process;
	
	process(start, pronto, mensagem)
	begin
		case sreg is
			when inicio	=> 	if start = '0' then 	snext <= inicio;
								else						snext <= verifica;
							end if;
			
			when verifica	=> 	if mensagem 	= "000" then	snext <= escreve1;
									else snext <= transmite;
								end if;
			
			when escreve1	=>	snext <= transmite;

			when transmite  =>  snext <= espera_t;
			
			when espera_t	=> 	if pronto = '0' then 	snext <= espera_t;
									elsif mensagem = "000" then		snext <= escreve2;
									else snext <= epronto;
								end if;
			
			when escreve2	=>	snext <= transmite;					
								
			when epronto	=> snext <= inicio;
			
		end case;
	end process;
	
	with sreg select
		o_pronto	<= '1' when epronto, '0' when others;
		
	with sreg select
		endereco	<= "001" when escreve2, mensagem when others;
		
	with sreg select
		o_ascii	<= jogada(6 downto 0) when escreve1, jogada(13 downto 7) when escreve2,  	(others=>'0') when others;
		
	with sreg select
		o_transmite	<= '1' when transmite, 	'0' when others;
	
	with sreg select
		o_write	<= '1' when escreve1, '1' when escreve2,  '0' when others;

end mensagem_uc_arc;