
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity mensagem is
	generic(	constant M : integer := 8;
				constant N : integer := 3);
	port(	clock, start, andamento, reset 	: in  std_logic;
			o_andamento, o_start					: out std_logic;
			ascii										: out std_logic_vector(6 downto 0));
end mensagem;

architecture mensagem_arc of mensagem is
	signal s_reset, s_enable, s_fim	: std_logic;
	
	component mensagem_fd is
		generic(	constant M : integer := 8;
					constant N : integer := 3);
		port(	clock, reset, enable	: in  std_logic;
				fim						: out std_logic;
				ascii						: out std_logic_vector(6 downto 0));
	end component;
	
	component mensagem_uc is
		port(	clock, start, andamento, reset, fim			: in  std_logic;
				o_andamento, o_start, o_reset, o_enable	: out std_logic);
	end component;
	
begin

	FD : mensagem_fd
		generic map(M,N)
		port map(	clock, s_reset, s_enable,
						s_fim,
						ascii);
						
	UC : mensagem_uc
		port map(	clock, start, andamento, reset, s_fim,
						o_andamento, o_start, s_reset, s_enable);
end mensagem_arc;