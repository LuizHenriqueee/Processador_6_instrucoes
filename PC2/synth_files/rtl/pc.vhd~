library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity programCounter is
    Port ( clk : in STD_LOGIC;
           PC_Id : in STD_LOGIC;
           PC_clr : in STD_LOGIC;
           PC_inc : in STD_LOGIC;
           PC_in : in STD_LOGIC_VECTOR (15 downto 0);
           PC : out STD_LOGIC_VECTOR (15 downto 0));
end programCounter;

architecture behavorial of programCounter is

    signal PC_val: STD_LOGIC_VECTOR (15 downto 0) := X"0000";

begin   

    process(clk, PC_clr)
    begin
	-- Reseta o valor do clock se solicitado
        if rising_edge(clk) then
            if PC_clr = '1' then
                PC_val <= X"0000";
            else
		--Se PC_Id, então o PC é carregado com o valor do somador.
                if PC_Id = '1' then
                    PC_val <= PC_in;
		    -- Se PC_inc, o valor é incrementado.
                elsif PC_inc = '1' then 
                    PC_val <= PC_val + X"0001";     
                end if;
            end if;
         end if;
    end process;

    --Saída atribuída assincronamente.
    PC <= PC_val;

end behavorial;
