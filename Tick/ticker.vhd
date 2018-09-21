
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;

Entity ticker is
	generic(Constant Clk_BRate_m : integer := 7;
			  Constant Clk_BRate_n : integer := 3;
			  Constant Total_m     : integer := 11;
			  Constant Total_n     : integer := 4);
	port(serial, CLK, Reset    : in  std_logic;
	     tick, o_CLK, o_Serial : out std_logic;
		  hex_estado            : out std_logic_vector(6 downto 0);
		  o_estado              : out std_logic_vector(3 downto 0));
end ticker;

ArchiteCture Tick_Ark of ticker is
	signal s_Tick, s_Enable_c, s_Reset_c        : std_logic;
	signal s_Reset_r, s_Fim_h, s_Fim_t, s_Total : std_logic;
	signal s_estado                             : std_logic_vector(3 downto 0);
	
	component Tick_UC
		port(Fim_h, Fim_t, Total, serial, Reset, CLK : in  std_logic;
			  tick, Enable_c, Reset_c, Reset_r        : out std_logic;
			  estado                                  : out std_logic_vector(3 downto 0));
	end component;
	
	Component Tick_FD
		generic(Constant Clk_BRate_m : integer;
				  Constant Clk_BRate_n : integer;
				  Constant Total_m     : integer;
				  Constant Total_n     : integer);
	port(tick, Enable_c, Reset_c, Reset_r, CLK : in  std_logic;
		  estado                                : in std_logic_vector(3 downto 0);
		  Fim_h, Fim_t, Total                   : out std_logic;
		  hex_estado                            : out std_logic_vector(6 downto 0));
	end component;

begin
	UC: Tick_UC
	port map(s_Fim_h, s_Fim_t, s_Total, serial, Reset, CLK,
		      s_tick, s_Enable_c, s_Reset_c, s_Reset_r, s_estado);
				
	FD: Tick_FD
	generic map(Clk_BRate_m, Clk_BRate_n,
		     Total_m, Total_n)
	port map(s_tick, s_Enable_c, s_Reset_c, s_Reset_r, CLK, 
				s_estado,
				s_Fim_h, s_Fim_t, s_Total, hex_estado);
		  
	Tick <= s_Tick;
	
	o_CLK    <= CLK;
	o_Serial <= serial;
	o_estado <= s_estado;
end Tick_Ark;