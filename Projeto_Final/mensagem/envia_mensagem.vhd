
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity envia_mensagem is
	generic(	constant M: integer := 434;
				constant N: integer := 9);
	port(	clock, reset, start	: in  std_logic;
			mensagem_sel			: in std_logic_vector (2 downto 0);
			jogada					: in std_logic_vector (13 downto 0);
			serial, o_pronto		: out std_logic;
			db_pronto				: out std_logic;
			db_end 					: out std_logic_vector(2 downto 0));
end envia_mensagem;

architecture teste_arc of envia_mensagem is
	signal s_pronto, s_start, s_reset, s_transm : std_logic;
	signal s_ascii : std_logic_vector(6 downto 0);

	component mensagem is
		generic(	constant M : integer := 8; --Tamanho da memoria
					constant N : integer := 3; --Num bits do tamanho
					constant filename: string := "conteudo_inicial.mif");
		port(	clock, reset, enable	: in std_logic;
				pronto_UART				: in std_logic;
				mensagem				: in std_logic_vector (2 downto 0);
				jogada					: in std_logic_vector (13 downto 0);
				fim						: out std_logic;
				o_transmite				: out std_logic;
				ascii					: out std_logic_vector(6 downto 0);
				
				--depuração
				db_end : out std_logic_vector(N-1 downto 0));
	end component;
	
	component tx_serial is
    port (	clock, reset, partida, paridade: in std_logic;
				dados_ascii: in std_logic_vector (6 downto 0);
				saida_serial, pronto : out std_logic);
	end component;
	
begin
	
	s_reset <= reset;
	s_start <= start;

	MEN : mensagem
		port map(	clock, s_reset, s_start, s_pronto,
						mensagem_sel, jogada, o_pronto,
						s_transm, s_ascii, open);
						
	TX : tx_serial
		 port map(	clock, s_reset, s_transm, '0',
						s_ascii,
						serial, s_pronto);
						
	--db_pronto <= s_pronto;
			
end teste_arc;
