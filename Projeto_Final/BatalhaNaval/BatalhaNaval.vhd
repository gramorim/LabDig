entity BatalhaNaval is
  port (
    clock, reset                : in std_logic;
    vez, jogar                  : in std_logic;
    entrada_serial_terminal     : in std_logic;
    entrada_serial_adversario   : in std_logic;

    saida_serial_terminal       : out std_logic;
    saida_serial_adversario     : out std_logic;
    fazer_jogada                : out std_logic;
    pronto                      : out std_logic    
  );
end BatalhaNaval;

architecture BatalhaNavalArch of BatalhaNaval is

    signal 

    component BatalhaNaval_fd is
        generic(	constant ratio 		: integer := 434; --Baud rate
                    constant log2_ratio 	: integer := 9;
                    constant tam_ascii 	: integer := 7;   -- tamanho do ascii 7 ou 8
                    constant paridade 	: std_logic := '0'; -- paridade 0 par, 1 impar
                    constant end_bit 		: integer := 2);  -- tamanho end bit 1 ou 2
        port(	clock, reset, jogar, vez														: in  std_logic;
                entrada_serial_terminal, entrada_serial_adversario 					: in  std_logic;
                saida_serial_terminal, saida_serial_adversario							: out std_logic;
                jogada_1, jogada_0, resultado, placar_jogador, placar_adversario 	: out std_logic_vector(tam_ascii-1 downto 0);
                fazer_jogada, pronto, ganhei													: out std_logic);
    end component;

begin

end BatalhaNavalArch ; -- BatalhaNavalArch