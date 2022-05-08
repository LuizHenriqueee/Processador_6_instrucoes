library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InstructionRegister is
    Port ( clk : in STD_LOGIC;
           IR_Id : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0));
end InstructionRegister;

architecture behavorial of InstructionRegister is

begin

    -- Processo sensível ao clock para saídas síncronas.
    process(clk)
    begin
        if rising_edge(clk) then
		--Apenas quenao IR_Id está em alto que é possível carregar
		--o valor do dado.
            if (IR_Id = '1') then 
                data_out <= data_in;
            end if;
        end if;
    end process;

end behavorial;
