
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;

Entity Comparador is
	generic(constant N : integer := 4);
	port(A, B : in  std_logic_vector(N-1 downto 0);
		  AeB  : out std_logic);
end Comparador;

Architecture Comparador_ark of Comparador is
	signal s_temp, s_AeB : std_logic;
begin
	process(A,B,s_temp,s_AeB)
	begin
		if A = B then s_AeB <= '1';
		else          s_AeB <= '0';
		end if;
	end process;
	
	AeB <= s_AeB;
end Comparador_Ark;