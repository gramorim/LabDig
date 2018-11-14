entity batalha_naval_fd is
    port (
        enable_campo_local, enable_campo_adversario: in std_logic;
        clock, reset: in std_logic

    );
end entity;


architecture batalha_naval_fd_arch of batalha_naval_fd is

    component operacoes_campo is
		port (
				  clock, reset, iniciar                                                           : in std_logic;
				  operacao, dado                                                                  : in std_logic_vector(1 downto 0);
				  endereco                                                                        : in std_logic_vector(5 downto 0);
				  saida_serial, pronto                                                            : out std_logic;
				  -- depuracao
				  db_saida_serial                                                                 : out std_logic;
				  db_reseta, db_partida, db_zera, db_conta, db_carrega, db_pronto, db_we, db_fim  : out std_logic;
				  db_q                                                                            : out std_logic_vector(5 downto 0);
				  db_sel                                                                          : out std_logic_vector(1 downto 0);
				  db_dados                                                                        : out std_logic_vector(6 downto 0);
				  verifica                                                                        : out std_logic_vector(1 downto 0)
			 );
	end component;

	component recebe_jogada_UART is
		generic(	constant N_ascii  		: integer := 2;     -- Numero de characteres desejados
					constant log2_1+N		: integer := 2);
		port(
			clock, reset, enable:     in std_logic;
			entrada_serial:   		  in std_logic;
			erro:             		  out std_logic;
			pronto:					  out std_logic;
			jogada:					  out std_logic_vector(13 downto 0)--;
			--Debugging
			--db_hex5, db_hex4:         out std_logic_vector(6 downto 0);
			--db_estado_rx: 				  out std_logic_vector(3 downto 0);
			--db_tick:                  out std_logic;
			--db_contador:				  out std_logic_vector(1 downto 0);
			--db_escreve:               out std_logic;
			--hex0, hex1, hex2, hex3:   out std_logic_vector(6 downto 0);
			--db_estado:					out std_logic_vector(3 downto 0);
			--db_teste: 			 out std_logic;
		);
	end component;

	component envia_mensagem is
		generic(	constant M: integer;
					constant N: integer);
		port(	clock, reset, start	: in  std_logic;
				mensagem_sel			: in std_logic_vector (2 downto 0);
				jogada					: in std_logic_vector (13 downto 0);
				serial, o_pronto		: out std_logic;
				db_pronto, db_transm	: out std_logic;
				db_end 					: out std_logic_vector(2 downto 0);
				db_tick					: out std_logic;
				db_ascii				: out std_logic_vector(6 downto 0));
	end component;

begin


end batalha_naval_fd_arch; -- batalha_naval_fd_arch

