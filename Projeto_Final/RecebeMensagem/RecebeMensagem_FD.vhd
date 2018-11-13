
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity recebemensagem_fd is
	port(clock : in std_logic);
end recebemensagem_fd;

architecture recebemensagem_fd_arc of recebemensagem_fd is

	component rx_serial is
		 generic(constant Ratio_m : integer := 100;
					constant Ratio_n : integer := 7);
		 port (clock, reset                                 : in  std_logic;
				 entrada_serial, recebe_dado, paridade        : in  std_logic;
				 hex1, hex0, hex_est, hex_cont, hex_ticker    : out std_logic_vector(6 downto 0);
				 tem_dado_recebido, paridade_ok, o_tick       : out std_logic;
				 o_serial, O_FIM                              : out std_logic;
				 o_estado                                     : out std_logic_vector(3 downto 0);
				 o_dados                                      : out std_logic_vector(9 downto 0);
				 o_dado_recebido                              : out std_logic_vector(6 downto 0));
	end component;
	
begin
end recebemensagem_fd_arc;