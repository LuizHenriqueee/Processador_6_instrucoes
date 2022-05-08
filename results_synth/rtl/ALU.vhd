library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           alu_s1 : in STD_LOGIC;
           alu_s0 : in STD_LOGIC;
           alu_out : out STD_LOGIC_VECTOR (15 downto 0));
end ALU;

architecture Behavioral of ALU is

    signal alu_s : std_logic_vector(1 downto 0);
    signal sum , sub : std_logic_vector(15 downto 0);

begin

    sum <= std_logic_vector(signed(A) + signed(B)); -- Faz operação de soma
    sub <= std_logic_vector(signed(A) - signed(B)); -- Faz operação de subtração
    alu_s <= alu_s1 & alu_s0; -- Concatena bits de seleção

    -- Seleciona saída dependendo da operação
    with alu_s select
        alu_out <=  A when "00",
                   sum when "01",
                   sub when others;

end Behavioral;
