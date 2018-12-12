library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity BatalhaNaval_uc is
	port(	
			clock, reset, pronto 					: in  std_logic;
			iniciou 										: in  std_logic;
			enable_r_m, enable_r_j, enable_e_m	: out std_logic;
			mensagem_sel										: out std_logic_vector(2 downto 0)
	);
			
end BatalhaNaval_uc;

architecture BatalhaNaval_uc_arch of BatalhaNaval_uc is
	type estado is (inicio, espera_jogada, envia_jogada, espera, recebeu_resposta, passa_Vez);
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
	
	process(iniciou, pronto)
	begin
		case sreg is
			when inicio =>	if iniciou = '1' then 	snext <= espera_jogada;
								else							snext <= inicio;
								end if;
								
			when espera_jogada => 	if pronto = '1' then snext <= envia_jogada;
											else 						Snext <= espera_jogada;
											end if;
			
			when envia_jogada	=> Snext <= espera;
			
			when espera	=> if pronto = '1' then snext <= recebeu_resposta;
								else 						Snext <= espera;
								end if;
			when recebeu_resposta => Snext <= passa_vez;
			
			when passa_vez => Snext <= inicio;
		end case;
	end process;
	
	with sreg select
		enable_r_j <= '1' when espera_jogada, '0' when others;
		
	with sreg select
		enable_e_m <= '1' when envia_jogada|passa_vez, '0' when others;
		
	with sreg select
		enable_r_m <= '1' when espera, '0' when others;
		
	
	with sreg select
		mensagem_sel <= 	"000" when envia_jogada,
								"010" when passa_vez,
								"100" when others;
	
end BatalhaNaval_uc_arch;