library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity circuito_p1 is
	port(
		send, reset, clock   : in std_logic;
		load                 : in std_logic;
		saida_serial, pronto : out std_logic
	);
end entity;

architecture arch of circuito_p1 is
	component circuito_fd is
		generic(
			constant M : integer := 16; -- m é a quantidade de bits de endereco
			constant N : integer := 4 -- n é a quantidade de bits da palavra
		);
		port(
			dados_contador       : in std_logic_vector(M-1 downto 0);
			carrega, conta, zera : in std_logic;
			clock, reset         : in std_logic;
			dados_entrada        : in std_logic_vector(M-1 downto 0);
			we, ce               : in std_logic;
			transmite_dado	      : in std_logic;
			saida_contador       : out std_logic_vector(M-1 downto 0);
			fim_c, pronto        : out std_logic;
			transm_andamento     : out std_logic;
			saida_serial         : out std_logic
		);
	end component;
	
	component circuito_uc is
		port(
			send : in std_logic;
			clock, reset : in std_logic;
			load : in std_logic;
			fim_c : in std_logic;
			transmite_dado: out std_logic;
			pronto, carrega, conta: out std_logic;
			we, ce : out std_logic;
			endereco : 
		);
	end component;
end arch;
			
			