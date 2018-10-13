
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;
use ieee.numeric_std.all;

entity print is
	generic(constant N_char  : integer := 16;    -- quantidade caracteres
			  constant N_end   : integer := 4;     -- quantidade bits endereçamento
			  constant Ratio_m : integer := 7;
			  constant Ratio_n : integer := 3);    
	port(clock, reset, send    : in  std_logic;
		  saida_serial, pronto  : out std_logic;
		  
		  --depuracao
		  o_estado, o_estado_tx : out std_logic_vector(3 downto 0);
		  o_trams, o_conta      : out std_logic;
		  o_end                 : out std_logic_vector(N_end-1 downto 0));
end print;

architecture print_arc of print is
	signal s_carrega, s_conta, s_zera, s_transmite, s_fim, s_pronto, s_we, s_ce, s_trams : std_logic;
	signal s_end  : std_logic_vector(N_end-1 downto 0);
	signal s_dado : std_logic_vector(6 downto 0);

	component printf_fd is
		generic(constant N_char  : integer := 16;    -- quantidade caracteres
				  constant N_end   : integer := 4;     -- quantidade bits endereçamento
				  constant Ratio_m : integer := 7;
				  constant Ratio_n : integer := 3);
		port(clock, carrega, conta, zera, transmite : in  std_logic;
			  dados                                  : in  std_logic_vector(N_end-1 downto 0);
			  we, ce                                 : in  std_logic;
			  dado_entrada                           : in  std_logic_vector(6 downto 0);
			  fim, pronto, saida_serial, transm      : out std_logic;
			  o_estado_tx                            : out std_logic_vector(3 downto 0);
			  o_end                 					  : out std_logic_vector(N_end-1 downto 0));
	end component;
	
	component print_uc is
		port(clock, send, reset, fim, pronto, trams            : in  std_logic;
			  o_pronto, carrega, conta, zera, we, ce, transmite : out std_logic;
			  o_estado                                          : out std_logic_vector(3 downto 0));
	end component;

begin
	
	s_end  <= std_logic_vector(to_unsigned(0,N_end));
	s_dado <= std_logic_vector(to_unsigned(0,7));

	FD: printf_fd
	generic map(N_char,N_end,Ratio_m,Ratio_n)
	port map(clock, s_carrega, s_conta, s_zera, s_transmite,
				s_end,
				s_we, s_ce,
				s_dado,
				s_fim, s_pronto, saida_serial, s_trams,
				o_estado_tx,
				o_end);
				
	UC: print_uc
	port map(clock, send, reset, s_fim, s_pronto, s_trams,	

			   pronto, s_carrega, s_conta, s_zera, s_we, s_ce, s_transmite,
				o_estado);
				
	o_trams <= s_trams;
	o_conta <= s_conta;

end print_arc;