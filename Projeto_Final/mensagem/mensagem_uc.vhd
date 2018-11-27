library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity mensagem_uc is
	port(	clock, reset, enviar 		: in  std_logic;
			zero, i_pronto, Q 			: in  std_logic;
			enable, partida, o_pronto 	: out std_logic);
end mensagem_uc;

architecture mensagem_uc_arc of mensagem_uc is
	type estado is (inicio, ativa, espera, conta, pronto);
	signal sreg, snext : estado;
	
begin
	process(clock)
	begin
		if reset = '1' then 
			sreg <= inicio;
		elsif rising_edge(clock) then
			sreg <= snext;
		end if;
	end process;
	
	process(enviar, i_pronto, zero, Q)
	begin
		case sreg is
			when inicio =>	if enviar = '0' then 	snext <= inicio;
								else						snext <= ativa;
								end if;
								
			when ativa	=> snext <= espera;
			
			when espera	=> if 	i_pronto = '0' then 	snext <= espera;
								elsif zero     = '0' then	snext <= pronto;
								elsif Q        = '0' then 	snext <= conta;
								else							  	snext <= pronto;
								end if;
			
			when conta	=> snext <= ativa;
			
			when pronto	=> snext <= inicio;
		end case;
	end process;
	
	with sreg select
		enable <= '1' when conta|pronto, '0' when others;
		
	with sreg select
		partida <= '1' when ativa, '0' when others;
		
	with sreg select
		o_pronto <= '1' when pronto, '0' when others;
	
end mensagem_uc_arc;