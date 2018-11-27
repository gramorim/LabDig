library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity MensagemDecodificador is
	port(	mensagem : in  std_logic_vector(2 downto 0);
			ascii		: out std_logic_vector(6 downto 0);
			zero		: out std_logic);
end MensagemDecodificador;

architecture MensagemDecodificador_arc of MensagemDecodificador is
begin
	with mensagem select
		ascii <= 	"1010110" when "010",
						"1000001" when "100",
						"1011000" when "101",
						"1000111" when "110",
						"1000101" when others;
		
	with mensagem select
		zero <=	'1' when "000",
					'0' when others;
end MensagemDecodificador_arc;