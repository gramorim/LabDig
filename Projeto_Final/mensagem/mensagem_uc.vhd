library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity mensagem_uc is
	port(	clock, reset, enviar 		: in  std_logic;
			zero, i_pronto, Q 			: in  std_logic;
			enable, o_reset, partida, o_prepara, o_pronto 	: out std_logic;
			
			--Depuração
			db_estado : out std_logic_vector(3 downto 0));
end mensagem_uc;

architecture mensagem_uc_arc of mensagem_uc is
	type estado is (inicio, prepara, ativa, espera, conta, pronto);
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
								else							snext <= prepara;
								end if;
								
			when prepara => snext <= ativa;
								
			when ativa	=> snext <= espera;
			
			when espera	=> if i_pronto = '0' then 	snext <= espera;
								else
									if zero  = '0' then	snext <= pronto;
									else
										if Q  = '0' then 	snext <= conta;
										else					snext <= pronto;
										end if;
									end if;
								end if;
			
			when conta	=> snext <= ativa;
			
			when pronto	=> snext <= inicio;
		end case;
	end process;
	
	with sreg select
		enable <= '1' when conta, '0' when others;
		
	with sreg select
		partida <= '1' when ativa, '0' when others;
		
	with sreg select
		o_pronto <= '1' when pronto, '0' when others;
		
	with sreg select
		o_reset <= '1' when inicio, '0' when others;
		
	with sreg select
		o_prepara <= '1' when prepara, '0' when others;
		
	with sreg select
		db_estado <= 	"0000" when inicio,
							"0001" when ativa,
							"0010" when espera,
							"0011" when conta,
							"0100" when pronto,
							"0101" when prepara,
							"1110" when others;
	
	
end mensagem_uc_arc;