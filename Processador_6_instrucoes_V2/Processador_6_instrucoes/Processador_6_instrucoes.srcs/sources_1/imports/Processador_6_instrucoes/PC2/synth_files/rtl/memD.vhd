----------------------------------------------------------------------------------
-- Company: Universidade de Brasília
-- Engineer: Felipe Roderigues Sobrinho
-- 
-- Create Date: 04/06/2022 09:46:28 AM
-- Design Name: Memória RAM 256x16
-- Module Name: memD - Behavioral
-- Project Name: Processador de 6 instruções
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision: 0.01
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memD is
    Port ( clk : in STD_LOGIC;
           addr : in STD_LOGIC_VECTOR (7 downto 0);
           D_rd : in STD_LOGIC;
           D_wr : in STD_LOGIC;
           W_data : in STD_LOGIC_VECTOR (15 downto 0);
           R_data : out STD_LOGIC_VECTOR (15 downto 0));
end memD;



architecture behavorial of memD is

    type array_mem is array ((25 - 1) downto 0) of STD_LOGIC_VECTOR (15 DOWNTO 0);
    signal memory: array_mem;
    
    
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if D_wr = '1' then
                 memory(CONV_INTEGER(addr)) <= W_data;
            end if;
        end if;
    end process;

    with D_rd select
   R_data <= memory(CONV_INTEGER(addr)) when '1',
             (others=>'Z') when others;
    
end behavorial;
