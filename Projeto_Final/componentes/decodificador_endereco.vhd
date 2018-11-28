library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;

entity decodificador_endereco is
	generic(constant tam_ascii 	: integer := 8);
	port(	ascii		: in  std_logic_vector(tam_ascii-1 downto 0);
			endereco	: out std_logic_vector(2 downto 0);
			erro		: out std_logic);
end decodificador_endereco;

architecture decodificador_endereco_arc of decodificador_endereco is
begin

--------------------------
-- versao com 7 bits
--	with ascii select
--		endereco <= "000" when "0110000"|"1100001"|"1000001","001" when "0110001"|"1100010"|"1000010","010" when "0110010"|"1100011"|"1000011","011" when "0110011"|"1100100"|"1000100","100" when "0110100"|"1100101"|"1000101","101" when "0110101"|"1100110"|"1000110","110" when "0110110"|"1100111"|"1000111","111" when others;
--		
--	with ascii select
--		erro <= '0' when 	"0110000"|"1100001"|"1000001"|"0110001"|"1100010"|"1000010"|"0110010"|"1100011"|"1000011"|"0110011"|"1100100"|"1000100"|"0110100"|"1100101"|"1000101"|"0110101"|"1100110"|"1000110"|"0110110"|"1100111"|"1000111"|"0110111"|"1101000"|"1001000",'1' when others;
					
-------------------------
-- versao com 8 bits				
	with ascii select
		endereco <= "000" when "10110000"|"11100001"|"11000001",
						"001" when "10110001"|"11100010"|"11000010",
						"010" when "10110010"|"11100011"|"11000011",
						"011" when "10110011"|"11100100"|"11000100",
						"100" when "10110100"|"11100101"|"11000101",
						"101" when "10110101"|"11100110"|"11000110",
						"110" when "10110110"|"11100111"|"11000111",
						"111" when others;
		
	with ascii select
		erro <= '0' when 	"10110000"|"11100001"|"11000001"|
								"10110001"|"11100010"|"11000010"|
								"10110010"|"11100011"|"11000011"|
								"10110011"|"11100100"|"11000100"|
								"10110100"|"11100101"|"11000101"|
								"10110101"|"11100110"|"11000110"|
								"10110110"|"11100111"|"11000111"|
								"10110111"|"11101000"|"11001000",
					'1' when others;
end decodificador_endereco_arc;