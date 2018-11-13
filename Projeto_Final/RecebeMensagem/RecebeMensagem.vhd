
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity recebemensagem is
	port(clock : in  std_logic);
end recebemensagem;

architecture recebemensagem_arc of recebemensagem is

	component recebemensagem_fd is
		port(clock : in std_logic);
	end component;

begin
end recebemensagem_arc;