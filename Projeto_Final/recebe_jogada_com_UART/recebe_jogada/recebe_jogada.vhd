library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity recebe_jogada is
	generic(	constant N_ascii  : integer := 2;     -- Numero de characteres desejados
				constant log2N		: integer := 2;
				constant tam_ascii 	: integer := 8);
	port(
		clock, reset, enable:     in std_logic;
		tem_dado_rec:     		  in std_logic;
		jogada_parcial:   		  in std_logic_vector(tam_ascii-1 downto 0);
		endereco:           		  out std_logic_vector(5 downto 0);
		jogada:         			out std_logic_vector (2*tam_ascii-1 downto 0);
		pronto:			  		  out std_logic;
		recebe_dado:              out std_logic;
		erro	: out std_logic--;
		--Debugging
		--db_c:						 out std_logic_vector(1 downto 0);
		--db_escreve:               out std_logic;
		--db_estado:					out std_logic_vector(3 downto 0);
		--db_teste: 			 out std_logic
	);
end entity;

architecture recebe_jogada_arch of recebe_jogada is
	signal fim_c, enable_c, escreve, reset_c: std_logic;
	component recebe_jogada_uc is
		port(
			tem_dado_recebido:      in std_logic;
			fim_c, clock:           in std_logic;
			reset, enable:          in std_logic;
			recebe_dado:            out std_logic;
			enable_c, reset_c:      out std_logic;
			reg_write:              out std_logic;
			db_estado:					out std_logic_vector(3 downto 0);
			pronto:					   out std_logic
		);
	end component;

	component recebe_jogada_fd is
	generic(	constant N_ascii  : integer := 2;     -- Numero de characteres desejados
				constant log2N		: integer := 2;
				constant tam_ascii 	: integer := 8);
		
	port(
		clock, escreve:       in std_logic;
		enable_c:  			  in std_logic;
		reset_c, reset_r:     in std_logic;
		jogada_parcial:       in std_logic_vector (tam_ascii-1 downto 0);
		fim_c:                out std_logic;
		db_c:						 out std_logic_vector(1 downto 0);
		db_teste: 			 out std_logic;
		endereco:               out std_logic_vector (5 downto 0);
		jogada:         out std_logic_vector (2*tam_ascii-1 downto 0);
		erro	: out std_logic
	);
	end component;
	
begin
	FD: recebe_jogada_fd generic map (N_ascii,log2n,tam_ascii) port map (clock, escreve, enable_c, reset_c, reset,
									jogada_parcial, fim_c, open, open, endereco, jogada, erro);
	UC: recebe_jogada_uc port map (tem_dado_rec, fim_c, clock, reset, enable,
									recebe_dado, enable_c, reset_c, escreve, open, pronto);
	--db_escreve <= escreve;
end architecture;