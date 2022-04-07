library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MUX3x1 is
    Port ( in_0 : in STD_LOGIC_VECTOR (15 downto 0);
           in_1 : in STD_LOGIC_VECTOR (15 downto 0);
           in_2 : in STD_LOGIC_VECTOR (7 downto 0);
           s0 : in STD_LOGIC;
           s1 : in STD_LOGIC;
           mux3x1_out : out STD_LOGIC_VECTOR (15 downto 0));
end MUX3x1;

architecture Behavioral of MUX3x1 is

    signal sel: std_logic_vector(1 downto 0);
    signal in_2_8b: std_logic_vector(7 downto 0);
    signal in_2_16b: std_logic_vector(15 downto 0);

begin

    -- extrai bit mais significativo da entrada 2
    with in_2(7) select
    in_2_8b <= (others =>'1') when '1',
               (others =>'0') when others;

    -- concatena bit mais significativo da entrada 2
    in_2_16b <= in_2_8b & in_2;
    sel <= s1 & s0;

    -- seleciona a saída do mux
    with sel select
    mux3x1_out <=  in_0 when "00",
                   in_1 when "01",
                   in_2_16b when others;

end Behavioral;
