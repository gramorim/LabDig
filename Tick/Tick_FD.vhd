
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;

Entity Tick_FD is
	generic(Constant Clk_BRate_m : integer := 166;
			  Constant Clk_BRate_n : integer := 8;
			  Constant Total_m     : integer := 11;
			  Constant Total_n     : integer := 4);
	port(tick, Enable_c, Reset_c, Reset_r, CLK : in  std_logic;
		  estado                                : in std_logic_vector(3 downto 0);
		  Fim_h, Fim_t, Total                   : out std_logic;
		  hex_estado                            : out std_logic_vector(6 downto 0));
end Entity;

Architecture Tick_FD_ark of Tick_FD is
	signal s_Tempo, s_Half : std_logic_vector (Clk_BRate_n-1 downto 0);
	signal s_Tick_counter  : std_logic_vector (Total_n-1 downto 0);

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

	Contador_tempo: Contador_m
	generic map(Clk_BRate_m, Clk_BRate_n)
   port map(CLK, reset_c, enable_c,
				s_Tempo, fim_t);
				
	s_Half <= conv_std_logic_vector(Clk_BRate_m/2,Clk_BRate_n);
	
	process(s_Half,s_tempo)
	begin
		if s_half = s_tempo then fim_h <= '1';
		else                     fim_h <= '0';
		end if;
	end process;
	
	Contador_tick: Contador_m
	generic map(Total_m,Total_n)
   port map(CLK, reset_r, tick,
				s_Tick_counter, Total);
	
	HexEstado: hex7seg
	port map(estado,'1',hex_estado);
	
end Tick_FD_ark;