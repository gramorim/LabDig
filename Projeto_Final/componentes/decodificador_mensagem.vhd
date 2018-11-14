
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;

entity decodificadorjogada is
	port(	vez, passa_vez, envia_jogada, venceu : in std_logic;
			resultado_jogada : in std_logic_vector(2 downto 0);
			mensagem : out std_logic_vector(3 downto 0);
end decodificador_jogada;

architecture decodificadorjogada_arc of decodificadorjogada is
signal s_vez, s_passa_vez, s_resultado; std_logic_vector(2 downto 0);
begin
	with venceu select
		mensagem <=	"110" 	when '1',
						s_vez 	when '0';
	
	with passa_vez select
		s_passa_vez	<=	"010" 	when '1',
							s_vez		when '0';
	
	with vez select
		S_vez <= s_resultado WHEN '1',
					"000"			when '1';
	
	with resultado_jogada select
		s_resultado <=	"101" when "10",
							"100" when others;
						
end decodificadorjogada_arc;