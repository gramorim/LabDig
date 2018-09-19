
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;

Entity Tick is
	generic(Constant Clk_BRate_m : integer := 100;
			  Constant Clk_BRate_n : integer := 7;
			  Constant Total_m     : integer := 11;
			  Constant Total_n     : integer := 4);
	port(serial, CLK, Reset : in  std_logic;
	     tick               : out std_logic);
end Tick;

ArchiteCture Tick_Ark of Tick is
	signal s_Tick, s_Enable_c, s_Reset_c        : std_logic;
	signal s_Reset_r, s_Fim_h, s_Fim_t, s_Total : std_logic;
	
	component Tick_UC
		port(Fim_h, Fim_t, Total, serial, Reset, CLK: in  std_logic;
			  tick, Enable_c, Reset_c, Reset_r       : out std_logic);
	end component;
	
	Component Tick_FD
		generic(Constant Clk_BRate_m : integer;
				  Constant Clk_BRate_n : integer;
				  Constant Total_m     : integer;
				  Constant Total_n     : integer);
		port(tick, Enable_c, Reset_c, Reset_r, CLK : in  std_logic;
			  Fim_h, Fim_t, Total                   : out std_logic);
	end component;

begin
	UC: Tick_UC
	port map(s_Fim_h, s_Fim_t, s_Total, serial, Reset, CLK,
		      s_tick, s_Enable_c, s_Reset_c, s_Reset_r);
				
	FD: Tick_FD
	generic map(Clk_BRate_m, Clk_BRate_n,
		     Total_m, Total_n)
	port map(s_tick, s_Enable_c, s_Reset_c, s_Reset_r, CLK,
		  s_Fim_h, s_Fim_t, s_Total);
		  
	Tick <= s_Tick;
	
end Tick_Ark;
