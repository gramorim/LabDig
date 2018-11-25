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
					constant N : integer := 3);
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

	signal s_matrix_mux		: MATRIX(0 to M-1, 7 downto 0);
	signal s_out_mux 			: std_logic_vector(7 downto 0);
	signal s_in_demux 		: std_logic_vector(1 downto 0);
	signal s_matrix_demux	: matrix(0 to M-1, 1 downto 0);
begin

	UC : mensagem_uc
		port map(clock, start, pronto, reset, s_out_mux(7),
					o_pronto, o_start, s_in_demux(0), s_in_demux(1));
						
	MUX : generic_mux
		GENERIC map(M,8)
		PORT map(s_matrix_mux,
					endereco,
					s_out_mux);
					
	
end mensagens_arc;
