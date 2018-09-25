
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;

Entity ticker is
	generic(Constant Ratio_m : integer := 7;
			  Constant Ratio_n : integer := 3;
			  Constant Total_m : integer := 11;
			  Constant Total_n : integer := 4);
			  
	port(CLK, serial, Reset    : in  std_logic;
	     tick, o_CLK, o_Serial : out std_logic;
		  hex_estado            : out std_logic_vector(6 downto 0);
		  o_estado              : out std_logic_vector(3 downto 0));
end ticker;

ArchiteCture Tick_Ark of ticker is
	signal s_fim, s_enable, s_reset : std_logic;
	signal s_estado                 : std_logic_vector(3 downto 0);
	
	component Tick_UC
		port(CLK, serial, fim, Reset : in  std_logic;
			  enable, o_reset         : out std_logic;
			  estado                  : out std_logic_vector(3 downto 0));
	end component;
	
	Component Tick_FD
		generic(Constant Ratio_m : integer := 166;
				  Constant Ratio_n : integer := 8;
				  Constant Total_m : integer := 11;
				  Constant Total_n : integer := 4);
				  
		port(CLK, enable, reset: in  std_logic;
			  o_Tick, o_fim     : out std_logic;
			  Estado            : in  std_logic_vector(3 downto 0);
			  Hex_Estado        : out std_logic_vector(6 downto 0));
	end component;

begin
	UC: Tick_UC
		port map(CLK, serial, s_fim, Reset,
		         s_enable, s_reset,
			      s_estado);
				
	FD: Tick_FD
	generic map(Ratio_m, Ratio_n,
			      Total_m, Total_n)
	port map(CLK, s_enable, s_reset,
		      Tick, s_fim,
		      s_Estado,
		      Hex_Estado);
	
	o_CLK    <= CLK;
	o_Serial <= serial;
	o_estado <= s_estado;
end Tick_Ark;
