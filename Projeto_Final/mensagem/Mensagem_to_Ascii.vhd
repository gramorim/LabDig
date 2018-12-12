library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity Mensagem_2_Ascii is
	generic(constant tam_ascii : integer := 7);
	port(	i_mensagem : in  std_logic_vector(2 downto 0);
			ascii		: out std_logic_vector(tam_ascii-1 downto 0);
			zero		: out std_logic);
end Mensagem_2_Ascii;

architecture Mensagem_2_Ascii_arc of Mensagem_2_Ascii is
begin
-- versão com 7 bits	
	with i_mensagem select
		ascii <= 	"1010110" when "010",
						"1000001" when "100",
						"1011000" when "101",
						"1000111" when "110",
						"1000101" when others;


-- versão com 8 bits						
--	with i_mensagem select
--		ascii <= 	"11010110" when "010",
--						"11000001" when "100",
--						"11011000" when "101",
--						"11000111" when "110",
--						"11000101" when others;
		
	with i_mensagem select
		zero <=	'1' when "000",
					'0' when others;
end Mensagem_2_Ascii_arc;