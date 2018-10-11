
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;
use ieee.numeric_std.all;

entity print is
	generic(constant N_char : integer := 16;    -- quantidade caracteres
			  constant N_end  : integer := 4);    -- quantidade bits endereçamento
	port(clock, reset, send   : in  std_logic;
		  saida_serial, pronto : out std_logic);
end print;

architecture print_arc of print is
	signal s_carrega, s_conta, s_zera, s_transmite, s_fim, s_pronto : std_logic;
	signal s_end : std_logic_vector(N_end-1 downto 0);

	component printf_fd is
		generic(constant N_char : integer := 16;    -- quantidade caracteres
				  constant N_end  : integer := 4);    -- quantidade bits endereçamento
		port(clock, carrega, conta, zera, transmite : in  std_logic;
			  dados                                  : in  std_logic_vector(N_end-1 downto 0);
			  fim, pronto, saida_serial              : out std_logic);
	end component;

begin
	
	s_end <= std_logic_vector(to_unsigned(0,N_end));

	FD: printf_fd
	generic map(N_char,N_end)
	port map(clock, s_carrega, s_conta, s_zera, s_transmite,
				s_end,
				s_fim, s_pronto, saida_serial);

end print_arc;