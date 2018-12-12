library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity BatalhaNaval is
  port (
    clock, reset                : in std_logic;
    vez, jogar                  : in std_logic;
    entrada_serial_terminal     : in std_logic;
    entrada_serial_adversario   : in std_logic;

    saida_serial_terminal       : out std_logic;
    saida_serial_adversario     : out std_logic;
    fazer_jogada                : out std_logic;
    pronto                      : out std_logic;
    
    HEX5_Jogada                 : out std_logic_vector (6 downto 0);
    HEX4_Jogada                 : out std_logic_vector (6 downto 0);
    HEX3_Resultado              : out std_logic_vector (6 downto 0);
    HEX2_Jogador_Vez            : out std_logic_vector (6 downto 0);
    HEX1_Placar_Jogador         : out std_logic_vector (6 downto 0);
    HEX0_Placar_Adversario      : out std_logic_vector (6 downto 0)              
  );
end BatalhaNaval;

architecture BatalhaNavalArch of BatalhaNaval is


    component BatalhaNaval_fd is
      generic(	constant ratio 		: integer := 434; --Baud rate
        constant log2_ratio 	: integer := 9;
        constant tam_ascii 	: integer := 7;   -- tamanho do ascii 7 ou 8
        constant paridade 	: std_logic := '0'; -- paridade 0 par, 1 impar
        constant end_bit 		: integer := 2;
        constant numJogadas : integer := 13;
        constant log2_numJogadas : integer := 4);  -- tamanho end bit 1 ou 2

      port(	clock, reset, jogar, vez														: in  std_logic;
        entrada_serial_terminal, entrada_serial_adversario 					: in  std_logic;
        conta_adv, conta_jog																: in std_logic;
        placar_adv, placar_jog															: out std_logic_vector(3 downto 0);
        saida_serial_terminal, saida_serial_adversario							: out std_logic;
        jogada_1, jogada_0, resultado, placar_jogador, placar_adversario 	: out std_logic_vector(tam_ascii-1 downto 0);
        fazer_jogada, pronto, ganhei, ganhou													: out std_logic);
    end component;

    component ascii_to_7seg is

      port ( jogada_linha, jogada_coluna: in std_logic_vector(6 downto 0);
    
             linha, coluna: out std_logic_vector (6 downto 0));
    
    end component;
    
begin

    --signal jogada_linha, jogada_coluna : std_logic_vector(6 downto 0);


end BatalhaNavalArch; -- BatalhaNavalArch