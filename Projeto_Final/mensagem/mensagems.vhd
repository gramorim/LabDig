library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
USE work.my_data_types.all;

entity mensagens is
	generic(	constant M : integer := 4;
				constant N : integer := 2);
	port(	endereco								: in  INTEGER RANGE 0 TO M-1;
			clock, reset, start, pronto	: in  std_logic;
			ascii									: out std_logic_vector(6 downto 0);
			o_pronto, o_start					: out std_logic);
end mensagens;

architecture mensagens_arc of mensagens is

	component mensagem_fd is
		generic(	constant M : integer := 8;
					constant N : integer := 3;
					constant filename: string := "conteudo_inicial.mif");
		port(	clock, reset, enable	: in  std_logic;
				fim						: out std_logic;
				ascii						: out std_logic_vector(6 downto 0);
				
				--depuração
				db_end : out std_logic_vector(N-1 downto 0));
	end component;
	
	component mensagem_uc is
		port(	clock, start, pronto, reset, fim			: in  std_logic;
				o_pronto, o_start, o_reset, o_enable	: out std_logic);
	end component;
	
	component generic_demux IS
		GENERIC(	inputs	: INTEGER := 16;                     -- number of inputs
					size 		: INTEGER := 8);                         -- size of each input
		PORT(	input 	: OUT STD_LOGIC_VECTOR (size-1 DOWNTO 0);
				output	: IN  MATRIX (0 TO inputs-1, size-1 DOWNTO 0);
				sel   	: IN  INTEGER RANGE 0 TO inputs-1);
	end component;
	
	component generic_mux IS
		GENERIC(	inputs	: INTEGER := 16;                     -- number of inputs
					size 		: INTEGER := 8);                         -- size of each input
		PORT(	input  	: IN  MATRIX (0 TO inputs-1, size-1 DOWNTO 0);
				sel    	: IN  INTEGER RANGE 0 TO inputs-1;
				output	: OUT STD_LOGIC_VECTOR (size-1 DOWNTO 0));
	end component;

	signal s_matrix_mux		: MATRIX(0 to M-1, 6 downto 0);
	signal s_matrix_mux_fim	: MATRIX(0 TO m-1, 0 downto 0);
	signal s_out_mux 			: std_logic_vector(6 downto 0);
	signal s_in_demux 		: std_logic_vector(1 downto 0);
	signal s_matrix_demux	: matrix(0 to M-1, 1 downto 0);
	signal s_teste 			: std_logic_vector(6 downto 0);
	signal s_fim				: std_logic_vector(0 downto 0);
begin

	UC : mensagem_uc
		port map(clock, start, pronto, reset, s_fim(0),
					o_pronto, o_start, s_in_demux(0), s_in_demux(1));
						
	MUX_ascii : generic_mux
		GENERIC map(M,7)
		PORT map(s_matrix_mux,
					endereco,
					s_out_mux);
	
	MUX_fim : generic_mux
		GENERIC MAP(m,1)
		PORT MAP(s_matrix_mux_fim,
					endereco,
					s_fim);
					
	
	MEN0 : mensagem_fd
		generic map(8,3,"conteudo_inicial.mif")
		port map(clock, s_matrix_demux(0,0), s_matrix_demux(0,1),
					s_matrix_mux_fim(0,0),
					s_matrix_mux(0,6 downto 0));
		
	MEN1 : mensagem_fd
		generic map(8,3,"conteudo_inicial.mif")
		port map(clock, s_matrix_demux(1,0), s_matrix_demux(1,1),
					s_matrix_mux_fim(1,0),
					s_matrix_mux(1));
	
	MEN2 : mensagem_fd
		generic map(8,3,"conteudo_inicial.mif")
		port map(clock, s_matrix_demux(2,0), s_matrix_demux(2,1),
					s_matrix_mux_fim(2,0),
					s_matrix_mux(2));
					
	MEN3 : mensagem_fd
		generic map(8,3,"conteudo_inicial.mif")
		port map(clock, s_matrix_demux(3,0), s_matrix_demux(3,1),
					s_matrix_mux_fim(3,0),
					s_matrix_mux(3));
	
end mensagens_arc;
