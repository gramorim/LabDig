library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;

entity decodificador_endereco is
	port(	ascii		: in  std_logic_vector(6 downto 0);
			endereco	: out std_logic_vector(2 downto 0);
			erro		: out std_logic);
end decodificador_endereco;

architecture decodificador_endereco_arc of decodificador_endereco is
begin
	with ascii select
		endereco <= "000" when "0110000"|"1100001"|"1000001",
						"001" when "0110001"|"1100010"|"1000010",
						"010" when "0110010"|"1100011"|"1000011",
						"011" when "0110011"|"1100100"|"1000100",
						"100" when "0110100"|"1100101"|"1000101",
						"101" when "0110101"|"1100110"|"1000110",
						"110" when "0110110"|"1100111"|"1000111",
						"111" when others;
		
	with ascii select
		erro <= '0' when 	"0110000"|"1100001"|"1000001"|
								"0110001"|"1100010"|"1000010"|
								"0110010"|"1100011"|"1000011"|
								"0110011"|"1100100"|"1000100"|
								"0110100"|"1100101"|"1000101"|
								"0110101"|"1100110"|"1000110"|
								"0110110"|"1100111"|"1000111"|
								"0110111"|"1101000"|"1001000",
					'1' when others;
end decodificador_endereco_arc;