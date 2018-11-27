
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

entity mensagem is
	port(	clock, reset, enable	: in std_logic;
			pronto_UART				: in std_logic;
			mensagem					: in std_logic_vector (2 downto 0);
			jogada					: in std_logic_vector (13 downto 0);
			fim						: out std_logic;
			o_transmite				: out std_logic;
			ascii						: out std_logic_vector(6 downto 0);
			
			--depuração
			db_end : out std_logic_vector(N-1 downto 0));
end mensagem;

architecture mensagem_arc of mensagem is
	signal s_zero, s_ascii	: std_logic_vector(6 downto 0);
	signal s_end	: std_logic_vector(N-1 downto 0);
	signal s_write  : std_logic;

	component ram_MxN is
		GENERIC(	constant M       : integer;
					constant N       : integer;
					constant ADR     : integer;
					constant filename: string);
		PORT(	dado_entrada : IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				dado_saida   : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				endereco     : IN  STD_LOGIC_VECTOR(ADR-1 DOWNTO 0);         
				we, ce    	 : IN  STD_LOGIC);
	end component;

	component mensagem_uc is
		port(	clock, start, pronto, reset					: in  std_logic;
				mensagem									: in std_logic_vector (2 downto 0);
				jogada										: in std_logic_vector (13 downto 0);
				o_ascii										: out std_logic_vector (6 downto 0);
				endereco									: out std_logic_vector (2 downto 0);
				o_pronto, o_transmite, o_write				: out std_logic);
	end component;

begin
	UC: mensagem_uc port map (clock, enable, pronto_UART, reset, mensagem, jogada, s_ascii, s_end, fim,
								o_transmite, s_write);
	s_zero <= std_logic_vector(to_unsigned(0, 7));	
					
	RAM: ram_MxN
		GENERIC map(M,14,N,"conteudo_inicial_mensagem.mif")
		PORT map(	s_ascii,
						ascii,
						s_end,      
						s_write,'1');
		db_end <= s_end;
		
end mensagem_arc;