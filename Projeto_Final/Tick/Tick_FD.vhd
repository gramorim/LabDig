
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;

Entity Tick_FD is
	generic(Constant Ratio_m : integer := 166;
			  Constant Ratio_n : integer := 8;
			  Constant Total_m : integer := 11;
			  Constant Total_n : integer := 4);
			  
	port(CLK, enable, reset: in  std_logic;
		  o_Tick, o_fim     : out std_logic;
		  Estado            : in  std_logic_vector(3 downto 0);
		  Hex_Estado        : out std_logic_vector(6 downto 0));
end Entity;

Architecture Tick_FD_ark of Tick_FD is
	signal s_Ratio, s_Half : std_logic_vector (Ratio_n-1 downto 0);
	signal s_Tick_counter  : std_logic_vector (Total_n-1 downto 0);
	signal s_fim, s_tick   : std_logic;

	Component Contador_m
		generic (constant M: integer;
					constant N: integer);
		port (CLK, zera, conta : in STD_LOGIC;
				Q                : out STD_LOGIC_VECTOR (N-1 downto 0);
				fim              : out STD_LOGIC);
	end component;
	
	component hex7seg
		port (binary     : in std_logic_vector(3 downto 0);
				enable     : in std_logic;
				hex_output : out std_logic_vector(6 downto 0));
	end component;
	
begin
	Contador_ratio: Contador_m
	generic map(Ratio_m, Ratio_n)
   port map(CLK, reset, enable,
				s_Ratio, s_fim);
				
	s_Half <= conv_std_logic_vector(Ratio_m/2 - 1,Ratio_n);
	
	process(s_Half,s_Ratio)
	begin
		if s_half = s_Ratio then s_tick <= '1';
		else                     s_tick <= '0';
		end if;
	end process;
	
	o_tick <= s_tick;
	
	Contador_tick: Contador_m
	generic map(Total_m+1,Total_n)
   port map(CLK, reset, s_fim,
				OPEN, o_fim);
	
	HexEstado: hex7seg
	port map(estado,'1',hex_estado);
end Tick_FD_ark;