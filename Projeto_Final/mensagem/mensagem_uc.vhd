
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity mensagem_uc is
	port(	clock, start, andamento, reset, fim			: in  std_logic;
			o_andamento, o_start, o_reset, o_enable	: out std_logic);
end mensagem_uc;

architecture mensagem_uc_arc of mensagem_uc is
	type estado is (inicio, mostra, espera, soma1);
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
	
	process(start, andamento, fim)
	begin
		case sreg is
			when inicio	=> if start = '0' then 	snext <= inicio;
								else						snext <= mostra;
								end if;
			
			when mostra	=> if andamento = '0' then	snext <= mostra;
								else							snext <= espera;
								end if;
			
			when espera	=>	if 	andamento 	= '1'	then	snext <= espera;
								elsif fim			= '0'	then	snext <= soma1;
								else									snext <= inicio;
								end if;
			
			when soma1	=>	snext <= mostra;
			
		end case;
	end process;
	
	with sreg select
		o_andamento	<= '0' when inicio, '1' when others;
		
	with sreg select
		o_start	<= '1' when mostra, '0' when others;
		
	with sreg select
		o_reset	<= '1' when inicio, '0' when others;
		
	with sreg select
		o_enable	<= '1' when soma1, '0' when others;
		
end mensagem_uc_arc;