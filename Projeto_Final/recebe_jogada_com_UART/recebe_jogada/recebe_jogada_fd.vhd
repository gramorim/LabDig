library ieee;
use ieee.std_logic_1164.all;

entity recebe_jogada_fd is
	generic(	constant N_ascii  : integer := 2;     -- Numero de characteres desejados
				constant log2N		: integer := 2;
				constant tam_ascii 	: integer := 7);
	port(
		clock, escreve:       in std_logic;
		enable_c:  			  in std_logic;
		reset_c, reset_r:     in std_logic;
		jogada_parcial:       in std_logic_vector (tam_ascii-1 downto 0);
		fim_c:                out std_logic;
		db_c:						 out std_logic_vector(1 downto 0);
		db_teste: 			 out std_logic;
		endereco:               out std_logic_vector (5 downto 0);
		jogada : 					out std_logic_vector(2*tam_ascii-1 downto 0);
		erro	: out std_logic
	);
end entity;

architecture recebe_jogada_fd_arch of recebe_jogada_fd is
	signal s_endereco: std_logic_vector(1 downto 0);

	component contador_m is
		generic (
			constant M: integer;  -- m�dulo do contador
			constant N: integer  -- n�mero de bits da sa�da
		);
		 port (
			  CLK, zera, conta: in STD_LOGIC;
			  Q: out STD_LOGIC_VECTOR (N-1 downto 0);
			  fim: out STD_LOGIC
		 );
	end component;
	
	component buffer_jogada is
	generic(constant tam_ascii 	: integer := 7);
		port(
			clock, reset:   in  std_logic;
			endereco:       in  std_logic;
			jogada_parcial: in  std_logic_vector (tam_ascii-1 downto 0);
			escreve:        in  std_logic;
			jogada:         out std_logic_vector (2*tam_ascii-1 downto 0);
			teste: 			 out std_logic
		);
	end component;
	
	component decodificador_endereco is
		generic(constant tam_ascii 	: integer := 7);
		port(	ascii		: in  std_logic_vector(tam_ascii-1 downto 0);
				endereco	: out std_logic_vector(2 downto 0);
				erro		: out std_logic);
	end component;
	
	signal s_jogada : std_logic_vector(2*tam_ascii-1 downto 0);
	signal s_erro1, s_erro2 : std_logic;
begin
	
	U1: contador_m  generic map (N_ascii+1, log2N)
					port map (clock, reset_c, enable_c, s_endereco, fim_c);
	U2: buffer_jogada 
		generic map(tam_ascii)
		port map (clock, reset_r, s_endereco(0), jogada_parcial, escreve, s_jogada, db_teste);
	db_c <= s_endereco;
	
	enddec1 : decodificador_endereco
		generic map(tam_ascii)
		port map(s_jogada(2*tam_ascii-1 downto tam_ascii),
					endereco(5 downto 3),
					s_erro1);
				
	enddec2 : decodificador_endereco
		generic map(tam_ascii)
		port map(s_jogada(tam_ascii-1 downto 0),
					endereco(2 downto 0),
					s_erro2);
				
	erro <= s_erro1 or s_erro2;
	
	jogada <= s_jogada;
end architecture;
