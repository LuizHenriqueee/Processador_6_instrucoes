library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegisterFile is
    Port ( clk : in STD_LOGIC;
           W_RF_data : in STD_LOGIC_VECTOR (15 downto 0);
           W_addr : in STD_LOGIC_VECTOR (3 downto 0);
           W_wr : in STD_LOGIC;
           Rp_addr : in STD_LOGIC_VECTOR (3 downto 0);
           Rp_rd : in STD_LOGIC;
           Rq_addr : in STD_LOGIC_VECTOR (3 downto 0);
           Rq_rd : in STD_LOGIC;
           Rp_data : out STD_LOGIC_VECTOR (15 downto 0);
           Rq_data : out STD_LOGIC_VECTOR (15 downto 0));
end RegisterFile;

architecture behavorial of RegisterFile is

    type registerFile is array(15 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
    signal RF : registerFile; -- Memoria do banco de registradores


begin

     --processo para leitura no banco de registradores
    mem_rd: process(clk)
    begin    
        if rising_edge(clk) then
            if(Rp_rd = '1') then
                Rp_data <= RF(CONV_INTEGER(Rp_addr));
            end if;
            if(Rq_rd = '1') then
                Rq_data <= RF(CONV_INTEGER(Rq_addr));
            end if;
        end if;
    end process;
    
    -- escrita no banco de resgistradores
    
    RF(CONV_INTEGER(W_addr)) <= W_RF_data when W_wr='1';

end behavorial;
